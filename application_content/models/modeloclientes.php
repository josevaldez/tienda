<?php
class modeloClientes extends CI_Model {

	public function __construct(){
		$this->load->database();
		$this->load->helper('url');
	}

	public function listClientes(){
		$res = array();

		$idTienda = $this->session->userdata('idTienda');

		$this->db->select('c.*,d.idDireccion,d.calle,d.calleInt,d.calleExt,d.colonia,d.referencia,d.cp,d.pais,d.estado,d.municipio,d.localidad, DATE_FORMAT(c.fechaNacimientoCliente,"%d%/%m%/%Y" ) AS fechaNacimientoCliente, cp.nombre AS nombrePais, ce.nombre AS nombreEstado, cc.nombre AS nombreMunicipio, d2.idDireccion AS idDireccion2, d2.calle AS calle2, d2.calleInt AS calleInt2, d2.calleExt AS calleExt2, d2.colonia AS colonia2, d2.referencia AS referencia2, d2.cp AS cp2, d2.pais AS pais2, d2.estado AS estado2, d2.municipio AS municipio2, d2.localidad AS localidad2,cp2.nombre AS nombrePais2, ce2.nombre AS nombreEstado2, cc2.nombre AS nombreMunicipio2',FALSE);
		$this->db->from('yoco_clientes as c');
		$this->db->join('yoco_rel_clientes_direccion as d','d.idCliente = c.idCliente AND d.estatusFacturacion = 0','LEFT');

		$this->db->join('yoco_cat_paises as cp','cp.id = d.pais','LEFT');
		$this->db->join('yoco_cat_paises_estados as ce','ce.id = d.estado','LEFT');
		$this->db->join('yoco_cat_paises_estados_ciudad as cc','cc.id = d.municipio','LEFT');

		$this->db->join('yoco_rel_clientes_direccion as d2','d2.idCliente = c.idCliente AND d2.estatusFacturacion = 1','LEFT');

		$this->db->join('yoco_cat_paises as cp2','cp2.id = d2.pais','LEFT');
		$this->db->join('yoco_cat_paises_estados as ce2','ce2.id = d2.estado','LEFT');
		$this->db->join('yoco_cat_paises_estados_ciudad as cc2','cc2.id = d2.municipio','LEFT');

		$this->db->where('c.estatus', '1');
		$this->db->where('c.idTienda', $idTienda);
		$this->db->group_by('c.idCliente');
		if($this->input->post('idCliente') && $this->input->post('idCliente') != ''){
			$this->db->where('c.idCliente', $this->input->post('idCliente'));
			$this->db->limit(1);
		}

		if($this->input->post('inputSearch') && $this->input->post('inputSearch') != ''){

			$this->db->where('( CONCAT(c.nombresCliente, c.apellidosCliente) LIKE "%'.$this->input->post('inputSearch').'%" OR CONCAT(c.apellidosCliente, c.nombresCliente) LIKE "%'.$this->input->post('inputSearch').'%" OR c.codigoCliente LIKE "%'.$this->input->post('inputSearch').'%" OR c.emailCliente LIKE "%'.$this->input->post('inputSearch').'%" OR c.rfcCliente LIKE "%'.$this->input->post('inputSearch').'%" ) ');
		}

		$query = $this->db->get();
		$tmp = $query->num_rows();
		if ($tmp > 0){
			$res = $query->result_array();
		}
		else{
			if($this->input->post('idCliente') && $this->input->post('idCliente') != ''){
				$res = array(array('idCliente'=> '','codigoCliente'=> '','nombresCliente'=> '','apellidosCliente'=> '','emailCliente'=> '','telefonoCliente'=> '','fechaNacimientoCliente'=> '','edadCliente'=> '','rfcCliente'=> '','idCatConocio'=> '','fotoCliente'=> '','estatus'=> '','estatusFacturacion'=> '','idUsuario'=> '','fechaCaptura'=> '','ultimaModificacion'=> '','idDireccion'=> '','calle'=> '','calleInt'=> '','calleExt'=> '','colonia'=> '','referencia'=> '','cp'=> '','pais'=> '','estado'=> '','municipio'=> '','localidad'=> '','idDireccion2'=> '','calle2'=> '','calleInt2'=> '','calleExt2'=> '','colonia2'=> '','referencia2'=> '','cp2'=> '','pais2'=> '','estado2'=> '','municipio2'=> '','localidad2'=> ''));
			}
		}
		if($this->input->post('idCliente') && $this->input->post('idCliente') == '-1'){
			$res = array(array('idCliente'=> '','codigoCliente'=> '','nombresCliente'=> '','apellidosCliente'=> '','emailCliente'=> '','telefonoCliente'=> '','fechaNacimientoCliente'=> '','edadCliente'=> '','rfcCliente'=> '','idCatConocio'=> '','fotoCliente'=> '','estatus'=> '','estatusFacturacion'=> '','idUsuario'=> '','fechaCaptura'=> '','ultimaModificacion'=> '','idDireccion'=> '','calle'=> '','calleInt'=> '','calleExt'=> '','colonia'=> '','referencia'=> '','cp'=> '','pais'=> '','estado'=> '','municipio'=> '','localidad'=> '','idDireccion2'=> '','calle2'=> '','calleInt2'=> '','calleExt2'=> '','colonia2'=> '','referencia2'=> '','cp2'=> '','pais2'=> '','estado2'=> '','municipio2'=> '','localidad2'=> ''));
		}
	    return $res;
	}

	public function saveDataCliente(){
		$idTienda = $this->session->userdata('idTienda');
		$idUsuario = $this->session->userdata('idUsuario');
		$this->db->trans_start();
		if($this->input->post('codigoCliente') != '' && $this->input->post('nombre') != '' && $this->input->post('apellido') != '' && $this->input->post('email') != ''){
			$fechaNac = "0000-00-00";
			if($this->input->post('fechaNac') && $this->input->post('fechaNac') != ''){
				$f = explode('/',$this->input->post('fechaNac'));
				$fechaNac = $f[2]."-".$f[1]."-".$f[0];
			}
			//CHECAR QUE EL CODIGO DE CLIENTE NO EXISTA
			if($this->input->post('idCliente') != ''){
				$codigoClienteActual = $this->db->query("SELECT codigoCliente FROM yoco_clientes WHERE idTienda = ".$idTienda." AND idCliente = ".$this->input->post('idCliente')." LIMIT 1")->row()->codigoCliente;
				if($codigoClienteActual != $this->input->post('codigoCliente')){
					$data = $this->db->query("SELECT * FROM `yoco_clientes` WHERE codigoCliente = '".$this->input->post('codigoCliente')."' AND idTienda = ".$idTienda."");
					if($data->num_rows() > 0){
						return array('error'=>true,'HTML'=>'El código que intenta agregar ya Existe');
					}
				}
			}
			else{
				$data = $this->db->query("SELECT * FROM `yoco_clientes` WHERE codigoCliente = '".$this->input->post('codigoCliente')."' AND idTienda = ".$idTienda."");
				if($data->num_rows() > 0){
					return array('error'=>true,'HTML'=>'El código que intenta agregar ya Existe');
				}
			}
			//echo $fechaNac;
			$dataCliente = array(
				'idTienda'=> $idTienda,
				'codigoCliente'=> $this->input->post('codigoCliente'),
				'nombresCliente'=> $this->input->post('nombre'),
				'apellidosCliente'=> $this->input->post('apellido'),
				'emailCliente'=> $this->input->post('email'),
				'telefonoCliente'=> $this->input->post('telefono'),
				'fechaNacimientoCliente'=> $fechaNac,
				'edadCliente'=> $this->input->post('anos'),
				'rfcCliente'=> $this->input->post('rfc'),
				'idCatConocio'=> ($this->input->post('conocioid') ? $this->input->post('conocioid') : NULL),
				'estatusFacturacion'=> $this->input->post('estatusFacturacion'),
				'idUsuario'=> $idUsuario,
				'fechaCaptura'=> date('Y-m-d H:i:s'),
				);
			$dataDireccion = array(
				//'idDireccion'=> $this->input->post('idDireccion'),
				'calle'=> $this->input->post('calle'),
				'calleInt'=> $this->input->post('int'),
				'calleExt'=> $this->input->post('ext'),
				'colonia'=> $this->input->post('colonia'),
				'referencia'=> $this->input->post('referencia'),
				'cp'=> $this->input->post('codigopostal'),
				'pais'=> $this->input->post('pais'),
				'estado'=> $this->input->post('estado'),
				'municipio'=> $this->input->post('municipio'),
				'localidad'=> $this->input->post('localidad'),
				'estatusFacturacion'=> 0,
			);
			if($this->input->post('estatusFacturacion') == 0){
				$dataDireccion2 = array(
					'calle'=> $this->input->post('calle2'),
					'calleInt'=> $this->input->post('int2'),
					'calleExt'=> $this->input->post('ext2'),
					'colonia'=> $this->input->post('colonia2'),
					'referencia'=> $this->input->post('referencia2'),
					'cp'=> $this->input->post('codigopostal2'),
					'pais'=> $this->input->post('pais2'),
					'estado'=> $this->input->post('estado2'),
					'municipio'=> $this->input->post('municipio2'),
					'localidad'=> $this->input->post('localidad2'),
					'estatusFacturacion'=> 1,
				);
			}
			else{
				$dataDireccion2 = array(
					'calle'=>'',
					'calleInt'=>'',
					'calleExt'=>'',
					'colonia'=>'',
					'referencia'=>'',
					'cp'=>'',
					'pais'=>'',
					'estado'=>'',
					'municipio'=>'',
					'localidad'=>'',
					'estatusFacturacion'=> 0,
				);
			}
			if($this->input->post('estatusFacturacion') == 1 && ($this->input->post('idDireccion2') != '' && $this->input->post('idDireccion2') != '0')){
				$this->db->where('idDireccion', $this->input->post('idDireccion2'));
				$this->db->where('estatusFacturacion', 1);
				$this->db->delete('yoco_rel_clientes_direccion');
			}
			if($this->input->post('idCliente') != ''){
				$this->db->where('idCliente', $this->input->post('idCliente'));
				$this->db->update('yoco_clientes', $dataCliente);
				if(isset($_FILES) && count($_FILES) > 0)
				$fotoCliente = $this->guardarFotoCliente($idTienda, $this->input->post('idCliente'), $_FILES);

				if($this->input->post('idDireccion') != ''){
					$this->db->where('idDireccion', $this->input->post('idDireccion'));
					$this->db->update('yoco_rel_clientes_direccion', $dataDireccion);
				}
				else{
					$dataDireccion['idCliente'] = $this->input->post('idCliente');
					$this->db->insert('yoco_rel_clientes_direccion', $dataDireccion);
				}

				if($this->input->post('idDireccion2') != ''){
					$this->db->where('idDireccion', $this->input->post('idDireccion2'));
					$this->db->where('estatusFacturacion', 1);
					$this->db->update('yoco_rel_clientes_direccion', $dataDireccion2);
				}
				else{
					if($this->input->post('estatusFacturacion') == 0){
						$dataDireccion2['idCliente'] = $this->input->post('idCliente');
						$this->db->insert('yoco_rel_clientes_direccion', $dataDireccion2);
					}
				}
			}
			else{
				$this->db->insert('yoco_clientes', $dataCliente);
				$dataDireccion['idCliente'] = $this->db->insert_id();
				if(isset($_FILES) && count($_FILES) > 0)
				$fotoCliente = $this->guardarFotoCliente($idTienda, $dataDireccion['idCliente'], $_FILES);

				$this->db->insert('yoco_rel_clientes_direccion', $dataDireccion);

				if($this->input->post('estatusFacturacion') == 0){
					$dataDireccion2['idCliente'] = $dataDireccion['idCliente'];
					$this->db->insert('yoco_rel_clientes_direccion', $dataDireccion2);
				}

			}
			$this->db->trans_complete();

			return array('error'=>false,'HTML'=>'Exito');

		}
	}

	public function guardarFotoCliente($idTienda = 0, $idCliente = 0){
		//print_r($_FILES);
		$config['upload_path']          = 'resources/fotosClientes/'.$idTienda;
		$config['allowed_types']        = 'jpg|png';
		$config['max_size']             = 1024;
		$config['encrypt_name']         = true;
		//$config['max_width']            = 1024;
		//$config['max_height']           = 768;

	    if(!is_dir($config['upload_path'])){
	      mkdir($config['upload_path'],0755,TRUE);
	    }

		$this->load->library('upload', $config);

		if ( ! $this->upload->do_upload('foto')){
			return "ERROR";
			//$error = array('error' => $this->upload->display_errors());
			//$this->load->view('upload_form', $error);
		}
		else{
			$foto = $this->upload->data();
			$dataCliente = array('fotoCliente'=> $foto['file_name']);

			$this->db->where('idCliente', $idCliente);
			$this->db->update('yoco_clientes', $dataCliente);

			return 'SUCCESS';
			//$data = array('upload_data' => $this->upload->data());
			//$this->load->view('upload_success', $data);
		}

	}

	public function deleteCliente(){
		$dataCliente = array(
			'estatus'=> 0
		);
		$idCliente = $this->input->post('idCliente');
		$idCliente = explode(',', $idCliente);
		foreach ($idCliente as $key => $id) {
			if($id != 0){
				$this->db->where('idCliente', $id);
				$this->db->update('yoco_clientes', $dataCliente);
			}
		}
		return array('error'=>false,'HTML'=>'Exito');


	}
};