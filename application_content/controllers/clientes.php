<?php
class clientes extends MY_Controller {

	public function __construct(){
		parent::__construct();
		$this->load->model('modeloclientes');
	}

	public function index(){
		$datos = $this->funcionesBasicas('Clientes');
		//echo "<pre>";print_r($this->session->userdata); die();
		$perfilUsuario = $this->session->userdata('perfilUsuario');
		$this->smarty->view( 'Clientes/listadoClientes.tpl', $datos );
	}

	public function listClientes(){
		$res = array('error'=>true,'HTML'=>'');
		$datos['CLIENTES'] = $this->modeloclientes->listClientes();
		$datos['idTienda'] = $this->session->userdata('idTienda');
		$HTML = $this->smarty->view( 'Clientes/listClientes.tpl', $datos ,true);

		$res = array('error'=>false,'HTML'=>$HTML);

		echo json_encode($res);
	}

	public function dataCliente(){
		$res = array('error'=>true,'HTML'=>'');
		$datos = $this->funcionesBasicas('Clientes');
		$datos['CLIENTES'] = $this->modeloclientes->listClientes()[0];
		$datos['CATCONOCIO'] = $this->modeloadmin->catalogo('conocio');
		$datos['PAISES'] = $this->modeloadmin->catalogo('paises');
		//echo "<pre>";print_r($datos['CLIENTES']);die();
		$datos['idTienda'] = $this->session->userdata('idTienda');

		$HTML = $this->smarty->view( 'Clientes/clienteData.tpl', $datos ,true);

		$res = array('error'=>false,'HTML'=>$HTML);
		echo json_encode($res);
	}

	public function saveDataCliente(){
		$res = array('error'=>true,'HTML'=>'');
		$res = $this->modeloclientes->saveDataCliente();
		echo json_encode($res);
	}

	public function deleteCliente(){
		$res = array('error'=>true,'HTML'=>'');
		$res = $this->modeloclientes->deleteCliente();
		echo json_encode($res);
	}

	public function getListPaises($catalogo){
		$res = array('error'=>true,'HTML'=>'');
		$idBuscar = 0;
		if($this->input->post('idPais'))
			$idBuscar = $this->input->post('idPais');
		if($this->input->post('idEstado'))
			$idBuscar = $this->input->post('idEstado');
		$data = $this->modeloadmin->catalogo($catalogo,$idBuscar);
		$html = "";
		if($catalogo == 'estados'){
			$html = '<option value="0" selected="">Selecione el Estado</option>';
		}
		else{
			$html = '<option value="0" selected="">Selecione el Municipio</option>';
		}
		foreach ($data as $key => $arrData) {
			$html .='<option value="'.$arrData['id'].'">'.$arrData['nombre'].'</option>';
		}
		$res = array('error'=>false,'HTML'=>$html);
		echo json_encode($res);
	}

}

