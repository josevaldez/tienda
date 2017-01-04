{literal}
<style type="text/css">
	.imagenesIncompletas a{
		float: left;
		width: 40%;
		margin: 0 5%;
	}
	.imagenesIncompletas a img{
		width: 100%;
	}
</style>
{/literal}
{nocache}
<section id="dg-container" class="dg-container">
	<div class="{if $IMAGENES|@count > 2}dg-wrapper{else}imagenesIncompletas{/if}">
		{foreach from=$IMAGENES item = IMAGEN key = k}
			<a href="#" class="editThemeBtn"><img src="{$INDEX_YOCO}resources/imagesArticulos/{$idTienda}/{$idArticulo}/{$IMAGEN['imagen']}" >
				<div>
					<label><input type="radio" name="portada" data-idImagen="{$IMAGEN['idRelArticuloImagenes']}" value="{$IMAGEN['idRelArticuloImagenes']}">Portada?</label>
					<button type="button" class="btn btn-danger" onclick="javascript:deleteImagen('{$IMAGEN['idRelArticuloImagenes']}','{$IMAGEN['imagen']}');" data-idImagen="{$IMAGEN['idRelArticuloImagenes']}">Eliminar? <span class="glyphicon glyphicon-remove ui-selectee" style="font-size: 12px"></span></button>
				</div>
			</a>
		{/foreach}
	</div>
	{if $IMAGENES|@count > 2}
	<nav>
		<span class="dg-prev"><</span>
		<span class="dg-next">></span>
	</nav>
	{/if}
</section>
{/nocache}
{if $IMAGENES|@count > 2}
{literal}
<script type="text/javascript">
$('#dg-container').gallery();
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
});
</script>
{/literal}
{/if}