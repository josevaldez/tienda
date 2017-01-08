{foreach from=$CATEGORIAS key = k1 item = arrCategoria1}
<div class="col-md-6 categoriaList">
<div class="panel panel-info">
	<div class="panel-heading"><button onclick="javascript:deleteCategoria('{$arrCategoria1['idCat']}',1);" data-idArticulo='{$arrCategoria1['idCat']}' data-toggle="tooltip" data-placement="top" title="Eliminar Categoria"><span class="glyphicon glyphicon-remove"></span></button>

	<div class="Mini1 mousehover glyphicon {if $arrCategoria1['imagen'] == ''}glyphicon-picture{/if}"
        		{if $arrCategoria1['imagen'] != ''}
        			style="background: url(resources/imagenesCategorias/{$idTienda}/{$arrCategoria1['imagen']});background-size: 100% 100%; background-repeat: no-repeat;"
				{/if} ></div>

				{$arrCategoria1['categoria']} <button type="button" onclick="javascript:editarCategoria('{$arrCategoria1['idCat']}');" data-toggle="tooltip" title="Editar"><span class="glyphicon glyphicon-pencil"></span></button></div>
	<div class="panel-body" style="padding: 10px 0 0 0;">
	{if $arrCategoria1['CATEGORIAS2']|@count > 0}
	{foreach from=$arrCategoria1['CATEGORIAS2'] key = k2 item = arrCategoria2}
		<div class="col-md-6">
		<div class="panel panel-success">
			<div class="panel-heading"><button onclick="javascript:deleteCategoria('{$arrCategoria2['idCat']}',2);" data-idArticulo='{$arrCategoria2['idCat']}' data-toggle="tooltip" data-placement="top" title="Eliminar Categoria"><span class="glyphicon glyphicon-remove"></span></button>
			<div class="Mini1 mousehover glyphicon {if $arrCategoria1['imagen'] == ''}glyphicon-picture{/if}"
        		{if $arrCategoria2['imagen'] != ''}
        			style="background: url(resources/imagenesCategorias/{$idTienda}/{$arrCategoria2['imagen']});background-size: 100% 100%; background-repeat: no-repeat;"
				{/if} ></div>
				{$arrCategoria2['categoria']} <button type="button" onclick="javascript:editarCategoria('{$arrCategoria2['idCat']}');" data-toggle="tooltip" title="Editar"><span class="glyphicon glyphicon-pencil"></span></button></div>
			<div class="panel-body" style="padding: 10px 0 10px 0;">
				{if $arrCategoria2['CATEGORIAS3']|@count > 0}
				{foreach from=$arrCategoria2['CATEGORIAS3'] key = k3 item = arrCategoria3}
					<div class="col-md-6" style="padding: 5px; border: 1px solid #ccc">
						<button onclick="javascript:deleteCategoria('{$arrCategoria3['idCat']}',3);" data-idArticulo='{$arrCategoria3['idCat']}' data-toggle="tooltip" data-placement="top" title="Eliminar Categoria"><span class="glyphicon glyphicon-remove"></span></button>
						<div class="Mini1 mousehover glyphicon {if $arrCategoria1['imagen'] == ''}glyphicon-picture{/if}"
        		{if $arrCategoria3['imagen'] != ''}
        			style="background: url(resources/imagenesCategorias/{$idTienda}/{$arrCategoria3['imagen']});background-size: 100% 100%; background-repeat: no-repeat;"
				{/if} ></div>
				{$arrCategoria3['categoria']} <button type="button" onclick="javascript:editarCategoria('{$arrCategoria3['idCat']}');" data-toggle="tooltip" title="Editar"><span class="glyphicon glyphicon-pencil"></span></button>
					</div>
				{/foreach}
				{/if}
				<div class="clearfix"></div>
				<ul class="list" style="padding: 0px"><li data-toggle="tooltip" title="Agregar Categoria hija de {$arrCategoria2['categoria']}" style="width: auto;" class="panelClient plusBtn" onclick="javascript:agregarCategoria({$arrCategoria2['idCat']},3)"><section class="left " style="display: block;"><div class="plusBtn ">+</div></section></li></ul>
				<div class="clearfix"></div>
			</div>
		</div>
		</div>
	{/foreach}
	{/if}
	<div class="clearfix"></div>
	<ul class="list" style="padding: 0px"><li data-toggle="tooltip" title="Agregar Categoria hija de {$arrCategoria1['categoria']}" style="width: auto;" class="panelClient plusBtn" onclick="javascript:agregarCategoria({$arrCategoria1['idCat']},2)"><section class="left " style="display: block;"><div class="plusBtn ">+</div></section></li></ul>
	<div class="clearfix"></div>
	</div>
</div>
</div>
{if $k1 % 2 == 1}
<div class="col-md-12 categoriaList"></div>
{/if}
{/foreach}