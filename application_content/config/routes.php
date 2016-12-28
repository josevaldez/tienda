<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

$route['default_controller'] = "admin";
$route['inicio'] = "admin/portada";
$route['salir'] = "admin/salir";

//CLIENTES
$route['clientes'] = "clientes/index";
$route['ajax/listarClientes'] = "clientes/listClientes";
$route['ajax/dataCliente'] = "clientes/dataCliente";
$route['ajax/guardarCliente'] = "clientes/saveDataCliente";
$route['ajax/eliminarCliente'] = "clientes/deleteCliente";

$route['(:any)'] = 'admin';
$route['404_override'] = '';
