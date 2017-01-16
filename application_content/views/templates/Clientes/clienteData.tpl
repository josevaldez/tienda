
<div class="panelClients">
	<div class="panelHeader col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<span class="col-md-1"><b>Clientes</b></span>
		<span class="cerrar pull-right"></span>
	</div>

    <div class="panelBody col-sm-12 col-md-11 col-lg-12">
    <form id="clienteForm" enctype="multipart/form-data">
    	<div class="col-md-3">
        	<div class="row" style="  border-bottom: 1px solid #bbb; padding-bottom: 0;">
	        	<span class="glyphicon glyphicon-barcode" style="float: left;"></span>
	        	<input style="border: none !important; margin-left:13px; " data-toggle="tooltip" data-placement="top" title="Cliente" id="codigoCliente" value="{$CLIENTES['codigoCliente']}" class="under col-md-9 classNumber" type="text" name="codigoCliente" {if $CLIENTES['idCliente'] != ''}disabled{/if}>
	        	<input value="{$CLIENTES['idCliente']}" type="hidden" name="idCliente" id="idCliente">
	        	<input value="{$token}" type="hidden" name="{$token_name}" id="token">
	        	<span style="float: right; font-size: 14px;margin-top: 6px;text-align: right;" class="glyphicon glyphicon-pencil cursorHover editCodigo"></span>
	        </div>
	        <input type="file" name="foto" style="position: absolute; top: -1000px; left: -10000px" id="foto" accept='image/*'>
        	<div id="preview" class="profile mousehover glyphicon {if $CLIENTES['fotoCliente'] == ''}glyphicon-user{/if}"
        		{if $CLIENTES['fotoCliente'] != ''}
        			style="background: url(resources/fotosClientes/{$idTienda}/{$CLIENTES['fotoCliente']});background-size: 100% 100%; background-repeat: no-repeat;"
				{/if} ></div>
    	</div>
    	<div class="col-md-1"></div>
		<div class="col-md-7 newStyle">
				<div class="row">
					<div class="col-md-1">
						<span class="glyphicon glyphicon-user col-md-12"></span>
					</div>
					<div class="col-md-3">
						<input data-toggle="tooltip" data-placement="top" title="Nombre" class="under" type="text" name="nombre" id="nombre" placeholder="Nombre" value="{$CLIENTES['nombresCliente']}">
					</div>
					<div class="col-md-3">
						<input data-toggle="tooltip" data-placement="top" title="Apellidos" class="under" type="text" name="apellido" id="apellido" placeholder="Apellidos" value="{$CLIENTES['apellidosCliente']}">
					</div>
					<div class="col-md-1">
						<span class="glyphicon glyphicon-calendar col-md-12"></span>
					</div>
					<div class="col-md-3">
						<input data-toggle="tooltip" data-placement="top" title="Fecha de nacimiento" class="under"  type="text" placeholder="Fecha de nacimiento" name="fechaNac" id="fechaNac" value="{$CLIENTES['fechaNacimientoCliente']}">
					</div>
					<div class="col-md-1">
						<input type="text" name="anos" id="anos" disabled="" placeholder="años" class="under classNumber" value="{$CLIENTES['edadCliente']}">
					</div>
				</div>
				<div class="row">
					<div class="col-md-1">
						<span class="glyphicon glyphicon-envelope col-md-12"></span>
					</div>
					<div class="col-md-5">
						<input data-toggle="tooltip" data-placement="top" title="Email" class="under" type="Email" name="email" id="Email" placeholder="Email" value="{$CLIENTES['emailCliente']}">
					</div>
					<div class="col-md-1">
						<span class="glyphicon glyphicon-earphone col-md-12"></span>
					</div>
					<div class="col-md-2">
						<input data-toggle="tooltip" data-placement="top" title="Teléfono" class="under classNumber" type="tel" name="telefono" id="telefono" placeholder="Teléfono" value="{$CLIENTES['telefonoCliente']}">
					</div>
					<div class="dropdown col-md-3">
				 		<input type="hidden" id="conocioid" name="conocioid" value="{$CLIENTES['idCatConocio']}">
					    <button class="btn trans dropdown-toggle" id="btnConocio" type="button" data-toggle="dropdown">
					    {$c = 0}
					    {foreach from=$CATCONOCIO key = kc item = arrCat}
					    	{if $CLIENTES['idCatConocio'] == $arrCat['idConocio']}
						    	{$arrCat['descripcion']}
						    	{$c = 1}
					    	{/if}
					    {/foreach}
					    {if $c == 0}
					    ¿Cómo nos conoció?
					    {/if}
					    <span class="caret"></span></button>
					    <ul class="dropdown-menu trans">
					    	<li><a href="javascript:void(0);" onclick="javascript:$('#conocioid').val(0); $('#btnConocio').html('Como nos Conocio? <span class=\'caret\'></span></button>');">Como nos Conocio?</a></li>
							{foreach from=$CATCONOCIO key = kc item = arrCat}
								<li><a href="javascript:void(0);" onclick="javascript:$('#conocioid').val({$arrCat['idConocio']}); $('#btnConocio').html('{$arrCat['descripcion']} <span class=\'caret\'></span></button>');">{$arrCat['descripcion']}</a></li>
							{/foreach}
					    </ul>
					</div>
				</div>
				<div class="row" style="display: none;">
					<div class="col-md-1">
						<span class="glyphicon glyphicon-calendar col-md-12"></span>
					</div>
					<div class="col-md-4">
						<input data-toggle="tooltip" data-placement="top" title="Fecha de nacimiento" class="under"  type="text" placeholder="Fecha de nacimiento" name="fechaNac" id="fechaNac" value="{$CLIENTES['fechaNacimientoCliente']}">
					</div>
					<div class="col-md-3">
						<input type="text" name="anos" id="anos" disabled="" placeholder="años" class="under classNumber" value="{$CLIENTES['edadCliente']}">
					</div>

				</div>
				<div class="col-md-12 nuevoDropMenu">
				    <p style="  text-indent: -30px; font-size: 15px; cursor: pointer;" class="trans masDireccion" type="button"><b>Dirección</b>
				    <span class="caret"></span></p>
				    <input value="{$CLIENTES['idDireccion']}" type="hidden" name="idDireccion" id="idDireccion">
				    <div class="trans contentMas {if $CLIENTES['estatusFacturacion'] == '1'}hidden{/if}">
				    <div class="row">
				    	<div class="col-md-1" style="padding: 0px;">
				    		<span class="glyphicon glyphicon-home col-md-12"></span>
				    	</div>
						<div class="col-md-11" style="padding: 0px;">
							<div class="col-md-6">
					    		<input data-toggle="tooltip" data-placement="top" title="Calle" class="under" type="text" name="calle" id="calle" placeholder="Calle" value="{$CLIENTES['calle']}">
					    	</div>
					    	<div class="col-md-3">
					    		<input data-toggle="tooltip" data-placement="top" title="Número interior" class="under classNumber" type="text" name="int" id="int" placeholder="#int" value="{$CLIENTES['calleInt']}">
					    	</div>
					    	<div class="col-md-3">
					    		<input data-toggle="tooltip" data-placement="top" title="Número exterior" class="under classNumber" type="text" name="ext" id="ext" placeholder="#ext" value="{$CLIENTES['calleExt']}">
					    	</div>
					    	<div class="col-md-6">
					    		<input data-toggle="tooltip" data-placement="top" title="Colonia" class="under" type="text" name="colonia" id="colonia" placeholder="Colonia" value="{$CLIENTES['colonia']}">
					    	</div>
					    	<div class="col-md-6">
					    		<input data-toggle="tooltip" data-placement="top" title="Referencia" class="under" type="text" name="referencia" id="referencia" placeholder="Referencia" value="{$CLIENTES['referencia']}">
					    	</div>
					    	<div class="col-md-4">
					    		<input data-toggle="tooltip" data-placement="top" title="Código postal" class="under classNumber" type="text" name="codigopostal" id="codigopostal" placeholder="Código postal" value="{$CLIENTES['cp']}">
					    	</div>
					    	<div class="col-md-4">
					    		<select data-toggle="tooltip" data-placement="top" title="País" class="under" name="pais" id="pais" placeholder="País">
					    			<option value="0" selected="">Seleccione</option>
					    			{foreach from=$PAISES item = arrPais key = k}
					    				<option value="{$arrPais['id']}" {if $CLIENTES['pais'] == $arrPais['id']} selected="" {/if}>{$arrPais['nombre']}</option>
					    			{/foreach}
					    		</select>
					    	</div>
					    	<div class="col-md-4">
					    		<select data-toggle="tooltip" data-placement="top" title="Estado" class="under" name="estado" id="estado" placeholder="estado">
					    			{if $CLIENTES['estado'] != '' && $CLIENTES['estado'] != 0}
					    				<option value="{$CLIENTES['estado']}" selected="">{$CLIENTES['nombreEstado']}</option>
					    			{else}
					    				<option value="0" selected="">Seleccione</option>
					    			{/if}
					    		</select>
					    	</div>
					    	<div class="col-md-4">
					    		<select data-toggle="tooltip" data-placement="top" title="Municipio" class="under" name="municipio" id="municipio" placeholder="municipio">
					    			{if $CLIENTES['municipio'] != '' && $CLIENTES['municipio'] != 0}
					    				<option value="{$CLIENTES['municipio']}" selected="">{$CLIENTES['nombreMunicipio']}</option>
					    			{else}
					    				<option value="0" selected="">Seleccione</option>
					    			{/if}
					    		</select>
					    	</div>
					    	<div class="col-md-4">
					    		<input data-toggle="tooltip" data-placement="top" title="Localidad" class="under" type="text" name="localidad" id="localidad" placeholder="Localidad" value="{$CLIENTES['localidad']}">
					    	</div>
				    	</div>
				    </div>
				    </div>
				    <div style="clearfix"></div>
			  	</div>
				<div class="row">
					<b>Facturación</b>
				</div>
				<div class="row">
					<div class="col-md-1">
						<span class="glyphicon glyphicon-qrcode col-md-12"></span>
					</div>
					<div class="col-md-4">
						<input data-toggle="tooltip" data-placement="top" title="RFC" class="under" type="RFC" name="rfc" id="rfc" placeholder="RFC" value="{$CLIENTES['rfcCliente']}">
					</div>
					<div class="col-md-7">
					<label>
					    <input type="checkbox" name="estatusFacturacion" id="estatusFacturacion" value="1" {if $CLIENTES['estatusFacturacion'] == '1'} checked="checked"{/if}>
					    Utilizar la dirección personal para facturación.
					</label>
					</div>
				</div>

				{*//////////////////////////////DIRECCION 2//////////////////////////*}
				<input value="{$CLIENTES['idDireccion2']}" type="hidden" name="idDireccion2" id="idDireccion2">
				<div class="trans contentMas2 {if $CLIENTES['estatusFacturacion'] == '1'}hidden{/if}">
				    <div class="row">
				    	<div class="col-md-1" style="padding: 0px;">
				    		<span class="glyphicon glyphicon-home col-md-12"></span>
				    	</div>
						<div class="col-md-11" style="padding: 0px;">
							<div class="col-md-6">
					    		<input data-toggle="tooltip" data-placement="top" title="Calle" class="under" type="text" name="calle2" id="calle2" placeholder="Calle" value="{$CLIENTES['calle2']}">
					    	</div>
					    	<div class="col-md-3">
					    		<input data-toggle="tooltip" data-placement="top" title="Número interior" class="under classNumber" type="text" name="int2" id="int2" placeholder="#int" value="{$CLIENTES['calleInt2']}">
					    	</div>
					    	<div class="col-md-3">
					    		<input data-toggle="tooltip" data-placement="top" title="Número exterior" class="under classNumber" type="text" name="ext2" id="ext2" placeholder="#ext" value="{$CLIENTES['calleExt2']}">
					    	</div>
					    	<div class="col-md-6">
					    		<input data-toggle="tooltip" data-placement="top" title="Colonia" class="under" type="text" name="colonia2" id="colonia2" placeholder="Colonia" value="{$CLIENTES['colonia2']}">
					    	</div>
					    	<div class="col-md-6">
					    		<input data-toggle="tooltip" data-placement="top" title="Referencia" class="under" type="text" name="referencia2" id="referencia2" placeholder="Referencia" value="{$CLIENTES['referencia2']}">
					    	</div>
					    	<div class="col-md-4">
					    		<input data-toggle="tooltip" data-placement="top" title="Código postal" class="under classNumber" type="text" name="codigopostal2" id="codigopostal2" placeholder="Código postal" value="{$CLIENTES['cp2']}">
					    	</div>
					    	<div class="col-md-4">
					    		<select data-toggle="tooltip" data-placement="top" title="País" class="under" name="pais2" id="pais2" placeholder="País">
					    			<option value="0" selected="">Seleccione</option>
					    			{foreach from=$PAISES item = arrPais key = k}
					    				<option value="{$arrPais['id']}" {if $CLIENTES['pais2'] == $arrPais['id']} selected="" {/if}>{$arrPais['nombre']}</option>
					    			{/foreach}
					    		</select>
					    	</div>
					    	<div class="col-md-4">
					    		<select data-toggle="tooltip" data-placement="top" title="Estado" class="under" name="estado2" id="estado2" placeholder="estado">
					    			{if $CLIENTES['estado2'] != '' && $CLIENTES['estado2'] != 0}
					    				<option value="{$CLIENTES['estado2']}" selected="">{$CLIENTES['nombreEstado2']}</option>
					    			{else}
					    				<option value="0" selected="">Seleccione</option>
					    			{/if}
					    		</select>
					    	</div>
					    	<div class="col-md-4">
					    		<select data-toggle="tooltip" data-placement="top" title="Municipio" class="under" name="municipio2" id="municipio2" placeholder="municipio">
					    			{if $CLIENTES['municipio2'] != '' && $CLIENTES['municipio2'] != 0}
					    				<option value="{$CLIENTES['municipio2']}" selected="">{$CLIENTES['nombreMunicipio2']}</option>
					    			{else}
					    				<option value="0" selected="">Seleccione</option>
					    			{/if}
					    		</select>
					    	</div>
					    	<div class="col-md-4">
					    		<input data-toggle="tooltip" data-placement="top" title="Localidad" class="under" type="text" name="localidad2" id="localidad2" placeholder="Localidad" value="{$CLIENTES['localidad2']}">
					    	</div>
				    	</div>
				    </div>
				</div>
				<div style="clearfix"></div>
				{*//////////////////////////////DIRECCION 2//////////////////////////*}
    	</div>
	</div>
	</form>
	{*<?php  include 'insights.php';?>*}
</div>
{literal}
<script type="text/javascript">
$('.editCodigo').click(function(event) {
	$('#codigoCliente').removeAttr('disabled');
});
$('#pais').change(function(event) {
	idPais = $('#pais').val();
	$.ajax({
		url : "ajax/paises/estados",
		data : {
			'csrf_yoco_tok_name' : function(){ return ($('#token').val() != "") ? $('#token').val() : "";},
			'idPais' : idPais,
		},
		dataType : "json", type: "POST",
		beforeSend: function(){},
		success: function(data){
			if(data.error){
			}
			else{
				$('#estado').find('option').remove();
				$('#estado').append(data.HTML);
				$('#municipio').find('option').remove();
				$('#municipio').append('<option value="0" selected="">Selecione el Estado</option>')
			}
		},
		error: function (){/*$(element).next('div').html('Intente mas Tarde.');*/}
	});
});
$('#estado').change(function(event) {
	idEstado = $('#estado').val();
	$.ajax({
		url : "ajax/paises/municipios",
		data : {
			'csrf_yoco_tok_name' : function(){ return ($('#token').val() != "") ? $('#token').val() : "";},
			'idEstado' : idEstado,
		},
		dataType : "json", type: "POST",
		beforeSend: function(){},
		success: function(data){
			if(data.error){
			}
			else{
				$('#municipio').find('option').remove();
				$('#municipio').append(data.HTML);
			}
		},
		error: function (){/*$(element).next('div').html('Intente mas Tarde.');*/}
	});
});

//////////////// DIRECCION2
$('#pais2').change(function(event) {
	idPais = $('#pais2').val();
	$.ajax({
		url : "ajax/paises/estados",
		data : {
			'csrf_yoco_tok_name' : function(){ return ($('#token').val() != "") ? $('#token').val() : "";},
			'idPais' : idPais,
		},
		dataType : "json", type: "POST",
		beforeSend: function(){},
		success: function(data){
			if(data.error){
			}
			else{
				$('#estado2').find('option').remove();
				$('#estado2').append(data.HTML);
				$('#municipio2').find('option').remove();
				$('#municipio2').append('<option value="0" selected="">Selecione el Estado</option>')
			}
		},
		error: function (){/*$(element).next('div').html('Intente mas Tarde.');*/}
	});
});
$('#estado2').change(function(event) {
	idEstado = $('#estado2').val();
	$.ajax({
		url : "ajax/paises/municipios",
		data : {
			'csrf_yoco_tok_name' : function(){ return ($('#token').val() != "") ? $('#token').val() : "";},
			'idEstado' : idEstado,
		},
		dataType : "json", type: "POST",
		beforeSend: function(){},
		success: function(data){
			if(data.error){
			}
			else{
				$('#municipio2').find('option').remove();
				$('#municipio2').append(data.HTML);
			}
		},
		error: function (){/*$(element).next('div').html('Intente mas Tarde.');*/}
	});
});
$('.masDireccion').click(function(event) {
	$('.contentMas').toggleClass('hidden');
});

$('#estatusFacturacion').change(function(){
	$('.contentMas2').toggleClass('hidden');
});

$('[data-toggle="tooltip"]').tooltip();
$('#fechaNac').datepicker({
	dateFormat: 'dd/mm/yy',
	currentText: 'Hoy',
	changeMonth: true,
	maxDate: '0',
	yearRange: "-80:+0",
	changeYear: true,
	monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
	monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
	dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
	dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sáb'],
	dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sá'],
	weekHeader: 'Sm',
	onSelect: function (date) {
		var birthDay = $('#fechaNac').val();
		var farr = birthDay.split('/');
		birthDay = farr[2]+"/"+farr[1]+"/"+farr[0];
		var DOB = new Date(birthDay);
		var today = new Date();
		var age = today.getTime() - DOB.getTime();
		age = Math.floor(age / (1000 * 60 * 60 * 24 * 365.25));
		$('#anos').val(age);
	}
});
$('.cerrar').on('click', function(){
	if($.trim($('#codigoCliente').val()) != ''){
		$('#loadData').show();
		var dataForm = new FormData();
		var _totalImg = $("[name='foto']")[0].files.length;
		if(_totalImg > 0){
			for (ii = 0; ii < _totalImg; ii++) {dataForm.append('foto', $('#foto')[0].files[ii]);}
		}else{dataForm.append('foto', $('#foto')[0].files[0]);}

		dataForm.append('csrf_yoco_tok_name', $("#token").val());
		dataForm.append('codigoCliente', $("#codigoCliente").val());
		dataForm.append('idCliente', $("#idCliente").val());
		dataForm.append('nombre', $("#nombre").val());
		dataForm.append('apellido', $("#apellido").val());
		dataForm.append('email', $("#Email").val());
		dataForm.append('telefono', $("#telefono").val());
		dataForm.append('fechaNac', $("#fechaNac").val());
		dataForm.append('anos', $("#anos").val());
		dataForm.append('conocioid', $("#conocioid").val());
		dataForm.append('idDireccion', $("#idDireccion").val());
		dataForm.append('calle', $("#calle").val());
		dataForm.append('int', $("#int").val());
		dataForm.append('ext', $("#ext").val());
		dataForm.append('colonia', $("#colonia").val());
		dataForm.append('referencia', $("#referencia").val());
		dataForm.append('codigopostal', $("#codigopostal").val());
		dataForm.append('pais', $("#pais").val());
		dataForm.append('estado', $("#estado").val());
		dataForm.append('municipio', $("#municipio").val());
		dataForm.append('localidad', $("#localidad").val());
		dataForm.append('rfc', $("#rfc").val());
		dataForm.append('estatusFacturacion', ( $('#estatusFacturacion').is(':checked') ? 1 : 0 ));

		dataForm.append('idDireccion2', $("#idDireccion2").val());

		if($('#estatusFacturacion').is(':checked')){
			dataForm.append('calle2', '');
			dataForm.append('int2', '');
			dataForm.append('ext2', '');
			dataForm.append('colonia2', '');
			dataForm.append('referencia2', '');
			dataForm.append('codigopostal2', '');
			dataForm.append('pais2', '');
			dataForm.append('estado2', '');
			dataForm.append('municipio2', '');
			dataForm.append('localidad2', '');
		}
		else{
			dataForm.append('calle2', $("#calle2").val());
			dataForm.append('int2', $("#int2").val());
			dataForm.append('ext2', $("#ext2").val());
			dataForm.append('colonia2', $("#colonia2").val());
			dataForm.append('referencia2', $("#referencia2").val());
			dataForm.append('codigopostal2', $("#codigopostal2").val());
			dataForm.append('pais2', $("#pais2").val());
			dataForm.append('estado2', $("#estado2").val());
			dataForm.append('municipio2', $("#municipio2").val());
			dataForm.append('localidad2', $("#localidad2").val());
		}

		$.ajax({
			url : "ajax/guardarCliente",
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
			error: function (){$('#loadData').hide();}
		});
	}
	else{
		$('.overlay-container').fadeOut().end().find('.window-container').removeClass('window-container-visible');
	}
});
$('#preview').click(function(){
	$('#foto').trigger('click');
});
$("#foto").change(function(){
    readURL(this);
});

function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function (e) {
			$('#preview').css('background', 'url('+e.target.result+")");
			$('#preview').css('background-size', '100% 100%');
			$('#preview').css('background-repeat', 'no-repeat');
			$('#preview').removeClass('glyphicon');
			$('#preview').removeClass('glyphicon-user');
		}
		reader.readAsDataURL(input.files[0]);
	}
}
</script>{/literal}
{literal}
<style type="text/css">
	#clienteForm input {
    color: #777;
    font-size: 13px !important;
    line-height: 17px;
}

</style>
{/literal}
