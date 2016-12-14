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
    	var uri = '/{$raiz}/';
    </script>
    <script src="{$raiz}resources/js/general.js?_{$random}"></script>
    <script type="text/javascript" src="{$raiz}resources/js/jquery.gritter.min.js"></script>
    <script type="text/javascript" src="{$raiz}resources/js/grid.locale-es.js"></script>

    <link href="{$raiz}resources/css/jquery-ui.css" rel="stylesheet">
    <link href="{$raiz}resources/dist/css/bootstrap.css" rel="stylesheet">
    <link href="{$raiz}resources/css/main.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="{$raiz}resources/css/jquery.gritter.css" />

    <link href="{$raiz}resources/css/custom.css" rel="stylesheet">
    <link href="{$raiz}resources/css/login.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body style="background-image: url('{$dataBack[0]['rutaImagen']}');">
<div id="loadData" ><div id="loadDatacontent" ></div>
	<div id="loadDatatext" class="alert alert-warning col-sm-3">Cargando... <img src="{$raiz}resources/images/load_transparent.gif" width="20px"> <span>Por favor, espere.</span></div>
</div>