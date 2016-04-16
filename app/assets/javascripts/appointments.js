$(document).ready(function() {

    // page is now ready, initialize the calendar...

    $.get(
    "http://localhost:3000/appointments/20",
    "{key:value}",
    function(data) { alert(data); },
    "html"
);
     $('#calendar').fullCalendar({
     		eventSources: [
 		{
 			url: '/appointments/22'
 		}
	]
    //  	    events: [
    //     {
    //         title  : 'event2',
    //         start  : '2016-04-16T12:30:00',
    //         end    : '2016-04-17T12:30:00'
    //     } 
    // ]

        // put your options and callbacks here
    })

});