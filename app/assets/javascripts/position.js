// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {

    // page is now ready, initialize the calendar...

    $('#calendar').fullCalendar({
        lang: 'zh-cn',
        firstDay: 0,
        height: 500,
        events: '/position/feeds',
        eventClick: function(calEvent, jsEvent, view) {
            window.location.href = '/position/show/' + calEvent.id;
        },
        
    });

});
