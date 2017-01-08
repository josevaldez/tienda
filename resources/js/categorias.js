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
		cargarListado();
	});
});

function cargarListado(){
	$('.categoriaList').remove();
	if(cont != 0){$( "#products" ).selectable("destroy");}
	$.ajax({
		url : "ajax/listarCategorias",
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
				$('[data-toggle="tooltip"]').tooltip();
				/*$( "#products").unbind( "mousedown" );
				$( "#products" ).selectable();cont++;
			    $( "#products" ).bind( "mousedown", function ( e ) {
			    	if(e.metaKey != false || e.ctrlKey != false){
			    		//CLICK CON CONTROL
			    		console.log("controlPress");

			    		$('#deleteClientes, #sendClientes').removeClass('hidden');

			    	}
			    	else{
			    		//CLICK SIN CONTROL
			    		$('#deleteClientes, #sendClientes').addClass('hidden');
			    		console.log("controlUNPress");
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
				} );*/
			}
		},
		error: function (){$( "#products").unbind( "mousedown" );
				$( "#products" ).selectable();cont++;/*$(element).next('div').html('Intente mas Tarde.');*/}
	});
}

function deleteCategoria(idCat, tipo){
	var titulo = "Desea Eliminar la Categoria Seleccionada?";
	var subTitulo = "";
	if(tipo != 3){
		var subTitulo = "Se eliminaron todas las Subcategorias de esta.";
	}
	pregunta(titulo, subTitulo,'INFO', 'deleteCategoriaFuncion', {'idCat': idCat, 'tipo': tipo});
}

function deleteCategoriaFuncion(dat){
	$.ajax({
		url : "ajax/eliminarCategoria",
		data : {
			'csrf_yoco_tok_name' : function(){ return ($('#token').val() != "") ? $('#token').val() : "";},
			'idCategoria' : dat.idCat,
			'tipo' : dat.tipo,
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

function editarCategoria(idCategoria){
	$('#ventanaDetalleContenido').html('');
	$.ajax({
		url : "ajax/dataCategoria",
		data : {
			'csrf_yoco_tok_name' : function(){ return ($('#token').val() != "") ? $('#token').val() : "";},
			'idCategoria' : idCategoria,

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
						$('html, body').animate({
					        scrollTop: $("#clientBox").offset().top - 200
					    }, 2000);
					}, 100);
				});
			}
		},
		error: function (){/*$(element).next('div').html('Intente mas Tarde.');*/$('#loadData').hide();}
	});
}

function agregarCategoria(idCat, tipo){
	$('#ventanaDetalleContenido').html('');
	$.ajax({
		url : "ajax/dataCategoria",
		data : {
			'csrf_yoco_tok_name' : function(){ return ($('#token').val() != "") ? $('#token').val() : "";},
			'idCatPadre' : idCat,
			'tipo' : tipo,
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
						$('html, body').animate({
					        scrollTop: $("#clientBox").offset().top - 200
					    }, 2000);
					}, 100);
				});
			}
		},
		error: function (){/*$(element).next('div').html('Intente mas Tarde.');*/$('#loadData').hide();}
	});
}