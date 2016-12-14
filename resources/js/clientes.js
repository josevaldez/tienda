$(function () {
 	$('.cliente-detalle').hide();

	$('.plusBtn').on('click', function(){
		cargarDataCliente(-1);
	});

	cargarListado();

});

function cargarListado(){
	$('.back').remove();
	$.ajax({
		url : "ajax/listarClientes",
		data : {
			'csrf_yoco_tok_name' : function(){ return ($('#token').val() != "") ? $('#token').val() : "";},
			//'tipoEstado' : function(){ return ($.trim($('#tipoEstado').val()) != "") ? $('#tipoEstado').val() : "";},
		},
		dataType : "json", type: "POST",
		beforeSend: function(){},
		success: function(data){
			if(data.error){
				$('#products').append('Intente mas Tarde.');
			}
			else{
				$('#products').append(data.HTML);
			}
		},
		error: function (){/*$(element).next('div').html('Intente mas Tarde.');*/}
	});
}

function cargarDataCliente(idCliente){
	$('#ventanaDetalleContenido').html('');
	$.ajax({
		url : "ajax/dataCliente",
		data : {
			'csrf_yoco_tok_name' : function(){ return ($('#token').val() != "") ? $('#token').val() : "";},
			'idCliente' : idCliente,
		},
		dataType : "json", type: "POST",
		beforeSend: function(){$('#loadData').show();},
		success: function(data){
			if(data.error){
				//$('#products').append('Intente mas Tarde.');
			}
			else{
				$('#ventanaDetalleContenido').html(data.HTML);
				$('.overlay-container').fadeIn(function() {
					$('#loadData').hide();
					window.setTimeout(function(){
						$('.window-container').addClass('window-container-visible');
					}, 100);
				});
			}
		},
		error: function (){/*$(element).next('div').html('Intente mas Tarde.');*/$('#loadData').hide();}
	});
}