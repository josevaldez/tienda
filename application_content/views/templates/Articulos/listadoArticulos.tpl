{include file="headerLogged.tpl"}
<div class="container ">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="clientBox">
		<div class="panelClients cliente-grid">
			<div class="panelHeader col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<span class="col-md-1 col-xs-12 np"><b>Artículos</b></span>
				<form id="custom-search-form" class="form-search form-horizontal col-md-4 col-xs-8">
	                <div id="search3" class="input-append span12">
	                    <input style="color:#888; border:none;" type="text" id="inputSearch" class="search-query col-xs-10" placeholder=" Buscar"/>
	                    <button type="button" id="btnSearch" class="col-xs-2 search2 btn glyphicon glyphicon-remove-circle"> </button>
	                </div>
	            </form>
	            <span class="list-style-buttons pull-right col-xs-7 text-right">
	            	<a href="javascript:void(0);" onclick="deleteCliente(0);" id="deleteClientes" class="switcher hidden"><span class="glyphicon glyphicon-trash"></span> Eliminar</a>

			        {*<a href="javascript:void(0);" id="sendClientes" class="switcher hidden"><span class="glyphicon glyphicon-envelope"></span> Enviar Cotización</a>*}
					<a data-toggle="tooltip" data-placement="top" title="Descripcion" href="#" id="listview" class="switcher "><span class="glyphicon glyphicon-th-list"></span></a>
					<a href="#" id="gridview" class="switcher active"><span class="glyphicon glyphicon-th"></span></a>
				</span>
			</div>
			<div class="panelBody" style="padding: 10px 0;">
				<ul id="products" class="grid clearfix">
					<!-- row 1 -->
					<li class="clearfix panelClient text-center newProspecto btnAddLista" style="padding: 13px 10px 10px;">
						<section class="left btnAddLista" style="display: block;">
							<div class="plusBtn btnAddLista">+</div>
						</section>

					</li>
					<li class="clearfix alt header-item ">
						<div class="col-md-1">clave</div>
						<div class="col-md-3">Nombre</div>
						<div class="col-md-1">Edad</div>
						<div class="col-md-3">Email</div>
						<div class="col-md-2">Teléfono</div>
						<div class="col-md-1"></div>
					</li>
				</ul>

			</div>
		</div>
		<div class="overlay-container cliente-detalle" id="ventanaDetalle" style="display: none">
		    <div class="window-container zoomout" id="ventanaDetalleContenido">

		    </div>
		</div>
	</div>
</div>

<script type="text/javascript" src="{$INDEX_YOCO}/resources/js/articulos.js"></script>
{include file="footer.tpl"}