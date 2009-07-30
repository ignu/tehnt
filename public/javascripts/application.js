

var log = function(message) { // don't error if the browser doesn't run firebug
    //try{console.log(message);} catch(ex) { };
};

var tehnt = {
    init: function(item) {
       $('.required').blur($(this).validate);
       tehnt.campsiteSelection.init();
       item.find('.date').datepicker();
       $("#ui-datepicker-div").addClass("promoteZ");
       tehnt.submit_campsite_selection();
       tehnt.markAsPaid.init();
       $('.reservation').live('click', function() {
       tehnt.selectReservationDates($(this).attr("campground_id"),
          "Select camping dates for " + $(this).attr("campground_name"),
          tehnt.submitReservation);
       });
       $('.reportrange').live('click', function() {
       tehnt.selectReportDates(
          "Select camping dates for Report",
          tehnt.submitReportrange);
       });   
       $('#create_reservation').submit(tehnt.toc.show);

       var flashText = $('div.notice').text();

       if(flashText) tehnt.showMessage(flashText);

       $('.nav').css('padding-top', '15px');
       $('.nav').css('padding-bottom', '10px');
    }
};


tehnt.campsiteSelection = {
    init : function()  {
        $('ul.campsites li div.available').live('click', function() {
            $(this).toggleClass('selected');
        });
    }
};

tehnt.selectReservationDates = function(campground_id, title, callback) {
    tehnt.currentCampgroundId = campground_id;    
    var dialog = $('#reservation_dates').dialog({
        modal:true,
        width:500,
        buttons: { "Submit" : callback},
        beforeclose:function() {$("#ui-datepicker-div").hide();}
    });

    $('.ui-dialog-title').text(title);

    dialog.dialog('open');
};

tehnt.selectReportDates = function(title, callback) {    
    var dialog = $('#reservation_dates').dialog({
        modal:true,
        width:500,
        buttons: { "Submit" : callback},
        beforeclose:function() {$("#ui-datepicker-div").hide();}
    });

    $('.ui-dialog-title').text(title);

    dialog.dialog('open');
};


tehnt.submitReservation = function() {

    var dates = tehnt.submitReservation.getValidDates();
    if (!dates) return false;
    var startDate = dates.startDate;
    var endDate = dates.endDate;
    
    window.location = '/campgrounds/' +
        tehnt.currentCampgroundId + '/reservations/start/' +
              startDate.getFullYear() + "/" +
              (startDate.getMonth() + 1) + "/" +
              startDate.getDate() + "/end/" +
              endDate.getFullYear() + "/" +
              (endDate.getMonth() + 1) + "/" +
              endDate.getDate();
};

tehnt.submitReportrange = function() {

    var dates = tehnt.submitReportrange.getValidDates();
    if (!dates) return false;
    var startDate = dates.startDate;
    var endDate = dates.endDate;
    
    window.location = '/reports/start/' +
              startDate.getFullYear() + "/" +
              (startDate.getMonth() + 1) + "/" +
              startDate.getDate() + "/end/" +
              endDate.getFullYear() + "/" +
              (endDate.getMonth() + 1) + "/" +
              endDate.getDate();
};

tehnt.submitReportrange.getValidDates = function() {
    var startDate = $('#startDate').datepicker('getDate');
    var endDate = $('#endDate').datepicker('getDate');

    if (!startDate || !endDate) {
      tehnt.showMessage("Please select a Start Date and End Date.");
      return false;
    }

    if(startDate > endDate) {
      tehnt.showMessage("Start date must be before the End Date.");
      return false;
    }

    return {startDate:startDate, endDate:endDate};
};


tehnt.submitReservation.getValidDates = function() {
    var startDate = $('#startDate').datepicker('getDate');
    var endDate = $('#endDate').datepicker('getDate');

    if (!startDate || !endDate) {
      tehnt.showMessage("Please select a Start Date and End Date.");
      return false;
    }

    if(startDate > endDate) {
      tehnt.showMessage("Start date must be before the End Date.");
      return false;
    }

    // TODO:
    // HACK: should get this server site
    var cutoff_date =new Date(new Date().setDate(new Date().getDate()+3));

    if (startDate < cutoff_date) {
      tehnt.showMessage("Reservations must be made at least three days in advance.");
      return false;
    }

    return {startDate:startDate, endDate:endDate};
};

tehnt.showMessage = function(data) {
  if (!tehnt.messageCount)
    tehnt.messageCount = 0;
    tehnt.messageCount++;
    var messageID = "filterArray" + tehnt.messageCount;
    var newMessage = $('<div class="message ui-state-highlight" id="' + messageID + '" name="' + messageID + '">' + data + "</div>");
    $('#flashMessage').append(newMessage);
    setTimeout("$('#" + messageID + "').fadeOut('fast');", 4200);
};


tehnt.submit_campsite_selection = function() {
    $('#campsite_selection').submit(function() {
       var selectedCampsites = $('#campsite_selection ul li div.selected');

       if(!selectedCampsites.length) {
           tehnt.showMessage("At least one campsite must be selected!");
           return false;
       }

       var campsites = "";
       selectedCampsites.each(function() {campsites += $(this).attr("campsiteId") + ",";});

       $("#campsite_selection").append('<input type="hidden" name="selected_campsites" value="' + campsites + '">');

    });
}

$(function() {
   tehnt.init($('body'));
});

tehnt.markAsPaid = {};
tehnt.markAsPaid.init = function() {
    $('.not_paid').live('click', tehnt.markAsPaid.get_payment_toggle_function(true));
    $('.paid_in_full').live('click', tehnt.markAsPaid.get_payment_toggle_function(false));
};

tehnt.markAsPaid.get_payment_toggle_function = function(isPaid) {
    var paid = isPaid;
    return function() {
        var reservation_id = $(this).attr("reservation_id");
        var element = $(this);  // sry, 2hr sleep can no think mor
       $.ajax({
          url: "/reservations/set_paid/" +reservation_id,
          dataType:"text",
          data:{reservation_id : reservation_id, value:paid},
          error:function() {tehnt.showMessage("Error.");},
          success:function(message) {
              tehnt.showMessage(message);
              element.togglePaymentStatus();
              $('#paidInFullStatus' + reservation_id).text(paid? 'yes': 'no');
          },
          type:'POST'
       });
      return false;
    };  
};

tehnt.toc = {};

tehnt.toc.show = function() {  // terms and conditoins
    var parentForm = $(this);
    if (!parentForm.validateForm()) return false;
    tehnt.toc.dialog = $('<div class="jquery-dialog">').dialog({
        title:"Rules and Regulations", 
        modal:true,
        width:600,
        position:'top', 
        buttons:{            
            Accept:function() {$('#create_reservation').unbind(); parentForm.submit();},
            Reject:function(){tehnt.toc.dialog.dialog("destroy");}
        }
    });
    tehnt.toc.dialog.css("overflow-y", "auto");
    tehnt.toc.dialog.css("height", "300px");
    tehnt.toc.dialog.load('/rules.html');
    return false;
};


$.fn.togglePaymentStatus = function() { // orly?
    if ($(this).text().indexOf('Unpaid') > 0) {
        $(this).text("Mark as Paid");
        $(this).addClass("not_paid");
        $(this).removeClass("paid_in_full");
    }
    else {
        $(this).text("Mark as Unpaid");
        $(this).removeClass("not_paid");
        $(this).addClass("paid_in_full");
    }
};


$.fn.validate = function() {
    try{
    var alertFirst;
    var valid = true;
    $(this).each(function() {
         var field = $(this);
         if (!field.val()) {
             if (!alertFirst) alertFirst = function() {
                 tehnt.showMessage(field.attr('message'));
                 field.focus();
             };
             field.addClass('invalid');
             valid = false;
         } else {
             field.removeClass('invalid');
         }
    });
    if(alertFirst) alertFirst();
    }
    catch (e) {
        tehnt.showMessage(e);
        return false;
    }

        return valid;
};

$.fn.validateForm = function() {
  var form = $(this);
  return form.find('.required').validate();
};