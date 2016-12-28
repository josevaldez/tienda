
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
	        	<input data-toggle="tooltip" data-placement="top" title="cliente" id="codigoCliente" value="{$CLIENTES['codigoCliente']}" class="under col-md-7" type="text" name="codigoCliente">
	        	<input value="{$CLIENTES['idCliente']}" type="hidden" name="idCliente" id="idCliente">
	        	<input value="{$token}" type="hidden" name="{$token_name}" id="token">
	        	<span class="glyphicon glyphicon-pencil  col-md-2"></span>
	        </div>
	        <input type="file" name="foto" id="foto" accept='image/*'>
        	<div id="preview" class="profile glyphicon {if $CLIENTES['fotoCliente'] == ''}glyphicon-user{/if}"
        		{if $CLIENTES['fotoCliente'] != ''}
        			style="background: url(resources/fotosClientes/{$idTienda}/{$CLIENTES['fotoCliente']});background-size: 100% 100%; background-repeat: no-repeat;"
				{/if} ></div>
    	</div>
    	<div class="col-md-1"></div>
		<div class="col-md-7">
				<div class="row">
					<span class="glyphicon glyphicon-user col-md-1"></span>
					<input data-toggle="tooltip" data-placement="top" title="Nombre" class="under col-md-4" type="text" name="nombre" id="nombre" placeholder="Nombre" value="{$CLIENTES['nombresCliente']}">
					<input data-toggle="tooltip" data-placement="top" title="Apellidos" class="under col-md-6" type="text" name="apellido" id="apellido" placeholder="Apellidos" value="{$CLIENTES['apellidosCliente']}">
				</div>
				<div class="row">
					<span class="glyphicon glyphicon-envelope col-md-1"></span>
					<input data-toggle="tooltip" data-placement="top" title="Email" class="under col-md-5" type="Email" name="email" id="Email" placeholder="Email" value="{$CLIENTES['emailCliente']}">
					<span class="glyphicon glyphicon-earphone col-md-1"></span>
					<input data-toggle="tooltip" data-placement="top" title="Teléfono(celular, fijo)" class="under col-md-4" type=" tel" name="telefono" id="telefono" placeholder="Teléfono(celular, fijo)" value="{$CLIENTES['telefonoCliente']}">
				</div>
				<div class="row">
					<span class="glyphicon glyphicon-calendar col-md-1"></span>
					<input data-toggle="tooltip" data-placement="top" title="Fecha de nacimiento" class="under col-md-4"  type="text" placeholder="Fecha de nacimiento" name="fechaNac" id="fechaNac" value="{$CLIENTES['fechaNacimientoCliente']}">
					<input type="text" name="anos" id="anos" placeholder="años" class="under col-md-2" value="{$CLIENTES['edadCliente']}">
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
				<div class="dropdown col-md-12">
				    <p style="  text-indent: -15px; cursor: pointer;" class="trans dropdown-toggle" type="button" data-toggle="dropdown">Más
				    <span class="caret"></span></p>
				    <input value="{$CLIENTES['idDireccion']}" type="hidden" name="idDireccion" id="idDireccion">
				    <div class="dropdown-menu trans">
				    	<span class="glyphicon glyphicon-calendar col-md-3">Domicilio:</span> <input data-toggle="tooltip" data-placement="top" title="calle" class="under col-md-4" type=" text" name="calle" id="calle" placeholder="Calle" value="{$CLIENTES['calle']}">
				    	<input data-toggle="tooltip" data-placement="top" title="#ext" class="under col-md-2" type=" text" name="int" id="int" placeholder="#int" value="{$CLIENTES['calleInt']}">
				    	<input data-toggle="tooltip" data-placement="top" title="#ext" class="under col-md-2" type=" text" name="ext" id="ext" placeholder="#ext" value="{$CLIENTES['calleExt']}">
				    	<div class="col-md-3"></div>
				    	<input data-toggle="tooltip" data-placement="top" title="colonia" class="under col-md-4" type=" text" name="colonia" id="colonia" placeholder="colonia" value="{$CLIENTES['colonia']}">
				    	<input data-toggle="tooltip" data-placement="top" title="referencia" class="under col-md-4" type=" text" name="referencia" id="referencia" placeholder="referencia" value="{$CLIENTES['referencia']}">
				    	<div class="col-md-3"></div>
				    	<input data-toggle="tooltip" data-placement="top" title="código postal" class="under col-md-4" type=" text" name="codigopostal" id="codigopostal" placeholder="código postal" value="{$CLIENTES['cp']}">
				    	<input data-toggle="tooltip" data-placement="top" title="pais" class="under col-md-2" type=" text" name="pais" id="pais" placeholder="pais" value="{$CLIENTES['pais']}">
				    	<input data-toggle="tooltip" data-placement="top" title="estado" class="under col-md-2" type=" text" name="estado" id="estado" placeholder="estado" value="{$CLIENTES['estado']}">
				    	<div class="col-md-3"></div>
				    	<input data-toggle="tooltip" data-placement="top" title="municipio" class="under
				    	col-md-2" type=" text" name="municipio" id="municipio" placeholder="municipio" value="{$CLIENTES['municipio']}">
				    	<input data-toggle="tooltip" data-placement="top" title="localidad" class="under
				    	col-md-2" type=" text" name="localidad" id="localidad" placeholder="localidad" value="{$CLIENTES['localidad']}">

				    </div>
				    <div style="clearfix"></div>
			  </div>
				<div class="row">
									<b>Facturacion</b>
								</div>
								<div class="row">
									<span class="glyphicon glyphicon-qrcode col-md-1"></span>
									<input data-toggle="tooltip" data-placement="top" title="RFC" class="under col-md-4" type="RFC" name="rfc" id="rfc" placeholder="RFC" value="{$CLIENTES['rfcCliente']}">
									<label>
									    <input type="checkbox" name="estatusFacturacion" id="estatusFacturacion" value="1" {if $CLIENTES['estatusFacturacion'] == '1'} checked="checked"{/if}>
									    Utilizar la dirección personal para facturación.
									</label>
								</div>
    	</div>
	</div>
	</form>
	{*<?php  include 'insights.php';?>*}
</div>
{literal}
<script type="text/javascript">$('.cerrar').on('click', function(){$('.overlay-container').fadeOut().end().find('.window-container').removeClass('window-container-visible');
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
