$(document).ready(function() {
var initialLocaleCode = 'es-us';
    $('#calendar').fullCalendar({
    	events: '/actividades.json',
    	customButtons: {
	    myCustomButton: {
	      text: 'Agregar Actividad',
	      click: function() {
	        window.location='/actividades/new';
	      }
	    },
	    myCustomButton2: {
	      text: 'Todas',
	      click: function() {
	        window.location='/actividades';
	        }
	      },
	    },
	  	eventLimit: true, // for all non-agenda views
		  views: {
		    month: {
		      eventLimit: 4 // adjust to 4 only for month view
		    }
		},
		views: {
	       listDay:{ buttonText: 'Hoy' }
		},
		eventLimitText: "tareas",
        height: 600,
        lang: 'es',
		theme: true,
		header: {
			left: 'prev,next today, myCustomButton',
			center: 'title',
			right: 'month,basicWeek,listDay, myCustomButton2'
		},
      	navLinks: true, // can click day/week names to navigate views
		editable: false,
		defaultView: 'month'
    })
});