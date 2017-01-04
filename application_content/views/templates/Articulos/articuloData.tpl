
<div class="panelClients">
	<div class="panelHeader col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<span class="col-md-1"><b>Articulos</b></span>
		<span class="cerrar pull-right"></span>
	</div>

    <div class="panelBody col-sm-12 col-md-11 col-lg-12">
    	<form id="clienteForm">
    	<div class="col-md-3">
        	<div class="row">
	        	<span class="glyphicon glyphicon-barcode col-md-2"></span>
	        	<input class="" type="hidden" name="idArticulo" id="idArticulo" value="{$ARTICULOS['idArticulo']}">
	        	<input data-toggle="tooltip" data-placement="top" title="Codigó" class="under col-md-7" type="text" name="codigo" id="codigo" value="{$ARTICULOS['codigoArticulo']}">
	        	<span class="glyphicon glyphicon-pencil  col-md-2"></span>
	        </div>
	        <input type="file" name="foto" class="hidden" id="foto" accept='image/*' multiple>

        	<div id="preview" class="mousehover profile glyphicon {if $ARTICULOS['imagen'] == ''}glyphicon-picture{/if}"
        		{if $ARTICULOS['imagen'] != ''}
        			style="background: url(resources/imagesArticulos/{$idTienda}/{$ARTICULOS['idArticulo']}/{$ARTICULOS['imagen']});background-size: 100% 100%; background-repeat: no-repeat;"
				{/if}></div>
        	<div class="dropdown col-md-12">
			    <button class="btn boton col-md-12 trans dropdown-toggle t3" type="button" data-toggle="dropdown">$1,111.00
			    <span class="caret"></span></button>
			    {*<ul class="dropdown-menu trans">
			      <li><a href="#">Internet</a></li>
			      <li><a href="#">Medios Impresos</a></li>
			    </ul>*}
		  	</div>
    	</div>
    	<div class="col-md-1"></div>
    	<div class="col-md-8 newStyle" style="display: none" id="imagenesArticulo">
    		<button type="button" class="btnregresar btn btn-warning btn-outline">Regresar</button>
    		{*BOTON DE AGREGAR FOTO*}
    		<ul class="list"><li data-toggle="tooltip" title="Agregar Imagen" style="width: auto;" class="panelClient plusBtn btnNewImagen"><section class="left " style="display: block;">
				<div class="plusBtn ">+</div></section></li></ul>
			{*CONTENEDOR DE FOTOS*}
			<div id="listImages"></div>
    	</div>
		<div class="col-md-8 newStyle" id="dataArticulo">
			<div class="row">
				<div class="col-md-1">
					<span class="glyphicon glyphicon-tag"></span>
				</div>
				<div class="col-md-5">
					<input data-toggle="tooltip" data-placement="top" title="Nombre" class="under" type="text" name="nombre" placeholder="Nombre" id="nombre" value="{$ARTICULOS['nombreArticulo']}">
				</div>
				<div class="col-md-6">
					<input data-toggle="tooltip" data-placement="top" title="Abreviatura" class="under" type="text" name="abreviatura" placeholder="Abreviatura" id="abreviatura" value="{$ARTICULOS['nombreCortoArticulo']}">
				</div>
			</div>
			<div class="row">
				<div class="col-md-1">
					<span class="glyphicon glyphicon-bookmark"></span>
				</div>
				<div class="col-md-5">
					<input type="hidden" name="categoriasId" id="categoriasId" value="{$ARTICULOS['idsCategoria']}">
					<input data-toggle="tooltip" data-placement="top" title="Categorías" class="under" type="text" name="categorias" placeholder="Categorías" id="categorias" value="{$ARTICULOS['nombresCategorias']}{if $ARTICULOS['nombresCategorias'] != ''},{/if}">
				</div>
				<div class="col-md-1">
					<span class="glyphicon glyphicon-home"></span>
				</div>
				<div class="col-md-5">
					<input type="hidden" name="sucursalesId" id="sucursalesId" value="{$ARTICULOS['idsSucursal']}">
					<input data-toggle="tooltip" data-placement="top" title="Sucursales" class="under" type="text" name="sucursales" placeholder="Sucursales" id="sucursales" value="{$ARTICULOS['nombresSucursal']}{if $ARTICULOS['nombresSucursal'] != ''},{/if}">
				</div>
			</div>
			<input type="hidden" name="tipoArticulo" id="tipoArticulo" value="{$ARTICULOS['tipoArticulo']}">
			<div class="row">
				<div class="col-md-2">
					<button class="btn boton btnProducto" type="button">Producto <span class="glyphicon glyphicon-ok {if $ARTICULOS['tipoArticulo'] != 1}hidden{/if}"></span></button>
				</div>
				<div class="col-md-5">
					<input data-toggle="tooltip" data-placement="top" title="Tamaño" class="under" type="text" name="tamano" placeholder="Tamaño" id="tamano">
				</div>
				<div class="col-md-5">
					<input data-toggle="tooltip" data-placement="top" title="Colores" class="under" type="text" name="colores" placeholder="Colores" id="colores">
				</div>

			</div>
			<div class="row">
				<div class="col-md-2">
					<button class="btn boton btnServicios" type="button">Servicios <span class="glyphicon glyphicon-ok {if $ARTICULOS['tipoArticulo'] != 2}hidden{/if}"></span></button>
				</div>
				<div class="col-md-10">
					<input data-toggle="tooltip" data-placement="top" title="Horario" class="under" type="text" name="horario" placeholder="Horario" id="horario">
				</div>
			</div>

			<div class="row">
				<div class="col-md-1">
					<span class="glyphicon glyphicon-edit"></span>
				</div>
				<div class="col-md-5">
					<input data-toggle="tooltip" data-placement="top" title="Título" class="under" type="text" name="titulo" placeholder="Título" id="titulo" value="{$ARTICULOS['tituloArticulo']}">
				</div>
				<div class="col-md-6">
					<input data-toggle="tooltip" data-placement="top" title="Palabras Clave" class="under" type="text" name="palabras" placeholder="Palabras Clave" id="palabras" value="{$ARTICULOS['palabrasClaveArticulo']}">
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<input data-toggle="tooltip" data-placement="top" title="Descripción" class="under" type="text" name="descripcion" placeholder="Descripción" id="descripcion" value="{$ARTICULOS['descripcionArticulo']}">
				</div>
			</div>
		</div>
		</form>
	</div>
</div>
	{*<?php  include 'insights.php';?>*}

<script type="text/javascript" src="{$INDEX_YOCO}/resources/js/modernizr.custom.53451.js"></script>
<script type="text/javascript" src="{$INDEX_YOCO}/resources/js/jquery.gallery.js"></script>
<link rel="stylesheet" type="text/css" href="{$INDEX_YOCO}/resources/css/slide.css" />
{literal}
<style type="text/css">
.plusBtn:hover{
	background-color: #cb3a59;
}
</style>

<script type="text/javascript">

function split( val ) {
	return val.split( /,\s*/ );
}
function extractLast( term ) {
	return split( term ).pop();
}

$( "#categorias" )
	.on( "keydown", function( event ) {
		if ( event.keyCode === $.ui.keyCode.TAB && $( this ).autocomplete( "instance" ).menu.active ) {
			event.preventDefault();
		}
		if(event.keyCode == 8){
			$('#categorias').val('');
			$('#categoriasId').val('');
			/*valores = split($('#categorias').val());
			valoresId = split($('#categoriasId').val());
			console.log(valores);
			console.log(valoresId);
			if(valores.length < valoresId.length){
				te = '';
				for (var i = 0; i <= valores.length; i++) {
					if(te != ''){
						te = te + ','+valoresId[i];
					}
					else{
						te = valoresId[i];
					}
				}
				console.log(te);
			}*/
		}
	})
	.autocomplete({
		minLength: 3,
		source: function(request,response){
			var terms = split( request.term );
			$.ajax({
				url: "ajax/autocomplete/categoriasTienda",
				dataType: "json",
				data: {
					//q: request.term
					q: terms.pop()
				},
				success: function(data){
					response( data );
				}
			});
		},
		focus: function() {
			// prevent value inserted on focus
			return false;
		},
		select: function( event, ui ) {
			var terms = split( this.value );
			console.log(ui);
			terms.pop();
			terms.push( ui.item.value );
			terms.push( "" );
			this.value = terms.join( ", " );
			var ids = ui.item.idCat1+"-"+ui.item.idCat2+"-"+ui.item.idCat3;
			if($('#categoriasId').val() != ''){
				$('#categoriasId').val($('#categoriasId').val() + ',' + ids);
			}
			else{
				$('#categoriasId').val(ids);
			}
			return false;
		}
	});

$( "#sucursales" )
	.on( "keydown", function( event ) {
		if ( event.keyCode === $.ui.keyCode.TAB && $( this ).autocomplete( "instance" ).menu.active ) {
			event.preventDefault();
		}
		if(event.keyCode == 8){
			$('#sucursales').val('');
			$('#sucursalesId').val('');
			/*valores = split($('#categorias').val());
			valoresId = split($('#categoriasId').val());
			console.log(valores);
			console.log(valoresId);
			if(valores.length < valoresId.length){
				te = '';
				for (var i = 0; i <= valores.length; i++) {
					if(te != ''){
						te = te + ','+valoresId[i];
					}
					else{
						te = valoresId[i];
					}
				}
				console.log(te);
			}*/
		}
	})
	.autocomplete({
		minLength: 3,
		source: function(request,response){
			var terms = split( request.term );
			$.ajax({
				url: "ajax/autocomplete/sucursalesTienda",
				dataType: "json",
				data: {
					//q: request.term
					q: terms.pop()
				},
				success: function(data){
					response( data );
				}
			});
		},
		focus: function() {
			// prevent value inserted on focus
			return false;
		},
		select: function( event, ui ) {
			var terms = split( this.value );
			console.log(ui);
			terms.pop();
			terms.push( ui.item.value );
			terms.push( "" );
			this.value = terms.join( ", " );
			var ids = ui.item.idSucursal;
			if($('#sucursalesId').val() != ''){
				$('#sucursalesId').val($('#sucursalesId').val() + ',' + ids);
			}
			else{
				$('#sucursalesId').val(ids);
			}
			return false;
		}
	});

$('.btnProducto').click(function(event) {
	$(this).find('span').removeClass('hidden');
	$('.btnServicios').find('span').addClass('hidden');
	$('#tipoArticulo').val(1);
});
$('.btnServicios').click(function(event) {
	$(this).find('span').removeClass('hidden');
	$('.btnProducto').find('span').addClass('hidden');
	$('#tipoArticulo').val(2);
});
$('[data-toggle="tooltip"]').tooltip();
//$('#fechaNac').datepicker({ format: 'DD/MM/YYYY'});
$('.cerrar').on('click', function(){$('.overlay-container').fadeOut().end().find('.window-container').removeClass('window-container-visible');
	if($.trim($('#codigo').val()) != ''){
		var dataForm = new FormData();
		/*var _totalImg = $("[name='foto']")[0].files.length;
		if(_totalImg > 0){
			for (ii = 0; ii < _totalImg; ii++) {dataForm.append('foto', $('#foto')[0].files[ii]);}
		}else{dataForm.append('foto', $('#foto')[0].files[0]);}*/

		dataForm.append('csrf_yoco_tok_name', $("#token").val());
		dataForm.append('codigo', $("#codigo").val());
		dataForm.append('idArticulo', $("#idArticulo").val());
		dataForm.append('nombre', $("#nombre").val());
		dataForm.append('abreviatura', $("#abreviatura").val());
		dataForm.append('titulo', $("#titulo").val());
		dataForm.append('palabras', $("#palabras").val());
		dataForm.append('descripcion', $("#descripcion").val());
		dataForm.append('tipoArticulo', $("#tipoArticulo").val());

		dataForm.append('tamano', $("#tamano").val());
		dataForm.append('colores', $("#colores").val());
		dataForm.append('horario', $("#horario").val());

		dataForm.append('categorias', $("#categorias").val());
		dataForm.append('categoriasId', $("#categoriasId").val());
		dataForm.append('sucursales', $("#sucursales").val());
		dataForm.append('sucursalesId', $("#sucursalesId").val());

		$.ajax({
			url : "ajax/guardarArticulo",
			//data : $('#clienteForm').serialize(),
			data : dataForm,
			processData: false,
        	contentType: false,
        	cache: false,
			dataType : "json", type: "POST",
			beforeSend: function(){},
			success: function(data){
				if(data.error){
					$('#products').append('Intente mas Tarde.');
				}
				else{
					//mensaje('La Acción se realizo correctamente.');
					cargarListado();
				}
			},
			error: function (){/*$(element).next('div').html('Intente mas Tarde.');*/}
		});
	}
});
$('#preview').click(function(){
	cargarImages();
});

$('.btnNewImagen').click(function(){
	$('#foto').trigger('click');
});

function cargarImages(){
	$('#listImages').html('');
	$.ajax({
		url : "ajax/obtenerImagenesArticulo",
		data : {
			'csrf_yoco_tok_name' : function(){ return ($('#token').val() != "") ? $('#token').val() : "";},
			'idArticulo' : function(){ return ($('#idArticulo').val() != "0") ? $('#idArticulo').val() : "0";},
		},
		dataType : "json", type: "POST",
		beforeSend: function(){$('#loadData').show();},
		success: function(data){
			if(data.error){
				//$('#products').append('Intente mas Tarde.');
			}
			else{
				$('#listImages').html(data.HTML);
				$('#dataArticulo').hide();
				$('#imagenesArticulo').show();
				$('#loadData').hide();
			}
		},
		error: function (){/*$(element).next('div').html('Intente mas Tarde.');*/$('#loadData').hide();}
	});
}

$("#foto").change(function(){
    //readURL(this);
    guardarImagenArticulo();
});

function guardarImagenArticulo(){
	var dataForm = new FormData();
	var _totalImg = $("[name='foto']")[0].files.length;
	if(_totalImg > 0){
		for (ii = 0; ii < _totalImg; ii++) {dataForm.append('foto[]', $('#foto')[0].files[ii]);}
	}else{dataForm.append('foto[]', $('#foto')[0].files[0]);}

	dataForm.append('csrf_yoco_tok_name', $("#token").val());
	dataForm.append('idArticulo', $("#idArticulo").val());

	$.ajax({
		url : "ajax/guardarImagenArticulo",
		data : dataForm,
		processData: false,
    	contentType: false,
    	cache: false,
		dataType : "json", type: "POST",
		beforeSend: function(){$('#loadData').show();},
		success: function(data){
			if(data.error){
				//$('#products').append('Intente mas Tarde.');
			}
			else{
				//mensaje('La Acción se realizo correctamente.');
				cargarImages();
			}
		},
		error: function (){/*$(element).next('div').html('Intente mas Tarde.');*/}
	});
}

$('.btnregresar').click(function(){
	$('#imagenesArticulo').hide();
	$('#dataArticulo').show();
});

function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function (e) {
			$('#preview').css('background', 'url('+e.target.result+")");
			$('#preview').css('background-size', '100% 100%');
			$('#preview').css('background-repeat', 'no-repeat');
			$('#preview').removeClass('glyphicon');
			$('#preview').removeClass('glyphicon-picture');
		}
		reader.readAsDataURL(input.files[0]);
	}
}
function deleteImagen(idImagen , imagen){
	pregunta('Desea eliminar esta Imagen?', '','INFO', 'deleteImagenFuncion', {'idImagen' : idImagen, 'imagen':imagen});
}
function deleteImagenFuncion($data){
	$.ajax({
		url : "ajax/eliminarImagenArticulo",
		data : {
			'csrf_yoco_tok_name' : function(){ return ($('#token').val() != "") ? $('#token').val() : "";},
			'idImagen' : $data.idImagen,
			'imagen' : $data.imagen,
			'idArticulo': $("#idArticulo").val()
		},
		dataType : "json", type: "POST",
		beforeSend: function(){$('#loadData').show();},
		success: function(data){
			if(data.error){
				mensaje('No se pudo realizar la acción.','Favor de intentar mas tarde.','ERROR');
			}
			else{
				$('#loadData').hide();
				cargarImages();
				mensaje('Se elimino correctamente la imagen.','','OK');
			}
		},
		error: function (){/*$(element).next('div').html('Intente mas Tarde.');*/$('#loadData').hide();}
	});
}
</script>{/literal}
