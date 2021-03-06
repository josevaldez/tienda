<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

$route['default_controller'] = "admin";
$route['inicio'] = "admin/portada";
$route['salir'] = "admin/salir";

$route['ajax/guardarMenuEstatus'] = "admin/saveEstatusMenu";

//CLIENTES
$route['clientes'] = "clientes/index";
$route['ajax/listarClientes'] = "clientes/listClientes";
$route['ajax/dataCliente'] = "clientes/dataCliente";
$route['ajax/guardarCliente'] = "clientes/saveDataCliente";
$route['ajax/eliminarCliente'] = "clientes/deleteCliente";
$route['ajax/paises/(:any)'] = "clientes/getListPaises/$1";

//ARTICULOS
$route['articulos'] = "articulos/index";
$route['catalogoArticulos'] = "articulos/articulosView";
$route['ajax/listarArticulos'] = "articulos/listArticulos";
$route['ajax/dataArticulo'] = "articulos/dataArticulo";
$route['ajax/guardarArticulo'] = "articulos/saveDataArticulo";
$route['ajax/eliminarArticulo'] = "articulos/deleteArticulo";
$route['ajax/obtenerImagenesArticulo'] = "articulos/getImagenesArticulo";
$route['ajax/guardarImagenArticulo'] = "articulos/saveImagenArticulo";
$route['ajax/asignatPortadaArticulo'] = "articulos/setPortadaArticulo";
$route['ajax/eliminarImagenArticulo'] = "articulos/deleteImagenArticulo";

$route['ajax/autocomplete/categoriasTienda'] = "admin/autocomplete/categorias";
$route['ajax/autocomplete/sucursalesTienda'] = "admin/autocomplete/sucursales";

//CATEGORIAS
$route['categorias'] = "articulos/categoriasView";
$route['ajax/listarCategorias'] = "articulos/listCategorias";
$route['ajax/dataCategoria'] = "articulos/dataCategoria";
$route['ajax/guardarCategoria'] = "articulos/saveDataCategoria";
$route['ajax/eliminarCategoria'] = "articulos/deleteCategoria";

$route['(:any)'] = 'admin';
$route['404_override'] = '';
