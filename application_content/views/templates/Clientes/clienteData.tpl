
<div class="panelClients">
	<div class="panelHeader col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<span class="col-md-1"><b>Clientes</b></span>
		<span class="cerrar pull-right"></span>
	</div>

    <div class="panelBody col-sm-12 col-md-11 col-lg-12">
    <form id="clienteForm" enctype="multipart/form-data">
    	<div class="col-md-3">
        	<div class="row">
	        	<span class="glyphicon glyphicon-barcode col-md-2"></span>
	        	<input data-toggle="tooltip" data-placement="top" title="cliente" id="codigoCliente" value="{$CLIENTES['codigoCliente']}" class="under col-md-7 classNumber" type="text" name="codigoCliente">
	        	<input value="{$CLIENTES['idCliente']}" type="hidden" name="idCliente" id="idCliente">
	        	<input value="{$token}" type="hidden" name="{$token_name}" id="token">
	        	<span class="glyphicon glyphicon-pencil  col-md-2"></span>
	        </div>
	        <input type="file" name="foto" class="hidden" id="foto" accept='image/*'>
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
					<div class="col-md-6">
						<input data-toggle="tooltip" data-placement="top" title="Nombre" class="under" type="text" name="nombre" id="nombre" placeholder="Nombre" value="{$CLIENTES['nombresCliente']}">
					</div>
					<div class="col-md-5">
						<input data-toggle="tooltip" data-placement="top" title="Apellidos" class="under" type="text" name="apellido" id="apellido" placeholder="Apellidos" value="{$CLIENTES['apellidosCliente']}">
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
					<div class="col-md-5">
						<input data-toggle="tooltip" data-placement="top" title="Teléfono" class="under classNumber" type="tel" name="telefono" id="telefono" placeholder="Teléfono" value="{$CLIENTES['telefonoCliente']}">
					</div>
				</div>
				<div class="row">
					<div class="col-md-1">
						<span class="glyphicon glyphicon-calendar col-md-12"></span>
					</div>
					<div class="col-md-4">
						<input data-toggle="tooltip" data-placement="top" title="Fecha de nacimiento" class="under"  type="text" placeholder="Fecha de nacimiento" name="fechaNac" id="fechaNac" value="{$CLIENTES['fechaNacimientoCliente']}">
					</div>
					<div class="col-md-3">
						<input type="text" name="anos" id="anos" placeholder="años" class="under classNumber" value="{$CLIENTES['edadCliente']}">
					</div>
					<div class="dropdown col-md-4">
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
							{foreach from=$CATCONOCIO key = kc item = arrCat}
								<li><a href="javascript:$('#conocioid').val({$arrCat['idConocio']}); $('#btnConocio').html('{$arrCat['descripcion']} <span class=\'caret\'></span></button>');">{$arrCat['descripcion']}</a></li>
							{/foreach}
					    </ul>
					</div>
				</div>
				<div class="col-md-12 nuevoDropMenu">
				    <p style="  text-indent: -30px; font-size: 15px; cursor: pointer;" class="trans masDireccion" type="button"><b>Dirección</b>
				    <span class="caret"></span></p>
				    <input value="{$CLIENTES['idDireccion']}" type="hidden" name="idDireccion" id="idDireccion">
				    <div class="trans contentMas hidden">
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
    	</div>
	</div>
	</form>
	{*<?php  include 'insights.php';?>*}
</div>
{literal}
<script type="text/javascript">
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
$('.masDireccion').click(function(event) {
	$('.contentMas').toggleClass('hidden');
});
$('[data-toggle="tooltip"]').tooltip();
$('#fechaNac').datepicker({ format: 'DD/MM/YYYY'});
$('.cerrar').on('click', function(){$('.overlay-container').fadeOut().end().find('.window-container').removeClass('window-container-visible');
	if($.trim($('#codigoCliente').val()) != ''){
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
		dataForm.append('estatusFacturacion', $("#estatusFacturacion").val());

		$.ajax({
			url : "ajax/guardarCliente",
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
