<?php
class clientes extends MY_Controller {

	public function __construct(){
		parent::__construct();
		$this->load->model('modeloclientes');
	}

	public function index(){
		$datos = $this->funcionesBasicas('Clientes');
		$perfilUsuario = $this->session->userdata('perfilUsuario');
		$this->smarty->view( 'Clientes/listadoClientes.tpl', $datos );
	}

	public function listClientes(){
		$res = array('error'=>true,'HTML'=>'');
		$datos['CLIENTES'] = $this->modeloclientes->listClientes();
		$HTML = $this->smarty->view( 'Clientes/listClientes.tpl', $datos ,true);

		$res = array('error'=>false,'HTML'=>$HTML);

		echo json_encode($res);
	}

	public function dataCliente(){
		$res = array('error'=>true,'HTML'=>'');
		$datos = $this->funcionesBasicas('Clientes');
		$datos['CLIENTES'] = $this->modeloclientes->listClientes()[0];
		$datos['CATCONOCIO'] = $this->modeloclientes->catalogo('conocio');
		//echo "<pre>";print_r($datos['CLIENTES']);die();
		$HTML = $this->smarty->view( 'Clientes/clienteData.tpl', $datos ,true);

		$res = array('error'=>false,'HTML'=>$HTML);
		echo json_encode($res);
	}

	public function saveDataCliente(){
		$res = array('error'=>true,'HTML'=>'');
		$res = $this->modeloclientes->saveDataCliente();
		echo json_encode($res);
	}

}

