{foreach from=$ARTICULOS key = kc item = arrArticulo}
<li class="clearfix alt panelClient back" {*onclick="javascript:cargarDataCliente('{$arrArticulo['idArticulo']}');"*} style="background: url(resources/images/clienteSF.png);" data-idArticulo='{$arrArticulo['idArticulo']}'>
	<section class="left">
		<div class="col-md-1  pc">{$arrArticulo['codigoArticulo']}</div>
		<div class="col-md-3 col-xs-3">{$arrArticulo['nombreArticulo']} ({$arrArticulo['nombreCortoArticulo']})</div>
		<div class="col-md-1 col-xs-3 ">$ {$arrArticulo['precioVenta']}</div>
		<div class="col-md-3 col-xs3">{$arrArticulo['palabrasClaveArticulo']}</div>
		<div class="col-md-2 pc">{$arrArticulo['descripcionArticulo']}</div>
		<div class="col-md-1 pc btnEliminarLista"><span class="glyphicon glyphicon-remove btnEliminarLista" onclick="javascript:deleteCliente('{$arrArticulo['idArticulo']}');" data-idArticulo='{$arrArticulo['idArticulo']}'></span></div>
	</section>
	<section class="right">
		<p class="name">{$arrArticulo['nombreArticulo']}</p>
		<p class="midle">{$arrArticulo['precioVenta']} años</p>
	</section>
</li>
{/foreach}