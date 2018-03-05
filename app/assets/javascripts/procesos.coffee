# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
`$( "#empleado_id" ).select2({
});`
`$( "#cliente_id" ).select2({
});`

`$(document).ready(function() {
    var last=  $('#numero').val();
    if(isNaN(last)){
        last=0;
    }
    $(document).on('nested:fieldAdded', function(event){
    // this field was just inserted into your form
     last++;
     $(".datepicker").datepicker({
     dateFormat: 'dd/mm/yyyy',
     autoSize:true,
     language: 'es',
     orientation: 'top'
     });
     $('#numero').val(last);
    });
});`

`$('form').on('nested:fieldAdded', function(event) {
  $(event.target).find(':input').enableClientSideValidations();
});`

`$('.select2-selection').css('border-radius','0px')`
`$('.select2-container').children().css('border-radius','0px')` 

`$('.datepicker').datepicker({
	format: 'dd/mm/yyyy',
	language: 'es',
	orientation: 'bottom'
});`
