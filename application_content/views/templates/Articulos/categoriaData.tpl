<div class="panelClients">
	<div class="panelHeader col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<span class="col-md-1"><b>Categoria</b></span>
		<span class="cerrar pull-right"></span>
	</div>

    <div class="panelBody col-sm-12 col-md-11 col-lg-12">
    <form id="clienteForm" enctype="multipart/form-data">
    	<div class="col-md-3">
        	<div class="row">
        		<input value="{$idCatPadre}" type="hidden" name="idCatPadre" id="idCatPadre">
	        	<input value="{$CATEGORIA['idCategoria']}" type="hidden" name="idCategoria" id="idCategoria">
	        	<input value="{$token}" type="hidden" name="{$token_name}" id="token">
	        </div>
	        <input type="file" name="foto" class="hidden" id="foto" accept='image/*'>
        	<div id="preview" data-toggle="tooltip" data-placement="top" title="Imagen Categoria" class="profile mousehover glyphicon {if $CATEGORIA['imagen'] == ''}glyphicon-picture{/if}"
        		{if $CATEGORIA['imagen'] != ''}
        			style="background: url(resources/imagenesCategorias/{$idTienda}/{$CATEGORIA['imagen']});background-size: 100% 100%; background-repeat: no-repeat;"
				{/if} ></div>
    	</div>
    	<div class="col-md-1"></div>
		<div class="col-md-7">
				<div class="row">
					<span class="glyphicon glyphicon-pencil col-md-1"></span>
					<input data-toggle="tooltip" data-placement="top" title="Descripcion" class="under col-md-11" type="text" name="Descripcion" id="Descripcion" placeholder="Descripcion" value="{$CATEGORIA['descripcionCategoria']}">
				    <div style="clearfix"></div>
			 	</div>

    	</div>
	</div>
	</form>
	{*<?php  include 'insights.php';?>*}
</div>
{literal}
<script type="text/javascript">
$('[data-toggle="tooltip"]').tooltip();
$('.cerrar').on('click', function(){$('.overlay-container').fadeOut().end().find('.window-container').removeClass('window-container-visible');
	if($.trim($('#Descripcion').val()) != ''){
		var dataForm = new FormData();
		var _totalImg = $("[name='foto']")[0].files.length;
		if(_totalImg > 0){
			for (ii = 0; ii < _totalImg; ii++) {dataForm.append('foto', $('#foto')[0].files[ii]);}
		}else{dataForm.append('foto', $('#foto')[0].files[0]);}

		dataForm.append('csrf_yoco_tok_name', $("#token").val());
		dataForm.append('idCatPadre', $("#idCatPadre").val());
		dataForm.append('idCategoria', $("#idCategoria").val());
		dataForm.append('Descripcion', $("#Descripcion").val());

		$.ajax({
			url : "ajax/guardarCategoria",
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
