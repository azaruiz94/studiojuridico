# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
`$(document).ready(function() {
var initialLocaleCode = 'es-us';
    $('#calendar').fullCalendar({
        height: 600,
        lang: 'es',
		theme: true,
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,basicWeek,basicDay,listDay,listWeek'
			},
      	navLinks: true, // can click day/week names to navigate views
		businessHours: true, // display business hours
		editable: true,
		eventLimit: false,
		defaultView: 'month'
    })

});`