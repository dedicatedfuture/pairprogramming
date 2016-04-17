$(document).ready(function() {

    // page is now ready, initialize the calendar...

   
     $('#calendar').fullCalendar({
     		eventSources: [
 		{
 			url: '/appointments/28'
 		}
 		
	],
     	    events: [
        {
            title  : 'Availability',
            // url: '/availabilities/2',
            start: '10:00',
            end: '11:00',
            color: 'green',
            dow: [4]
        } 
    ]

        // put your options and callbacks here
    })

});