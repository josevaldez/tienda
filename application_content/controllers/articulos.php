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
		$this->smarty->view( 'Articulos/articuloIndex.tpl', $datos );
	}

	public function articulosView(){
		$datos = $this->funcionesBasicas('Clientes');
		//echo "<pre>";print_r($this->session->userdata); die();
		$perfilUsuario = $this->session->userdata('perfilUsuario');
		$this->smarty->view( 'Articulos/listadoArticulos.tpl', $datos );
	}

	public function categoriasView(){
		$datos = $this->funcionesBasicas('Clientes');
		//echo "<pre>";print_r($this->session->userdata); die();
		$perfilUsuario = $this->session->userdata('perfilUsuario');
		$this->smarty->view( 'Articulos/listadoCategorias.tpl', $datos );
	}

	public function listArticulos(){
		$res = array('error'=>true,'HTML'=>'');
		$datos['ARTICULOS'] = $this->modeloarticulos->listArticulos();
		$datos['idTienda'] = $this->session->userdata('idTienda');
		$HTML = $this->smarty->view( 'Articulos/listArticulos.tpl', $datos ,true);

		$res = array('error'=>false,'HTML'=>$HTML);

		echo json_encode($res);
	}

	public function getImagenesArticulo(){
		$res = array('error'=>true,'HTML'=>'');
		if($this->input->post('idArticulo') && $this->input->post('idArticulo') != '' && $this->input->post('idArticulo') != '0'){
			$datos['IMAGENES'] = $this->modeloarticulos->listImagenesArticulo();
			$datos['idTienda'] = $this->session->userdata('idTienda');
			$datos['idArticulo'] = $this->input->post('idArticulo');
			$datos['INDEX_YOCO'] = INDEX_YOCO;
			$HTML = $this->smarty->view( 'Articulos/imagenesArticulo.tpl', $datos ,true);

			$res = array('error'=>false,'HTML'=>$HTML,'TOTAL' => count($datos['IMAGENES']));
		}
		echo json_encode($res);
	}

	public function dataArticulo(){
		$res = array('error'=>true,'HTML'=>'');
		$datos = $this->funcionesBasicas('Clientes');
		$datos['ARTICULOS'] = $this->modeloarticulos->listArticulos()[0];
		$datos['ARTICULOS']['TAGS'] = explode(',',$datos['ARTICULOS']['palabrasClaveArticulo']);
		$datos['CATCONOCIO'] = $this->modeloadmin->catalogo('conocio');
		$datos['ARTICULOS']['CATEGORIASID'] = explode(',',$datos['ARTICULOS']['idsCategoria']);
		$datos['ARTICULOS']['CATEGORIASTEXT'] = explode(',',$datos['ARTICULOS']['nombresCategorias']);
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

	public function saveImagenArticulo(){
		$res = array('error'=>true,'HTML'=>'');
		$res = $this->modeloarticulos->saveImagenArticulo();
		echo json_encode($res);
	}

	public function setPortadaArticulo(){
		$dataImagen = array(
			'portada'=> 0
		);
		$idArticulo = $this->input->post('idArticulo');
		$this->db->where('idArticulo', $idArticulo);
		$this->db->update('yoco_rel_articulo_imagenes', $dataImagen);

		$dataImagen = array(
			'portada'=> 1
		);
		$idImagen = $this->input->post('idImagen');
		$this->db->where('idRelArticuloImagenes', $idImagen);
		$this->db->update('yoco_rel_articulo_imagenes', $dataImagen);
		return array('error'=>false,'HTML'=>'Exito');
	}

	public function deleteImagenArticulo(){
		$res = array('error'=>true,'HTML'=>'');
		$res = $this->modeloarticulos->deleteImagenArticulo();
		echo json_encode($res);
	}

	public function listCategorias(){
		$res = array('error'=>true,'HTML'=>'');
		$datos['CATEGORIAS'] = array();
		$categorias1 = $this->modeloarticulos->listCategorias();
		if(count($categorias1) > 0){
			foreach ($categorias1 as $k1 => $arrCat1) {
				if(!in_array(array('idCat'=>$arrCat1['idCat1'], 'categoria' => $arrCat1['descripcionCategoria1'], 'imagen' => $arrCat1['imagen1']), $datos['CATEGORIAS'])){
					 $datos['CATEGORIAS'][] = array('idCat'=>$arrCat1['idCat1'], 'categoria' => $arrCat1['descripcionCategoria1'], 'imagen' => $arrCat1['imagen1']);
				}
			}
			if($datos['CATEGORIAS'] > 0){
				foreach ($datos['CATEGORIAS'] as $k1 => $arrCat1) {
					$datos['CATEGORIAS'][$k1]['CATEGORIAS2'] = array();
					foreach ($categorias1 as $k => $arrCat) {
						if($arrCat1['idCat'] == $arrCat['idCat1']){
							if($arrCat['idCat2'] != '' && !in_array(array('idCat'=>$arrCat['idCat2'], 'categoria' => $arrCat['descripcionCategoria2'], 'imagen' => $arrCat['imagen2']), $datos['CATEGORIAS'][$k1]['CATEGORIAS2'])){
								$datos['CATEGORIAS'][$k1]['CATEGORIAS2'][] = array('idCat'=>$arrCat['idCat2'], 'categoria' => $arrCat['descripcionCategoria2'], 'imagen' => $arrCat['imagen2']);
							}
						}
					}
					$categorias2 = $datos['CATEGORIAS'][$k1]['CATEGORIAS2'];
					if(count($categorias2) > 0){
						foreach ($categorias2 as $k2 => $arrCat2) {
							$datos['CATEGORIAS'][$k1]['CATEGORIAS2'][$k2]['CATEGORIAS3'] = array();
							foreach ($categorias1 as $k => $arrCat) {
								if($arrCat2['idCat'] == $arrCat['idCat2']){
									if($arrCat['idCat3'] != '' && !in_array(array('idCat'=>$arrCat['idCat3'], 'categoria' => $arrCat['descripcionCategoria3'], 'imagen' => $arrCat['imagen3']), $datos['CATEGORIAS'][$k1]['CATEGORIAS2'][$k2]['CATEGORIAS3'])){
										$datos['CATEGORIAS'][$k1]['CATEGORIAS2'][$k2]['CATEGORIAS3'][] = array('idCat'=>$arrCat['idCat3'], 'categoria' => $arrCat['descripcionCategoria3'], 'imagen' => $arrCat['imagen3']);
									}
								}
							}
						}
					}
				}

			}
		}
		//echo "<pre>"; print_r($datos['CATEGORIAS']);die();


		$datos['idTienda'] = $this->session->userdata('idTienda');
		$HTML = $this->smarty->view( 'Articulos/listCategorias.tpl', $datos ,true);

		$res = array('error'=>false,'HTML'=>$HTML);

		echo json_encode($res);
	}

	public function dataCategoria(){
		$res = array('error'=>true,'HTML'=>'');
		$datos = $this->funcionesBasicas('Clientes');
		$datos['CATEGORIA'] = $this->modeloarticulos->listCategorias()[0];

		//echo "<pre>";print_r($datos['CATEGORIA']);die();
		$datos['idTienda'] = $this->session->userdata('idTienda');

		$datos['idCatPadre'] = $this->input->post('idCatPadre');

		$HTML = $this->smarty->view( 'Articulos/categoriaData.tpl', $datos ,true);

		$res = array('error'=>false,'HTML'=>$HTML);
		echo json_encode($res);
	}

	public function saveDataCategoria(){
		$res = array('error'=>true,'HTML'=>'');
		$res = $this->modeloarticulos->saveDataCategoria();
		echo json_encode($res);
	}

	public function deleteCategoria(){
		$res = array('error'=>true,'HTML'=>'');
		$res = $this->modeloarticulos->deleteCategoria();
		echo json_encode($res);
	}

}

