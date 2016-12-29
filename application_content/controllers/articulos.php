<?php
class articulos extends MY_Controller {

	public function __construct(){
		parent::__construct();
		$this->load->model('modeloarticulos');
	}

	public function index(){
		$datos = $this->funcionesBasicas('Clientes');
		//echo "<pre>";print_r($this->session->userdata); die();
		$perfilUsuario = $this->session->userdata('perfilUsuario');
		$this->smarty->view( 'Articulos/listadoArticulos.tpl', $datos );
	}

	public function listArticulos(){
		$res = array('error'=>true,'HTML'=>'');
		$datos['ARTICULOS'] = $this->modeloarticulos->listArticulos();
		$datos['idTienda'] = $this->session->userdata('idTienda');
		$HTML = $this->smarty->view( 'Articulos/listArticulos.tpl', $datos ,true);

		$res = array('error'=>false,'HTML'=>$HTML);

		echo json_encode($res);
	}

	public function dataArticulo(){
		$res = array('error'=>true,'HTML'=>'');
		$datos = $this->funcionesBasicas('Clientes');
		$datos['ARTICULOS'] = $this->modeloarticulos->listArticulos()[0];
		$datos['CATCONOCIO'] = $this->modeloadmin->catalogo('conocio');
		//echo "<pre>";print_r($datos['ARTICULOS']);die();
		$datos['idTienda'] = $this->session->userdata('idTienda');

		$HTML = $this->smarty->view( 'Articulos/articuloData.tpl', $datos ,true);

		$res = array('error'=>false,'HTML'=>$HTML);
		echo json_encode($res);
	}

	public function saveDataArticulo(){
		$res = array('error'=>true,'HTML'=>'');
		$res = $this->modeloarticulos->saveDataArticulo();
		echo json_encode($res);
	}

	public function deleteArticulo(){
		$res = array('error'=>true,'HTML'=>'');
		$res = $this->modeloarticulos->deleteArticulo();
		echo json_encode($res);
	}

}
