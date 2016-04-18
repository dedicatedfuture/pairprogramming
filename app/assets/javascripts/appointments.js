$(document).ready(function() {

    // page is now ready, initialize the calendar...

   
     $('#calendar').fullCalendar({
     		eventSources: 
            [
         		{
         			url: '/appointments/36'
         		}, 
                {
                    title  : 'Availability',
                    url: '/availabilities',
                    color: 'green'
                }
        	]
     
        // put your options and callbacks here
    })

});