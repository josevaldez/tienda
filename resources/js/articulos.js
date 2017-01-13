var cont = 0;
$(function () {
 	$('.cliente-detalle').hide();

	$('.plusBtn').on('click', function(){
		cargarDataCliente(-1);
	});

	cargarListado();
	//$( "#products" ).selectable();
	$('#inputSearch').onEnter(function(){
		cargarListado();
	});
	$('#btnSearch').click(function(event) {
		$('#inputSearch').val('');
		cargarListado();
		$('#btnSearch').hide();
	});
	$('#inputSearch').keydown(function(event) {
		if($.trim($('#inputSearch').val()) != ''){
			$('#btnSearch').show();
		}
		else{
			$('#btnSearch').hide();
		}
	});
});

function cargarListado(){
	$('.back').remove();
	if(cont != 0){$( "#products" ).selectable("destroy");}
	$.ajax({
		url : "ajax/listarArticulos",
		data : {
			'csrf_yoco_tok_name' : function(){ return ($('#token').val() != "") ? $('#token').val() : "";},
			'inputSearch' : function(){ return ($.trim($('#inputSearch').val()) != "") ? $('#inputSearch').val() : "";},
		},
		dataType : "json", type: "POST",
		beforeSend: function(){},
		success: function(data){
			if(data.error){
				$('#products').append('Intente mas Tarde.');
			}
			else{
				$('#products').append(data.HTML);
				$( "#products").unbind( "mousedown" );
				$( "#products" ).selectable();cont++;
			    $( "#products" ).bind( "mousedown", function ( e ) {
			    	if(e.metaKey != false || e.ctrlKey != false){
			    		//CLICK CON CONTROL
			    		//console.log("controlPress");

			    		$('#deleteClientes, #sendClientes').removeClass('hidden');

			    	}
			    	else{
			    		//CLICK SIN CONTROL
			    		$('#deleteClientes, #sendClientes').addClass('hidden');
			    		//console.log("controlUNPress");
			    		var ele = e.target;
			    		setTimeout(function(){$(ele).removeClass('ui-selected');},100);
			    		if(!$(ele).hasClass('btnEliminarLista') && !$(ele).hasClass('newProspecto')  && $(ele).hasClass('back')){
				    		cargarDataCliente($(ele).attr('data-idArticulo'));
				    	}
				    	else if($(ele).hasClass('btnEliminarLista') && !$(ele).hasClass('newProspecto')){
				    		deleteCliente($(ele).attr('data-idArticulo'));
				    	}
				    	else if($(ele).hasClass('btnAddLista') ){
				    		$('.plusBtn').trigger('click');
				    		setTimeout(function(){$('.plusBtn').removeClass('ui-selected');
				    		$('.plusBtn').parent().removeClass('ui-selected');
				    		$('.plusBtn').parent().parent().removeClass('ui-selected');},100);
				    	}

			    	}
				} );
			}
		},
		error: function (){$( "#products").unbind( "mousedown" );
				$( "#products" ).selectable();cont++;/*$(element).next('div').html('Intente mas Tarde.');*/}
	});
}

function cargarDataCliente(idCliente){
	//console.log(event);
	$('#ventanaDetalleContenido').html('');
	$.ajax({
		url : "ajax/dataArticulo",
		data : {
			'csrf_yoco_tok_name' : function(){ return ($('#token').val() != "") ? $('#token').val() : "";},
			'idArticulo' : idCliente,
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

function deleteCliente(idCliente){
	var titulo = "Desea Eliminar a los Articulos Seleccionados?";
	if(idCliente != 0){
		var titulo = "Desea Eliminar al Articulo Seleccionado?";
	}
	pregunta(titulo, '','INFO', 'deleteClienteFuncion', idCliente);
}

function deleteClienteFuncion($idCliente){
	if($idCliente == 0){
		$('#products').find('li.ui-selected').each(function(index, el) {
			$idCliente = $idCliente+','+$(el).attr('data-idArticulo');
		});
	}
	$.ajax({
		url : "ajax/eliminarArticulo",
		data : {
			'csrf_yoco_tok_name' : function(){ return ($('#token').val() != "") ? $('#token').val() : "";},
			'idArticulo' : $idCliente,
		},
		dataType : "json", type: "POST",
		beforeSend: function(){$('#loadData').show();},
		success: function(data){
			if(data.error){
				mensaje('No se pudo realizar la acción.','Favor de intentar mas tarde.','ERROR');
			}
			else{
				$('#loadData').hide();
				cargarListado();
				mensaje('Se elimino correctamente.','','OK');
			}
		},
		error: function (){/*$(element).next('div').html('Intente mas Tarde.');*/$('#loadData').hide();}
	});
}