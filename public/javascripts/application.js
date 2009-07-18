
var log = function(message) { // don't error if the browser doesn't run firebug
    if (console) console.log(message);
};

var tehnt = {
    init: function(item) {
       item.find('.date').datepicker();
        $("#ui-datepicker-div").addClass("promoteZ");
       $('.reservation').live('click', function() {
           tehnt.selectReservationDates($(this).attr("campground_id"),
                   $(this).attr("campground_name") );
       });
    }    
};


tehnt.selectReservationDates = function(campground_id, campground_name) {
    tehnt.currentCampgroundId = campground_id;
    
    var dialog = $('#reservation_dates').dialog({
        modal:true,
        width:500,
        buttons: { "Submit" : tehnt.submitReservation},
        beforeclose:function() {$("#ui-datepicker-div").hide();}
    });

    $('.ui-dialog-title').text("Select camping dates for " + campground_name);

    dialog.dialog('open');
};

tehnt.submitReservation = function() {

    var startDate = $('#startDate').datepicker('getDate');
    var endDate = $('#endDate').datepicker('getDate');

    if (!startDate || !endDate) {
      tehnt.showMessage("Please select a Start Date and End Date.");
      return false;
    }

    if(startDate >= endDate) {
      tehnt.showMessage("Start date must be before the End Date.");
      return false;
    }

    log(startDate.getMonth() + 1);

    log(startDate.getDate());
    log(startDate.getFullYear());

    


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

$(function() {
   tehnt.init($('body'));
});




