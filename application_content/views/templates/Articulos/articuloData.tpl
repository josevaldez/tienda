
<div class="panelClients">
	<div class="panelHeader col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<span class="col-md-1"><b>Articulos</b></span>
		<span class="cerrar pull-right"></span>
		<input type="file" name="foto" style="position: absolute; top: -1000px; left: -10000px" id="foto" accept='image/*' multiple>
	</div>

    <div class="panelBody col-sm-12 col-md-11 col-lg-12">
    	<form id="clienteForm">
    	<div class="col-md-3 ocultar">
        	<div class="row" style="  border-bottom: 1px solid #bbb; padding-bottom: 0;">
	        	<span class="glyphicon glyphicon-barcode" style="float: left;"></span>
	        	<input style="border: none !important; margin-left:13px; " class="" type="hidden" name="idArticulo" id="idArticulo" value="{$ARTICULOS['idArticulo']}">
	        	<input data-toggle="tooltip" data-placement="top" title="Codigó" class="under col-md-9 classNumber" type="text" name="codigo" id="codigo" value="{$ARTICULOS['codigoArticulo']}" {if $ARTICULOS['idArticulo'] != ''}disabled{/if}>
	        	<span class="glyphicon glyphicon-pencil cursorHover editCodigo" style="float: right; font-size: 14px;margin-top: 6px;text-align: right;"></span>
	        </div>


        	<div id="preview" class="mousehover profile glyphicon {if $ARTICULOS['imagen'] == ''}glyphicon-picture{/if}"
        		{if $ARTICULOS['imagen'] != ''}
        			style="background: url(resources/imagesArticulos/{$idTienda}/{$ARTICULOS['idArticulo']}/{$ARTICULOS['imagen']});background-size: 100% 100%; background-repeat: no-repeat;"
				{/if}></div>
        	<div class="dropdown col-md-12">
			    <button class="btn boton col-md-12 trans dropdown-toggle t3" id="btnPrecio" type="button"><label class="precioFinalLabel">${$ARTICULOS['precioVenta']}</label> <span class="caret"></span></button>
		  	</div>
    	</div>
    	<div class="col-md-1"></div>

    	<div class="col-md-12 newStyle" style="display: none" id="imagenesArticulo">
    		{*<button type="button" class="btnregresar btn btn-warning btn-outline">Regresar</button>*}
    		{*BOTON DE AGREGAR FOTO*}
    		<ul class="list" id="btnad2"><li data-toggle="tooltip" title="Agregar Imagen" style="width: auto;" class="panelClient plusBtn btnNewImagen2"><section class="left " style="display: block;"><div class="plusBtn ">+</div></section></li></ul>
			{*CONTENEDOR DE FOTOS*}
			<div id="listImages"></div>
    	</div>

		<div class="col-md-8 newStyle" id="dataArticulo">
			<div class="row">
				<div class="col-md-1">
					<span class="glyphicon glyphicon-tag col-md-12"></span>
				</div>
				<div class="col-md-5">
					<input data-toggle="tooltip" data-placement="top" title="Nombre" class="under" type="text" name="nombre" placeholder="Nombre" id="nombre" value="{$ARTICULOS['nombreArticulo']}">
				</div>
				<div class="col-md-1">
					<span class="glyphicon glyphicon-scissors col-md-12"></span>
				</div>
				<div class="col-md-5">
					<input data-toggle="tooltip" data-placement="top" title="Abreviatura" class="under" type="text" name="abreviatura" placeholder="Abreviatura" id="abreviatura" value="{$ARTICULOS['nombreCortoArticulo']}">
				</div>
			</div>
			<div class="row">
				<div class="col-md-1">
					<span class="glyphicon glyphicon-bookmark col-md-12"></span>
				</div>
				<div class="col-md-5 categoriasLabel">
					<input type="hidden" name="categoriasId" id="categoriasId" value="{$ARTICULOS['idsCategoria']}">
					<div data-toggle="tooltip" data-placement="top" title="Categorías" class="textoCategoiras under col-md-12" style="color: #777;min-height: 30px;padding-top: 5px;">
					{if $ARTICULOS['nombresCategorias'] != ''}{$ARTICULOS['nombresCategorias']}{else}Categorias{/if}
					</div>
					{*<input data-toggle="tooltip" data-placement="top" title="Categorías" class="under" type="text" name="categoriasText" id="categoriasText" placeholder="Categorías" value="{$ARTICULOS['nombresCategorias']}{if $ARTICULOS['nombresCategorias'] != ''},{/if}">*}
				</div>
				<div class="col-md-1">
					<span class="glyphicon glyphicon-home col-md-12"></span>
				</div>
				<div class="col-md-5">
					<input type="hidden" name="sucursalesId" id="sucursalesId" value="{$ARTICULOS['idsSucursal']}">
					<input data-toggle="tooltip" data-placement="top" title="Sucursales" class="under" type="text" name="sucursales" placeholder="Sucursales" id="sucursales" value="{$ARTICULOS['nombresSucursal']}{if $ARTICULOS['nombresSucursal'] != ''},{/if}">
				</div>
			</div>
			<input type="hidden" name="tipoArticulo" id="tipoArticulo" value="{$ARTICULOS['tipoArticulo']}">
			<div class="row">
				<div class="col-md-2">
					<button class="btn boton btnProducto" type="button">Producto <span class="glyphicon glyphicon-ok {if $ARTICULOS['tipoArticulo'] != 1}hidden{/if}" style="margin: -7px 0 -7px 0px;"></span></button>
				</div>
				<div class="col-md-1">
					<span class="glyphicon glyphicon-th-large col-md-12"></span>
				</div>
				<div class="col-md-4">
					<input data-toggle="tooltip" data-placement="top" title="Tamaño" class="under" type="text" name="tamano" placeholder="Tamaño" id="tamano">
				</div>
				<div class="col-md-1">
					<span class="glyphicon glyphicon-tint col-md-12"></span>
				</div>
				<div class="col-md-4">
					<input data-toggle="tooltip" data-placement="top" title="Colores" class="under" type="text" name="colores" placeholder="Colores" id="colores">
				</div>

			</div>
			<div class="row">
				<div class="col-md-2">
					<button class="btn boton btnServicios" type="button">Servicios <span class="glyphicon glyphicon-ok {if $ARTICULOS['tipoArticulo'] != 2}hidden{/if}" style="margin: -7px 0 -7px 0px;"></span></button>
				</div>
				<div class="col-md-1">
					<span class="glyphicon glyphicon-time col-md-12"></span>
				</div>
				<div class="col-md-9">
					<input data-toggle="tooltip" data-placement="top" title="Horario" class="under" type="text" name="horario" placeholder="Horario" id="horario">
				</div>
			</div>

			<div class="row">
				<div class="col-md-1">
					<span class="glyphicon glyphicon-edit col-md-12"></span>
				</div>
				<div class="col-md-5">
					<input data-toggle="tooltip" data-placement="top" title="Título" class="under" type="text" name="titulo" placeholder="Título" id="titulo" value="{$ARTICULOS['tituloArticulo']}">
				</div>
				<div class="col-md-1">
					<span class="glyphicon glyphicon-pushpin col-md-12"></span>
				</div>
				<div class="col-md-5 tagsLabel">
					<input data-toggle="tooltip" data-placement="top" title="Palabras Clave" class="under" type="text" name="palabras" placeholder="Palabras Clave" id="palabras" value="{$ARTICULOS['palabrasClaveArticulo']}">
				</div>
			</div>
			<div class="row">
				<div class="col-md-1">
					<span class="glyphicon glyphicon-align-justify col-md-12"></span>
				</div>
				<div class="col-md-11">
					<input data-toggle="tooltip" data-placement="top" title="Descripción" class="under" type="text" name="descripcion" placeholder="Descripción" id="descripcion" value="{$ARTICULOS['descripcionArticulo']}">
				</div>
			</div>
		</div>
		<div class="fondoGris hidden"></div>
		<div class="col-md-12 newStyle" style="display: none" id="contentPrecio">
    		<div class="row"><div class="col-md-12"><input data-toggle="tooltip" data-placement="top" title="Costo" placeholder="Costo $0" type="text" name="precioCosto" id="precioCosto" class="form-control" value="{$ARTICULOS['precioCompra']}"></div></div>

    		<div class="row">
    			<div class="col-md-12"><input data-toggle="tooltip" data-placement="top" title="Ganancia +%" placeholder="Ganancia +0%" type="text" name="gananciaPorcentaje" id="gananciaPorcentaje" class="form-control" value="{$ARTICULOS['gananciaPorcentaje']}"></div>
    			<div class="col-md-1 hidden">ó</div>
    			<div class="col-md-6 hidden"><input data-toggle="tooltip" data-placement="top" title="Ganancia +$" placeholder="Ganancia +$0" type="text" name="gananciaPrecio" id="gananciaPrecio" class="form-control" value="{$ARTICULOS['gananciaPrecio']}"></div>
    		</div>
    		<div class="row">
    			<div class="col-md-12"><input data-toggle="tooltip" data-placement="top" title="Descuento -%" placeholder="Descuento -0%" type="text" name="descuentoPorcentaje" id="descuentoPorcentaje" class="form-control" value="{$ARTICULOS['descuentoPorcentaje']}"></div>
    			<div class="col-md-1 hidden">ó</div>
    			<div class="col-md-6 hidden"><input data-toggle="tooltip" data-placement="top" title="Descuento -$" placeholder="Descuento -$0" type="text" name="descuentoPrecio" id="descuentoPrecio" class="form-control" value="{$ARTICULOS['descuentoPrecio']}"></div>
    		</div>
    		<div class="row">
    			<div class="col-md-12"><input data-toggle="tooltip" data-placement="top" title="IVA %" placeholder="IVA 0%" type="text" name="ivaPorcentaje" id="ivaPorcentaje" class="form-control" value="{$ARTICULOS['ivaPorcentaje']}"></div>

    			<div class="col-md-6 hidden"><input data-toggle="tooltip" data-placement="top" title="IVA $" placeholder="IVA $0" type="text" name="ivaPrecio" id="ivaPrecio" disabled="" class="form-control" value="{$ARTICULOS['ivaPrecio']}"></div>
    		</div>
    		<div class="row totalPrecioBack">
    			<div class="col-md-12"><input data-toggle="tooltip" data-placement="top" title="TOTAL $" placeholder="TOTAL $0" type="text" name="totalPrecio" id="totalPrecio" class="form-control" value="{$ARTICULOS['precioVenta']}" ></div>
    		</div>
    	</div>
    	<div class="divTags hidden">
    		<div class="col-sm-12 form-inline">
    		<input type="text" name="tagsInput" id="tagsInput" data-toggle="tooltip" data-placement="top" title="Palabras Clave" placeholder="Palabras Clave">
    		<button type="button" data-toggle="tooltip" data-placement="top" title="Agregar" onclick="javascript:actualizarTags(this,2);"><i class="glyphicon glyphicon-plus"></i></button>
    		<div class="clearfix"></div>
    		<ul class="listTags">
    		{foreach from=$ARTICULOS['TAGS'] key = kt item = tag}
    			<li><button type="button" data-toggle="tooltip" data-placement="top" title="Eliminar tag" onclick="javascript:actualizarTags(this,3);"><i class="glyphicon glyphicon-remove"></i></button> {$tag}</li>
    		{/foreach}
    		</ul>
    		</div>
    	</div>
    	<div class="divCategorias hidden">
    		<div class="col-sm-12 form-inline">
    		<input type="text" name="categorias" id="categorias" data-toggle="tooltip" data-placement="top" title="Buscar Categorias" placeholder="Buscar Categorias">
    		{*<button type="button" data-toggle="tooltip" data-placement="top" title="Agregar" onclick="javascript:actualizarCategorias(this,2);"><i class="glyphicon glyphicon-plus"></i></button>*}
    		<div class="clearfix"></div>
    		<ul class="listCategorias">
    		{if $ARTICULOS['CATEGORIASID']|@count > 0}
    		{foreach from=$ARTICULOS['CATEGORIASID'] key = kt item = categoria}
    			<li data-id = "{trim($categoria)}"><button type="button" data-toggle="tooltip" data-placement="top" title="Eliminar tag" onclick="javascript:actualizarCategorias(this,3);"><i class="glyphicon glyphicon-remove"></i></button> {$ARTICULOS['CATEGORIASTEXT'][$kt]}</li>
    		{/foreach}
    		{/if}
    		</ul>
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
$('.editCodigo').click(function(event) {
	$('#codigo').removeAttr('disabled');
});
$('.btnNewImagen2').click(function(){
	$('#foto').trigger('click');
});
$('#tagsInput').onEnter(function(){
	actualizarTags($(this), 2);
});
function actualizarTags($element, accion){
	if(accion == 3){
		$($element).parent('li').remove();
	}
	else if(accion == 2){
		if($.trim($('#tagsInput').val()) != ''){
			var tagNuevo = $.trim($('#tagsInput').val());
			$('.listTags').append('<li><button type="button" data-toggle="tooltip" data-placement="top" title="Eliminar tag" onclick="javascript:actualizarTags(this,3);"><i class="glyphicon glyphicon-remove"></i></button> '+tagNuevo+'</li>');
			$('#tagsInput').val('');
		}
	}
	var tags = "";
	$('.listTags').find('li').each(function(index, el) {
		el = $(el).remove('button');
		el = $(el).remove('div');
		console.log($.trim($(el).text()));
		if(tags == ""){
			tags = $.trim($(el).text());
		}
		else{
			tags = tags + ', ' + $.trim($(el).text());
		}
	});
	$('.tagsLabel input').val(tags);
}
$('.fondoGris').click(function(event) {
	$('.fondoGris, .divTags').toggleClass('hidden');
	$('.divCategorias,.divTags, .fondoGris').addClass('hidden');
	$('#contentPrecio').hide();
	$('#precioCosto').change();
});
$('.tagsLabel').click(function(event) {
	$('.fondoGris, .divTags').toggleClass('hidden');
	$('.divCategorias').addClass('hidden');
});
$('.categoriasLabel').click(function(event) {
	$('.fondoGris, .divCategorias').toggleClass('hidden');
	$('.divTags').addClass('hidden');
});
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
		}/*
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
		//}
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
			/*if($('#categoriasId').val() != ''){
				$('#categoriasId').val($('#categoriasId').val() + ',' + ids);
			}
			else{
				$('#categoriasId').val(ids);
			}*/
			var tagNuevo = $.trim(this.value);
			$('.listCategorias').append('<li data-id="'+ids+'"><button type="button" data-toggle="tooltip" data-placement="top" title="Eliminar categoria" onclick="javascript:actualizarCategorias(this,3);"><i class="glyphicon glyphicon-remove"></i></button> '+tagNuevo+'</li>');
			$('#categorias').val('');
			actualizarCategorias('','');
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
$('.cerrar').on('click', function(){
	if($('#imagenesArticulo').is(":visible") ){
		$('#imagenesArticulo').hide();
		$('#dataArticulo').show();
		$('.ocultar').show();
		var idImagen = 0;
		var urlImagen = "";
		$('.dg-wrapper').find('a.editThemeBtn').each(function(index, el) {
			if($(el).hasClass('dg-center')){
				idImagen = $(el).children('div').children('label').children('input').val();
				urlImagen = $(el).children('img').attr('src');
			}
		});
/*ACTUALIZA LA PORTADA QUE ES LA IMAGEN QUE SE QUEDO EN EL CENTRO*/
		if(idImagen != 0){
			$('#preview').css('background', 'url('+urlImagen+")");
			$('#preview').css('background-size', '100% 100%');
			$('#preview').css('background-repeat', 'no-repeat');
			$('#preview').removeClass('glyphicon');
			$('#preview').removeClass('glyphicon-picture');

			var dataForm = new FormData();

			dataForm.append('csrf_yoco_tok_name', $("#token").val());
			dataForm.append('idArticulo', $("#idArticulo").val());
			dataForm.append('idImagen', idImagen);

			$.ajax({
				url : "ajax/asignatPortadaArticulo",
				data : dataForm,
				processData: false,
		    	contentType: false,
		    	cache: false,
				dataType : "json", type: "POST",
				beforeSend: function(){$('#loadData').show();},
				success: function(data){
					if(data.error){
						$('#loadData').hide();
					}
					else{
						cargarImages();
						$('#loadData').hide();
					}
				},
				error: function (){$('#loadData').hide();}
			});
		}
		return false;
	}

	if($.trim($('#codigo').val()) != ''){
		$('#loadData').show();
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

		dataForm.append('precioCosto', $.trim($("#precioCosto").val()));
		dataForm.append('gananciaPorcentaje', $.trim($("#gananciaPorcentaje").val()));
		dataForm.append('gananciaPrecio', $.trim($("#gananciaPrecio").val()));
		dataForm.append('descuentoPorcentaje', $.trim($("#descuentoPorcentaje").val()));
		dataForm.append('descuentoPrecio', $.trim($("#descuentoPrecio").val()));
		dataForm.append('ivaPorcentaje', $.trim($("#ivaPorcentaje").val()));
		dataForm.append('ivaPrecio', $.trim($("#ivaPrecio").val()));
		dataForm.append('totalPrecio', $.trim($("#totalPrecio").val()));

		$.ajax({
			url : "ajax/guardarArticulo",
			//data : $('#clienteForm').serialize(),
			data : dataForm,
			processData: false,
        	contentType: false,
        	cache: false,
			dataType : "json", type: "POST",
			beforeSend: function(){$('#loadData').show();},
			success: function(data){
				$('#loadData').hide();
				if(data.error){
					//$('#products').append('Intente mas Tarde.');
					mensaje(data.HTML,'','ERROR');
				}
				else{
					//mensaje('La Acción se realizo correctamente.');
					cargarListado();
					$('.overlay-container').fadeOut().end().find('.window-container').removeClass('window-container-visible');
				}
			},
			error: function (){$('#loadData').hide();/*$(element).next('div').html('Intente mas Tarde.');*/}
		});
	}
	else{
		$('.overlay-container').fadeOut().end().find('.window-container').removeClass('window-container-visible');
	}
});
$('#preview').click(function(){
	if($('#idArticulo').val() == "0" || $('#idArticulo').val() == ""){
		mensaje('Tiene que guardar el Artículo para subir fotos de este','','INFO');
		return false;
	}
	cargarImages();
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
				$('#loadData').hide();
				$('#listImages').html(data.HTML);
				$('#dataArticulo').hide();
				$('#imagenesArticulo').show();
				$('.ocultar').hide();
				if(data.TOTAL != 0){
					//clickImagen();
					$('#btnad2').hide();
				}
				if(data.TOTAL == 0){
					//clickImagen();
					$('#btnad2').show();
				}/*
				else{
					$('#listImages').html(data.HTML);
					$('#dataArticulo').hide();
					$('#imagenesArticulo').show();
					$('.ocultar').hide();
				}*/
				//$("[name='foto']").click();
				//console.log($("[name='foto']").attr('id'));
			}
		},
		error: function (){/*$(element).next('div').html('Intente mas Tarde.');*/$('#loadData').hide();}
	});
}
function clickImagen(){
	setTimeout(function(){$("#foto").click();$('#loadData').hide();},500);
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
	$('.ocultar').show();
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

function actualizarCategorias($element, accion){
	if(accion == 3){
		$($element).parent('li').remove();
	}
	var tags = "";var tags2 = "";
	$('.listCategorias').find('li').each(function(index, el) {
		el = $(el).remove('button');
		el = $(el).remove('div');
		console.log($.trim($(el).attr('data-id')));
		if(tags == ""){
			tags = $.trim($(el).attr('data-id'));
		}
		else{
			tags = tags + ', ' + $.trim($(el).attr('data-id'));
		}
		if(tags2 == ""){
			tags2 = $.trim($(el).text());
		}
		else{
			tags2 = tags2 + ', ' + $.trim($(el).text());
		}
	});
	$('.categoriasLabel').find('input').first().val(tags);
	$('.categoriasLabel').find('.textoCategoiras').html(tags2);
}
$('#btnPrecio').click(function(){
	$('#contentPrecio').show();
	$('.fondoGris').toggleClass('hidden');

});

$('#precioCosto').change(function(){
	precioVenta = 0;
	if($.trim($(this).val()) != ''){
		try {
			precioVenta = parseFloat($.trim($(this).val()));
			if($.trim($('#gananciaPorcentaje').val()) != '' && $.trim($('#gananciaPorcentaje').val()) != '0'){
				valor = $.trim($('#gananciaPorcentaje').val());
				if(valor.indexOf('%') != -1){
					gananciaPorcentaje  = parseFloat($.trim($('#precioCosto').val()))  * (parseFloat($.trim($('#gananciaPorcentaje').val())) / 100);
					gananciaPorcentaje = gananciaPorcentaje.toFixed(2);
					$('#gananciaPrecio').val(gananciaPorcentaje);
				}
				else{
					$('#gananciaPrecio').val(valor);
				}
			}
			if($.trim($('#gananciaPrecio').val()) != '' && $.trim($('#gananciaPrecio').val()) != '0'){
				precioVenta  = parseFloat(precioVenta)  + parseFloat($.trim($('#gananciaPrecio').val()));
			}

			if($.trim($('#descuentoPorcentaje').val()) != '' && $.trim($('#descuentoPorcentaje').val()) != '0'){
				valor = $.trim($('#descuentoPorcentaje').val());
				if(valor.indexOf('%') != -1){
					descuentoPorcentaje  = (parseFloat($.trim($('#precioCosto').val())) + parseFloat($.trim($('#gananciaPrecio').val()))) * (parseFloat($.trim($('#descuentoPorcentaje').val())) / 100);
					descuentoPorcentaje = descuentoPorcentaje.toFixed(2);
					$('#descuentoPrecio').val(descuentoPorcentaje);
				}
				else{
					$('#descuentoPrecio').val(valor);
				}
			}
			if($.trim($('#descuentoPrecio').val()) != '' && $.trim($('#descuentoPrecio').val()) != '0'){
				precioVenta  = parseFloat(precioVenta)  - parseFloat($.trim($('#descuentoPrecio').val()));
			}

			if($.trim($('#ivaPorcentaje').val()) != '' && $.trim($('#ivaPorcentaje').val()) != '0'){
				valor = $.trim($('#ivaPorcentaje').val());
				if(valor.indexOf('%') != -1){
					ivaPorcentaje  = precioVenta  * (parseFloat($.trim($('#ivaPorcentaje').val())) / 100);
					ivaPorcentaje = ivaPorcentaje.toFixed(2);
					$('#ivaPrecio').val(ivaPorcentaje);
				}
				else{
					$('#ivaPrecio').val(valor);
				}
			}

			if($.trim($('#ivaPrecio').val()) != '' && $.trim($('#ivaPrecio').val()) != '0'){
				precioVenta  = parseFloat(precioVenta)  + parseFloat($.trim($('#ivaPrecio').val()));
			}
			precioVenta = precioVenta.toFixed(2);
		}
		catch(err) {
			precioVenta = 0;
		}
	}
	$('#totalPrecio').val(precioVenta);
	$('.precioFinalLabel').html("$ "+precioVenta);
});

$('#gananciaPorcentaje').change(function(){
	gananciaPorcentaje = 0;
	if($.trim($(this).val()) != '' && $.trim($(this).val()) != '0'){
		valor = $.trim($(this).val());
		if(parseFloat($.trim($(this).val())) > 100){
			$('#gananciaPrecio').val(gananciaPorcentaje);
			$('#gananciaPorcentaje').val(gananciaPorcentaje);
			$('#precioCosto').change();
			return false;
		}
		try {
			if(valor.indexOf('%') != -1){
				gananciaPorcentaje  = parseFloat($.trim($('#precioCosto').val()))  * (parseFloat($.trim($('#gananciaPorcentaje').val())) / 100);
				gananciaPorcentaje = gananciaPorcentaje.toFixed(2);
				$('#gananciaPrecio').val(gananciaPorcentaje);
			}
			else{
				$('#gananciaPrecio').val(valor);
			}
		}
		catch(err) {
		}
	}
	else{
		$('#gananciaPrecio').val(gananciaPorcentaje);
	}
	$('#precioCosto').change();
});
/*
$('#gananciaPrecio').change(function(){
	gananciaPrecio = 0;
	if($.trim($(this).val()) != '' && $.trim($(this).val()) != '0'){
		try {
			gananciaPrecio = (parseFloat($.trim($('#gananciaPrecio').val())) * 100) / parseFloat($.trim($('#precioCosto').val()));
			gananciaPrecio = gananciaPrecio.toFixed(2);
			$('#gananciaPorcentaje').val(gananciaPrecio);
		}
		catch(err) {
		}
	}
	else{
		$('#gananciaPorcentaje').val(gananciaPrecio);
	}
	$('#precioCosto').change();
});*/

$('#descuentoPorcentaje').change(function(){
	descuentoPorcentaje = 0;
	if($.trim($(this).val()) != '' && $.trim($(this).val()) != '0'){
		valor = $.trim($(this).val());
		if(parseFloat($.trim($(this).val())) > 100){
			$('#descuentoPrecio').val(descuentoPorcentaje);
			$('#descuentoPorcentaje').val(descuentoPorcentaje);
			$('#precioCosto').change();
			return false;
		}
		try {
			if(valor.indexOf('%') != -1){
				descuentoPorcentaje  = (parseFloat($.trim($('#precioCosto').val())) + parseFloat($.trim($('#gananciaPrecio').val()))) * (parseFloat($.trim($('#descuentoPorcentaje').val())) / 100);
				descuentoPorcentaje = descuentoPorcentaje.toFixed(2);
				$('#descuentoPrecio').val(descuentoPorcentaje);
			}
			else{
				$('#descuentoPrecio').val(valor);
			}
		}
		catch(err) {
		}
	}
	else{
		$('#descuentoPrecio').val(descuentoPorcentaje);
	}
	$('#precioCosto').change();
});
/*
$('#descuentoPrecio').change(function(){
	descuentoPrecio = 0;
	if($.trim($(this).val()) != '' && $.trim($(this).val()) != '0'){
		try {
			descuentoPrecio = (parseFloat($.trim($('#descuentoPrecio').val())) * 100) / (parseFloat($.trim($('#precioCosto').val())) + parseFloat($.trim($('#gananciaPrecio').val())) );
			descuentoPrecio = descuentoPrecio.toFixed(2);
			$('#descuentoPorcentaje').val(descuentoPrecio);
		}
		catch(err) {
		}
	}
	else{
		$('#descuentoPorcentaje').val(descuentoPrecio);
	}
	$('#precioCosto').change();
});
*/
$('#ivaPorcentaje').change(function(){
	ivaPorcentaje = 0;
	precioVenta = 0;
	if($.trim($(this).val()) != '' && $.trim($(this).val()) != '0'){
		valor = $.trim($('#ivaPorcentaje').val());
		if(parseFloat($.trim($(this).val())) > 100){
			$('#ivaPrecio').val(ivaPorcentaje);
			$('#ivaPorcentaje').val(ivaPorcentaje);
			$('#precioCosto').change();
			return false;
		}
		try {
			precioVenta = parseFloat($.trim($('#precioCosto').val()));
			if($.trim($('#gananciaPrecio').val()) != '' && $.trim($('#gananciaPrecio').val()) != '0'){
				precioVenta  = parseFloat(precioVenta)  + parseFloat($.trim($('#gananciaPrecio').val()));
			}

			if($.trim($('#descuentoPrecio').val()) != '' && $.trim($('#descuentoPrecio').val()) != '0'){
				precioVenta  = parseFloat(precioVenta)  - parseFloat($.trim($('#descuentoPrecio').val()));
			}

			if(valor.indexOf('%') != -1){
				ivaPorcentaje  = precioVenta  * (parseFloat($.trim($('#ivaPorcentaje').val())) / 100);
				ivaPorcentaje = ivaPorcentaje.toFixed(2);
				$('#ivaPrecio').val(ivaPorcentaje);
			}
			else{
				$('#ivaPrecio').val(valor);
			}
		}
		catch(err) {
		}
	}
	else{
		$('#ivaPrecio').val(ivaPorcentaje);
	}
	$('#precioCosto').change();
});

</script>{/literal}
