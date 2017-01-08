{literal}
<style type="text/css">
	.imagenesIncompletas a{
		float: left;
		width: 40%;
		margin: 0 5%;
		position: relative;
	}
	.imagenesIncompletas a img{
		width: 100%;
	}
</style>
{/literal}
{nocache}
<section id="dg-container" class="dg-container">
	{if $IMAGENES|@count > 2}
	<nav>
		<span class="dg-prev"><</span>
		<span class="dg-next">></span>
	</nav>
	{/if}
	<input type="hidden" name="imagenesExistentes" id="imagenesExistentes" value="{$IMAGENES|@count}">
	<div class="{if $IMAGENES|@count > 2}dg-wrapper{else}imagenesIncompletas{/if}">
		{foreach from=$IMAGENES item = IMAGEN key = k}
			<a href="#" class="editThemeBtn"><img src="{$INDEX_YOCO}resources/imagesArticulos/{$idTienda}/{$idArticulo}/{$IMAGEN['imagen']}" >
			<span data-toggle="tooltip" data-placement="top" title="Eliminar Imagen?" class="cerrar2" onclick="javascript:deleteImagen('{$IMAGEN['idRelArticuloImagenes']}','{$IMAGEN['imagen']}');" data-idImagen="{$IMAGEN['idRelArticuloImagenes']}"></span>
				<div class="hidden">
					<label><input type="radio" name="portada" data-idImagen="{$IMAGEN['idRelArticuloImagenes']}" value="{$IMAGEN['idRelArticuloImagenes']}">Portada?</label>
					{*<button type="button" class="btn btn-danger" onclick="javascript:deleteImagen('{$IMAGEN['idRelArticuloImagenes']}','{$IMAGEN['imagen']}');" data-idImagen="{$IMAGEN['idRelArticuloImagenes']}">Eliminar? <span class="glyphicon glyphicon-remove ui-selectee" style="font-size: 12px"></span></button>*}
				</div>
				{if $IMAGENES|@count == $k + 1}
				<div class="btnNewImagen">+</div>
				{/if}
			</a>
		{/foreach}
		{*<a href="#"  class="editThemeBtn btnNewImagen">+</a>*}
	</div>

</section>
{/nocache}

{*{if $IMAGENES|@count > 2}*}
{literal}
<script type="text/javascript">
$('.btnNewImagen').click(function(){
	$('#foto').trigger('click');
});

$('#dg-container').gallery();
/*
$('input[type=radio][name=portada]').on('change', function() {
	var idImagen = $(this).val();
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
});*/
</script>
{/literal}
{*{/if}*}
