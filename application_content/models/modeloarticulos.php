<?php
class modeloArticulos extends CI_Model {

	public function __construct(){
		$this->load->database();
		$this->load->helper('url');
	}

	public function listArticulos(){
		$res = array();

		$idTienda = $this->session->userdata('idTienda');
		$idUsuario = $this->session->userdata('idUsuario');

		$this->db->select('a.*,ri.imagen,
								(SELECT
									GROUP_CONCAT(CONCAT(c1.idCategoria,"-",c2.idCategoria,"-",c3.idCategoria) SEPARATOR ",") AS Categorias
									FROM
									yoco_categorias AS c1
									LEFT JOIN yoco_categorias AS c2 ON c1.idCategoria = c2.idParentCategoria AND c2.estatus = 1
									LEFT JOIN yoco_categorias AS c3 ON c2.idCategoria = c3.idParentCategoria AND c3.estatus = 1
									WHERE c1.idParentCategoria = 0 AND c1.estatus = 1 AND c1.idCategoria IN (SELECT idCategoria FROM yoco_rel_articulo_categoria WHERE idArticulo = a.idArticulo)
									AND c2.idCategoria IN (SELECT idCategoria FROM yoco_rel_articulo_categoria WHERE idArticulo = a.idArticulo)
									AND c3.idCategoria IN (SELECT idCategoria FROM yoco_rel_articulo_categoria WHERE idArticulo = a.idArticulo)
									ORDER BY c1.descripcionCategoria,c2.descripcionCategoria,c3.descripcionCategoria) AS idsCategoria,
									(SELECT
									GROUP_CONCAT(CONCAT(c1.descripcionCategoria,"-",c2.descripcionCategoria,"-",c3.descripcionCategoria) SEPARATOR ",") AS Categorias
									FROM
									yoco_categorias AS c1
									LEFT JOIN yoco_categorias AS c2 ON c1.idCategoria = c2.idParentCategoria AND c2.estatus = 1
									LEFT JOIN yoco_categorias AS c3 ON c2.idCategoria = c3.idParentCategoria AND c3.estatus = 1
									WHERE c1.idParentCategoria = 0 AND c1.estatus = 1 AND c1.idCategoria IN (SELECT idCategoria FROM yoco_rel_articulo_categoria WHERE idArticulo = a.idArticulo)
									AND c2.idCategoria IN (SELECT idCategoria FROM yoco_rel_articulo_categoria WHERE idArticulo = a.idArticulo)
									AND c3.idCategoria IN (SELECT idCategoria FROM yoco_rel_articulo_categoria WHERE idArticulo = a.idArticulo)
									ORDER BY
									c1.descripcionCategoria,c2.descripcionCategoria,c3.descripcionCategoria)
									AS nombresCategorias,
									(SELECT
									GROUP_CONCAT(s.nombre) AS nombresSucursal
									FROM
									yoco_sucursales AS s
									INNER JOIN yoco_rel_articulo_sucursal AS ras ON ras.idSucursal = s.idSucursal
									INNER JOIN yoco_rel_usuarios_sucursal AS rus ON s.idSucursal = rus.idSucursal
									WHERE ras.idArticulo = a.idArticulo AND rus.idUsuario = '.$idUsuario.' AND ras.estatus = 1
									)
									AS nombresSucursal,
									(SELECT
									GROUP_CONCAT(s.idSucursal) AS idsSucursal
									FROM
									yoco_sucursales AS s
									INNER JOIN yoco_rel_articulo_sucursal AS ras ON ras.idSucursal = s.idSucursal
									INNER JOIN yoco_rel_usuarios_sucursal AS rus ON s.idSucursal = rus.idSucursal
									WHERE ras.idArticulo = a.idArticulo AND rus.idUsuario = '.$idUsuario.' AND ras.estatus = 1
									)
									AS idsSucursal
',FALSE);
		$this->db->from('yoco_articulos as a');
		$this->db->join('(SELECT * FROM (SELECT * FROM yoco_rel_articulo_imagenes ORDER BY portada DESC) AS yoco_rel_articulo_imagenes GROUP BY idArticulo ORDER BY portada DESC) AS ri','ri.idArticulo = a.idArticulo','LEFT','FALSE');
		$this->db->where('a.estatus', '1');
		$this->db->where('a.idTienda', $idTienda);
		if($this->input->post('idArticulo') && $this->input->post('idArticulo') != ''){
			$this->db->where('a.idArticulo', $this->input->post('idArticulo'));
			$this->db->limit(1);
		}

		if($this->input->post('inputSearch') && $this->input->post('inputSearch') != ''){

			$this->db->where('( a.codigoArticulo LIKE "%'.$this->input->post('inputSearch').'%" OR a.nombreArticulo LIKE "%'.$this->input->post('inputSearch').'%" OR a.nombreCortoArticulo LIKE "%'.$this->input->post('inputSearch').'%" OR a.tituloArticulo LIKE "%'.$this->input->post('inputSearch').'%" OR a.descripcionArticulo LIKE "%'.$this->input->post('inputSearch').'%" ) ');
		}

		$query = $this->db->get();
		$tmp = $query->num_rows();
		if ($tmp > 0){
			$res = $query->result_array();
		}
		else{
			if($this->input->post('idArticulo') && $this->input->post('idArticulo') != ''){
				$res = array(array('idArticulo'=> '','codigoArticulo'=> '','nombreArticulo'=> '','nombreCortoArticulo'=> '','tituloArticulo'=> '','palabrasClaveArticulo'=> '','descripcionArticulo'=> '','precioCompra'=> '','precioMayoreo'=> '','iva'=> '','precioVenta'=> '','descuento'=> '','tipoArticulo'=> '1','estatus'=> '','idsCategoria'=> '','nombresCategorias'=> '','nombresSucursal'=> '','idsSucursal'=> '', 'imagen' => ''));
			}
		}
		if($this->input->post('idArticulo') && $this->input->post('idArticulo') == '-1'){
			$res = array(array('idArticulo'=> '','codigoArticulo'=> '','nombreArticulo'=> '','nombreCortoArticulo'=> '','tituloArticulo'=> '','palabrasClaveArticulo'=> '','descripcionArticulo'=> '','precioCompra'=> '','precioMayoreo'=> '','iva'=> '','precioVenta'=> '','descuento'=> '','tipoArticulo'=> '1','estatus'=> '','idsCategoria'=> '','nombresCategorias'=> '','nombresSucursal'=> '','idsSucursal'=> '', 'imagen' => ''));
		}
	    return $res;
	}

	public function saveDataArticulo(){
		$idTienda = $this->session->userdata('idTienda');
		$idUsuario = $this->session->userdata('idUsuario');
		if($this->input->post('codigo') != '' && $this->input->post('nombre') != '' && $this->input->post('abreviatura') != '' && $this->input->post('descripcion') != ''){

			$this->db->trans_start();
			$dataCliente = array(
				'idTienda'=> $idTienda,
				'codigoArticulo'=> $this->input->post('codigo'),
				'nombreArticulo'=> $this->input->post('nombre'),
				'nombreCortoArticulo'=> $this->input->post('abreviatura'),
				'tituloArticulo'=> $this->input->post('titulo'),
				'palabrasClaveArticulo'=> $this->input->post('palabras'),
				'descripcionArticulo'=> $this->input->post('descripcion'),
				/*'precioCompra'=> $this->input->post('anos'),
				'precioMayoreo'=> $this->input->post('rfc'),
				'iva'=> $this->input->post('conocioid'),
				'precioVenta'=> $this->input->post('conocioid'),
				'descuento'=> $this->input->post('conocioid'),*/
				'tipoArticulo'=> $this->input->post('tipoArticulo'),
				//'idUsuario'=> $idUsuario,
				'fechaRegistro'=> date('Y-m-d H:i:s'),
				);
			$idArticulo = 0;
			if($this->input->post('idArticulo') != ''){
				$this->db->where('idArticulo', $this->input->post('idArticulo'));
				$this->db->update('yoco_articulos', $dataCliente);
				$idArticulo = $this->input->post('idArticulo');

				//if(isset($_FILES) && count($_FILES) > 0)
				//$fotoCliente = $this->guardarFotoArticulo($idTienda, $this->input->post('idArticulo'), $_FILES)
			}
			else{
				$this->db->insert('yoco_articulos', $dataCliente);

				$idArticulo = $dataDireccion['idArticulo'] = $this->db->insert_id();

				//if(isset($_FILES) && count($_FILES) > 0)
				//$fotoCliente = $this->guardarFotoArticulo($idTienda, $dataDireccion['idArticulo'], $_FILES);
			}

			$dataSucursal = array('estatus' => 0);
			$this->db->where('idArticulo', $idArticulo);
			$this->db->update('yoco_rel_articulo_sucursal', $dataSucursal);

			$sucursalesId = $this->input->post('sucursalesId');
			$sucursalesId = explode(',',$sucursalesId);
			foreach ($sucursalesId as $key => $sucursal) {
				$this->db->query("INSERT INTO yoco_rel_articulo_sucursal (idArticulo,idSucursal) VALUES (".$idArticulo.",".$sucursal.") ON DUPLICATE KEY UPDATE estatus = 1;");
			}

			$this->db->where('idArticulo', $idArticulo);
			$this->db->delete('yoco_rel_articulo_categoria');

			$categoriasId = $this->input->post('categoriasId');
			$categoriasId = explode(',',$categoriasId);
			foreach ($categoriasId as $key => $categoriaArr) {
				$categoriaArr = explode('-',$categoriaArr);
				foreach ($categoriaArr as $key2 => $categoria) {
					$this->db->query("INSERT INTO yoco_rel_articulo_categoria (idArticulo,idCategoria) VALUES (".$idArticulo.",".$categoria.") ON DUPLICATE KEY UPDATE idCategoria = ".$categoria.";");
				}
			}
			$this->db->trans_complete();

			return array('error'=>false,'HTML'=>'Exito');

		}
	}

	public function saveImagenArticulo($idTienda = 0, $idArticulo = 0){
		if($this->input->post('idArticulo') && $this->input->post('idArticulo') != '' && $this->input->post('idArticulo') != '0'){
			$idArticulo = $this->input->post('idArticulo');
			$idTienda = $this->session->userdata('idTienda');
			$config = array(
	            'upload_path'   => 'resources/imagesArticulos/'.$idTienda.'/'.$idArticulo,
	            'allowed_types' => 'jpg|png',
	            'encrypt_name'  => true,
	        );

	        if(!is_dir('resources/imagesArticulos/'.$idTienda)){
		      mkdir('resources/imagesArticulos/'.$idTienda,0755,TRUE);
		    }
		    if(!is_dir('resources/imagesArticulos/tumb/'.$idTienda)){
		      mkdir('resources/imagesArticulos/tumb/'.$idTienda,0755,TRUE);
		    }

		    if(!is_dir('resources/imagesArticulos/'.$idTienda.'/'.$idArticulo)){
		      mkdir('resources/imagesArticulos/'.$idTienda.'/'.$idArticulo,0755,TRUE);
		    }
		    if(!is_dir('resources/imagesArticulos/tumb/'.$idTienda.'/'.$idArticulo)){
		      mkdir('resources/imagesArticulos/tumb/'.$idTienda.'/'.$idArticulo,0755,TRUE);
		    }

	        $this->load->library('upload', $config);

	        $images = array();
	        //echo"<pre>";print_r($_FILES);echo"</pre>";
	        if(count($_FILES) > 0)
	        foreach ($_FILES['foto']['name'] as $key => $image) {

	            $_FILES['images[]']['name']= $_FILES['foto']['name'][$key];
	            $_FILES['images[]']['type']= $_FILES['foto']['type'][$key];
	            $_FILES['images[]']['tmp_name']= $_FILES['foto']['tmp_name'][$key];
	            $_FILES['images[]']['error']= $_FILES['foto']['error'][$key];
	            $_FILES['images[]']['size']= $_FILES['foto']['size'][$key];

	            //$images[] = $fileName;

	            $this->upload->initialize($config);

	            if ($this->upload->do_upload('images[]')) {
					$foto = $this->upload->data();
	                $dataImagen = array(
										'idArticulo'=> $idArticulo,
										'imagen'=> $foto['file_name'],
										'portada'=> 0,
										'estatus'=> 1
									);
					$this->db->insert('yoco_rel_articulo_imagenes', $dataImagen);
	            } else {
	                //return false;
	            }
	        }

			return array('error'=>false,'HTML'=>'');
		}
		else{
			return array('error'=>true,'HTML'=>'');
		}

	}

	public function deleteArticulo(){
		$dataCliente = array(
			'estatus'=> 0
		);
		$idArticulo = $this->input->post('idArticulo');
		$idArticulo = explode(',', $idArticulo);
		foreach ($idArticulo as $key => $id) {
			if($id != 0){
				$this->db->where('idArticulo', $id);
				$this->db->update('yoco_articulos', $dataCliente);
			}
		}
		return array('error'=>false,'HTML'=>'Exito');
	}

	public function listImagenesArticulo(){
		$this->db->select('a.*',FALSE);
		$this->db->from('yoco_rel_articulo_imagenes as a');
		$this->db->where('a.estatus', '1');
		if($this->input->post('idArticulo') && $this->input->post('idArticulo') != '' && $this->input->post('idArticulo') != '0'){
			$this->db->where('a.idArticulo', $this->input->post('idArticulo'));
			$this->db->order_by('portada', 'desc');
		}
		else{
			return array();die();
		}

		$query = $this->db->get();
		$tmp = $query->num_rows();
		if ($tmp > 0){
			$res = $query->result_array();
		}
		else{
			$res = array();
		}
	    return $res;
	}

	public function deleteImagenArticulo(){
		$idTienda = $this->session->userdata('idTienda');
		$idArticulo = $this->input->post('idArticulo');

		$idImagen = $this->input->post('idImagen');
		$imagen = $this->input->post('imagen');

		$this->db->where('idRelArticuloImagenes', $idImagen);
		$this->db->delete('yoco_rel_articulo_imagenes');

		if(file_exists('resources/imagesArticulos/'.$idTienda.'/'.$idArticulo.'/'.$imagen))
		unlink('resources/imagesArticulos/'.$idTienda.'/'.$idArticulo.'/'.$imagen);
		if(file_exists('resources/imagesArticulos/tumb/'.$idTienda.'/'.$idArticulo.'/'.$imagen))
		unlink('resources/imagesArticulos/tumb/'.$idTienda.'/'.$idArticulo.'/'.$imagen);

		return array('error'=>false,'HTML'=>'Exito');
	}
};