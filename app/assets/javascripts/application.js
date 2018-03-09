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
//= require app
//= require ckeditor/init
//= require toastr
//= require rails.validations
//= require bootstrap-sprockets
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require autocomplete-rails
//= require select2
//= require select2_locale_es
//= require select2-full
//= require jquery_nested_form
//= require moment 
//= require client_side_select2
//= require fullcalendar
//= require fullcalendar/lang/es.js
//= require bootstrap-datepicker
//= require bootstrap-datepicker/locales/bootstrap-datepicker.es.js
//= require filterrific/filterrific-jquery
//= require_tree .
$(document).ready(function() {
  $("#juicio_tipo_proceso").change(function(){
    var seleccion = $("#juicio_tipo_proceso").val();
    var seleccion2 = $("#juicio_proceso").val();
    $.ajax({
      url: "/juicios/cargar_select",
      type: "POST",
      data: {
        proceso: seleccion2,
        tipo_proceso: seleccion
      },
      dataType: "json",
      success: function(response) {
         $("#objeto_id").empty();
        //Convert a JavaScript object into a string with JSON.stringify()
        //Parse the data with JSON.parse(), and the data becomes a JavaScript object
        var obj = jQuery.parseJSON(JSON.stringify(response));
        for (i = 0; i < obj.length; i++) {
          console.log("%o", obj[i].nombre);
          $("#objeto_id").append("<option value= "+obj[i].id+">"+obj[i].nombre+"</option>");
        }
      }
    });
  });
});

$(document).ready(function() {
  $('#existe_ciudad').hide();
  $("#nombre_ciudad").change(function(){
    var entrada = $("#nombre_ciudad").val();
    $.ajax({
      url: "/ciudades/check_uniqueness",
      type: "POST",
      data: {
        nombre: entrada
      },
      dataType: "json",
      success: function(response) {
        jQuery.parseJSON(response)
        if(response >= 1){
          $("#nombre_ciudad").addClass("field_with_errors");
          $("#error_field").addClass("field_with_errors");
          $('#existe_ciudad').show();

        }else{
          $("#nombre_ciudad").removeClass("field_with_errors");
          $("#error_field").removeClass("field_with_errors");
          $('#existe_ciudad').hide();
        }
      }
    });
  });
});


/*$(document).ready(function() {
  $('#bt1').click(function() {
    $('#fecha_ingreso').val('14/02/2018');      
  });
});*/

/*$(document).ready(function() {
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
});*/
