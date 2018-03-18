function colapsarSidebar() {
	$("body").removeClass("sidebar-open");
    $("body").addClass("sidebar-collapse");
}

function hideTable(){
	$("#procesos_table").css("display", "none");
	$("#titulo").css("display", "none");
}

function hideJuiciosTable(){
	$("#juicios_table").css("display", "none");
	$("#juicios_titulo").css("display", "none");
}

function hideReportInfo(){
	$("#report_info").css("display", "none");
}

function showReportInfo(){
	$("#report_info").css("display", "block");
}


