{foreach from=$CLIENTES key = kc item = arrCliente}
<li class="clearfix alt panelClient back" onclick="javascript:cargarDataCliente('{$arrCliente['idCliente']}');" style="background: url({if $arrCliente['fotoCliente'] != ''}{$arrCliente['fotoCliente']}{else}resources/images/clienteSF.png{/if});">
	<section class="left">
		<div class="col-md-1  pc">{$arrCliente['codigoCliente']}</div>
		<div class="col-md-3 col-xs-3">{$arrCliente['nombresCliente']} {$arrCliente['apellidosCliente']}</div>
		<div class="col-md-1 col-xs-3 ">{$arrCliente['edadCliente']} años</div>
		<div class="col-md-3 col-xs3">{$arrCliente['emailCliente']}</div>
		<div class="col-md-2 pc">{$arrCliente['telefonoCliente']}</div>
		<div class="col-md-1 pc"><span class="glyphicon glyphicon-remove"></span></div>
	</section>
	<section class="right">
		<p class="name">{$arrCliente['nombresCliente']}</p>
		<p class="midle">{$arrCliente['edadCliente']} años</p>
	</section>
</li>
{/foreach}