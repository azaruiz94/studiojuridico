// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require select2
//= require select2_locale_es
//= require select2-full
//= require bootstrap-sprockets
//= require jquery_nested_form

//= require moment 
//= require fullcalendar
//= require fullcalendar/lang/es.js
//= require bootstrap-datepicker
//= require bootstrap-datepicker/locales/bootstrap-datepicker.es.js

//= require app
//= require_tree .

$(document).ready(function() {
  $("#proceso_tipo_proceso_id").change(function(){
    var seleccion = $("#proceso_tipo_proceso_id").val();
    console.log("seleccion= %o", seleccion);
    $.ajax({
      url: "/procesos/cargar_fases",
      type: "POST",
      data: {
        tipo_proceso_id: seleccion
      },
      dataType: "json",
      success: function(val) {
        //Convert a JavaScript object into a string with JSON.stringify()
        //Parse the data with JSON.parse(), and the data becomes a JavaScript object
        var obj = jQuery.parseJSON(JSON.stringify(val));
        for (i = 0; i < obj.length; i++) { 
          $("#proceso_detalles_etapa").html(obj[i].nombre);
          $("#proceso_detalles_estado").html(obj[i].estado);
          console.log("%o", obj[i].nombre);
          console.log("%o", obj[i].estado);
        }
      }
    });
  });
});
