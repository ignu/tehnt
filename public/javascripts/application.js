
var tehnt = {
    init: function(item) {
       item.find('.date').datepicker();
        $("#ui-datepicker-div").addClass("promoteZ");
       $('#reservation').live('click', function() {
           tehnt.selectReservationDates();
           return false;
       });
    }    
};

tehnt.selectReservationDates = function() {
    $('#reservation_dates').dialog({
        modal:true,
        title:"Select your camping dates",
        width:500,
        buttons: { "Submit" : tehnt.submitReservation}
    });
};

tehnt.submitReservation = function() {
    var startDate = $('#startDate').datepicker('getDate');
    var endDate = $('#endDate').datepicker('getDate');

    if (!startDate || !endDate)
      tehnt.showMessage("Please.  Select a Start Date and End Date.");

    alert('you selected' + startDate + endDate);

};

tehnt.showMessage = function(data) {
  if (!tehnt.messageCount)
    tehnt.messageCount = 0;
    tehnt.messageCount++;
    var messageID = "filterArray" + tehnt.messageCount;
    var newMessage = $('<div class="message ui-state-highlight" id="' + messageID + '" name="' + messageID + '">' + data + "</div>");
    $('#flashMessage').append(newMessage);
    setTimeout("$('#" + messageID + "').fadeOut('fast');", 5000);
};

$(function() {
   tehnt.init($('body'));
});




