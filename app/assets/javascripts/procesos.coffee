# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery ->
$(".js-procesos-placeholder-single").select2({
    placeholder: "Seleccione el cliente",
    allowClear: true,
    language: "es"
});

jQuery ->
$(".js-empleado-placeholder-single").select2({
    placeholder: "Seleccione el encargado",
    allowClear: true,
    language: "es"
});

jQuery ->
$(".js-tipo-placeholder-single").select2({
    placeholder: "Seleccione el tipo de proceso",
    allowClear: true,
    language: "es"
});

`$('.datepicker').datepicker({
	format: 'dd/mm/yyyy',
	language: 'es',
	orientation: 'bottom'
});`

`$('.datepicker').datepicker({
	format: 'dd/mm/yyyy',
	language: 'es',
	orientation: 'bottom'
});`
