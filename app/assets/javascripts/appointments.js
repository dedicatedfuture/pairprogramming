$(document).ready(function() {

    // page is now ready, initialize the calendar...

   
     $('#mycalendar').fullCalendar({
     		eventSources: 
            [
         		{
         			url: '/appointments/currentuserjson' 
         		}, 
                {
                    url: '/appointments/currentusermenteejson',
                    color: 'yellow'
                },
                {
                    title  : 'Availability',
                    url: '/availabilities/currentuserjson',
                    color: 'green'
                }
        	]
     
        // put your options and callbacks here
    })

     $('#otherusercalendar').fullCalendar({
            eventSources: 
            [
                {
                    url: '/appointments/otheruserjson/' + $('.contentwrapper').data('user-id')
                }, 
                {
                    url: '/appointments/otherusermenteejson/' + $('.contentwrapper').data('user-id'),
                    color: 'yellow'
                },
                {
                    title  : 'Availability',
                    url: '/availabilities/otheruserjson/' + $('.contentwrapper').data('user-id'),
                    color: 'green'
                }
            ]
     
        // put your options and callbacks here
    })

});