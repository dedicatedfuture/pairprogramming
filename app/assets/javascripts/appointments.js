$(document).ready(function() {

    // page is now ready, initialize the calendar...

   
     $('#calendar').fullCalendar({
     		eventSources: [
 		{
 			url: '/appointments/22'
 		}
 		
	],
     	    events: [
        {
            title  : 'Availability',
            url: '/availabilities/1',
         	
            color: 'green',
           
        } 
    ]

        // put your options and callbacks here
    })

});