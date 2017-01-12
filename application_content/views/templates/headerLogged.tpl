<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es" xml:lang="es">
<head>
	<title>MiTienda</title>
	<meta charset="utf-8">
	<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
	<meta http-equiv="Expires" content="0">
	<meta http-equiv="Cache-Control" content="no-cache" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!--link rel="shortcut icon" media="all" type="image/x-icon" href="{$raiz}resources/images/favicon.ico" /-->
    <script type="text/javascript" src="{$raiz}resources/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="{$raiz}resources/js/jquery-ui.js"></script>
    <script type="text/javascript">
    	var uri = '{$raiz}';
    </script>
    <script src="{$raiz}resources/js/general.js"></script>
    <script type="text/javascript" src="{$raiz}resources/js/jquery.gritter.min.js"></script>
    <script type="text/javascript" src="{$raiz}resources/js/grid.locale-es.js"></script>

    <link href="{$raiz}resources/css/jquery-ui.css" rel="stylesheet">
    <link href="{$raiz}resources/dist/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="{$raiz}resources/css/jquery.gritter.css" />

    <link href="{$raiz}resources/css/bootstrap.css" rel="stylesheet">

    <script src="{$raiz}resources/js/bootstrap.min.js"></script>
	<script src="{$raiz}resources/js/modernizr.custom.js"></script>
	<script src="{$raiz}resources/js/modernizr.custom.53451.js"></script>
	<script src="{$raiz}resources/js/moment.js"></script>
	<script src="{$raiz}resources/js/bootstrap-datetimepicker.js"></script>
	<script src="{$raiz}resources/js/grid.js"></script>
    <script src="{$raiz}resources/js/demo.js"></script>

	<link href="{$raiz}resources/css/custom.css" rel="stylesheet">
    <link href="{$raiz}resources/css/login.css" rel="stylesheet">
    <link href="{$raiz}resources/css/grid.css" rel="stylesheet">
    <link href="{$raiz}resources/css/demo.css" rel="stylesheet">
    <link href="{$raiz}resources/css/component.css" rel="stylesheet">

    <link href="{$raiz}resources/css/main.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<div id="loadData" ><div id="loadDatacontent" style="background: rgba(251,251,251, 0.76);
    width: 100%;
    height: 100%;
    display: table;
    position: fixed;
    top: 0;
    left: 0;
    text-align: center;
    z-index: 9999"></div>
	<div id="loadDatatext" style="z-index: 10000; top:45%; left: 45%" class="alert alert-warning col-sm-3"><img src="{$raiz}resources/images/load_transparent.gif" width="20px"></div>
</div>
{literal}
<script type="text/javascript">
	$(document).ready(function(){
		$('#logo').click(function(e) {
			$( ".nav5" ).show();
			$("#nav-icon4").trigger("click");

			$('#logo').toggleClass('esconder');
            funcionMenuGuardar(2);
		});

		$('#nav-icon1,#nav-icon2,#nav-icon3,#nav-icon4').click(function(){
			if($(this).hasClass('open')){
				$( ".nav5" ).hide();
				setTimeout(function(){
					$('#logo').toggleClass('esconder');
				},700)
			}
			$(this).toggleClass('open');
			$('.dropdownMenu').toggle("slide", { direction: "Right" }, 800);
			$('.brand').toggleClass('esconder');

		});
        $('#nav-icon4').click(function(){
            funcionMenuGuardar(1);
        });
	});

    function funcionMenuGuardar($estatus){
        $.ajax({
        url : "ajax/guardarMenuEstatus",
        data : {
            'csrf_yoco_tok_name' : function(){ return ($('#token').val() != "") ? $('#token').val() : "";},
            'estatus' : $estatus,
        },
        dataType : "json", type: "POST",
        beforeSend: function(){},
        success: function(data){
        },
        error: function (){$( "#products").unbind( "mousedown" );
                $( "#products" ).selectable();cont++;/*$(element).next('div').html('Intente mas Tarde.');*/}
    });

    }
</script>
{/literal}

<header>

<input type="hidden" name="{$token_name}" value="{$token}" id="token">
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style=" background-blend-mode: multiply; background-color: #999; background-position: center -343px; background-image:url('{$raiz}resources/images/background/img4.jpg');">
        <div class="container col-xs-12" style="position: relative;">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header col-md-12 col-xs-12">
                <a id="logo" class="navbar-brand {if $estatusMenu == 2}esconder{/if}" href="#"><div class="logo2"><span style="margin-left: -14px;">YO<span> <br> CO</span></span></div></a>
                <p class="brand pc {if $estatusMenu == 2}esconder{/if}" >
                  <span style="font-size: 32px;">Chuchito de la Colina </span>
                  <span style="style="font-size: 32px;">&#8226;</span>
                  Almacenes Tokio
                </p>
            </div>
            <div class="col-xs-3 col-sm-3 col-md-1 col-lg-1 pull-right text-right nav5"  style="{if $estatusMenu == 1}display:none;{/if}margin-top: 18px; position: absolute; right: 0px; z-index: 99999999;">
                <div id="nav-icon4" {if $estatusMenu == 2}class="open"{/if}>
                  <span></span>
                  <span></span>
                  <span></span>
                </div>

            </div>
        </div>
        <div class="dropdownMenu" style="{if $estatusMenu == 2}display: block{/if}">
            <ul>
            	{foreach from = $SISTEMAS item = valueS key = key}
            		{*<a class="{if $SECCIONACTUAL == $valueS['seccionTitulo']} activo{/if}"  class="{$valueS['seccionMenuCss']}" href="{$INDEX_YOCO}{$valueS['seccionUrl']}"><li>
            		{if $valueS['seccionBotonTitulo'] == 'TEXTO'}
            			{$valueS['seccionTitulo']}
            		{else if $valueS['seccionBotonTitulo'] == 'ICONO'}
            			<span class="{$valueS['iconoMenu']}"></span>
            		{/if}
                    </li></a>*}
                    {if $key == 'Articulos'}
                        <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Articulos </a>
                        <ul class="dropdown-menu">
                        {foreach from=$valueS item=opciones key=key_item}
                            {$url = $opciones['seccionUrl']}
                            <li><a href="{$INDEX_YOCO}{$url}">{$opciones['seccionTitulo']}</a></li>
                            {*<li><a href="{$opciones['seccionUrl']}">{$opciones['seccionTitulo']}</a></li>*}
                        {/foreach}
                        </ul>
                        </li>
                    {else}
                        <a class="{if $SECCIONACTUAL == $valueS['seccionTitulo']} activo{/if}"  class="{$valueS['seccionMenuCss']}" href="{$INDEX_YOCO}{$valueS['seccionUrl']}"><li>
                            {if $valueS['seccionBotonTitulo'] == 'TEXTO'}
                                {$valueS['seccionTitulo']}
                            {else if $valueS['seccionBotonTitulo'] == 'ICONO'}
                                <span class="{$valueS['iconoMenu']}"></span>
                            {/if}
                        </li></a>
                    {/if}
	           	{/foreach}
	           	<a href="{$INDEX_YOCO}salir"><li>Salir</li></a>
            </ul>
     </div>

        <!-- /.container -->
    </nav>
</header>
<div class="container toptop">
      <p class="brand mb text-right col-md-12" >
      <span style="font-size: 20px;">Chuchito de la Colina</span>
      <span style="style="font-size: 8px;">&#8226;</span> <span style="font-size: 16px;">Almacenes Tokio</span></p>
    </div>

{*
<div class="container">  <!-- CONTENEDOR -->
	<div id="mainHeader">
        	<a style="float: left;" href="{$INDEX_YOCO}" > <img src="{$INDEX_YOCO}resources/images/CFE_logo.png" width="220" alt="CFE" class="logoMain"> <img src="{$INDEX_YOCO}resources/images/CFE_logo2.png" width="110" alt="CFE" class="logoMain"> </a>
        <div class="lastDate">
        	<ul class="actividad">
        		<li>Perfil: {$NOMBREUSUARIO} <img src="{$INDEX_YOCO}resources/images/ico_user.png" alt="usuario" class="icon24"></li>
        		<li>{$ULTIMACONEXION}</li>
        	</ul>

    	</div>
    </div>
    <!-- MENU -->
	<div class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
	    <div class="navbar-header">
	        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
	          <span class="sr-only">Navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
	        </button>

	    </div>
	    <div class="navbar-collapse collapse">
	        <ul class="nav navbar-nav">
	        	<li class="{if $SECCIONACTUAL == 'Inicio'} 'active'{/if}"><a href="{$INDEX_YOCO}" class="btn_inicio">Inicio</a></li>
		            {foreach from = $SISTEMAS item = valueS key = key}
		            	<li class="{if $SECCIONACTUAL == $valueS['seccionTitulo']} activo{/if}" ><a href="{$INDEX_YOCO}{$valueS['seccionUrl']}" class="{$valueS['seccionMenuCss']}">{$valueS['seccionTitulo']}</a></li>
		           	{/foreach}
	        </ul>
	        <ul class="nav navbar-nav navbar-right">
	        	<li><a href="{$INDEX_YOCO}salir" class="btn_salir">Salir</a></li>
	        </ul>
	    </div><!--/.nav-collapse -->
	</div><!--/.container-fluid -->
	</div>

	<?php echo $MIGAS ?>
	*}