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
                    color: 'yellow',
                    textColor: 'black'
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

         dayClick: function(date, jsEvent, view) {

                $('#modalinfoouter').show();
                $('#modalinfo').css("display", "block");
                var datey = new Date(date)
                $('#appointment_start').val((datey.getMonth() + 1) + '/' + (datey.getDate() + 1) + '/' +  datey.getFullYear());
                $('#appointment_end').val((datey.getMonth() + 1) + '/' + (datey.getDate() + 1)+ '/' +  datey.getFullYear());
              
               

            },
            eventSources: 
            [
                {
                    url: '/appointments/otheruserjson/' + $('.contentwrapper').data('user-id')
                }, 
                {
                    url: '/appointments/otherusermenteejson/' + $('.contentwrapper').data('user-id'),
                    color: 'yellow',
                    textColor: 'black'
                },
                {
                    title  : 'Availability',
                    url: '/availabilities/otheruserjson/' + $('.contentwrapper').data('user-id'),
                    color: 'green'
                }
            ]
     
        // put your options and callbacks here
    })

     $('.close').click(function(){
      $(this).parent().parent().css("display", "none");
   })
});