<?php
class modeloClientes extends CI_Model {

	public function __construct(){
		$this->load->database();
		$this->load->helper('url');
	}

	public function listClientes(){
		$res = array();

		$idTienda = $this->session->userdata('idTienda');

		$this->db->select('c.*,d.idDireccion,d.calle,d.calleInt,d.calleExt,d.colonia,d.referencia,d.cp,d.pais,d.estado,d.municipio,d.localidad, DATE_FORMAT(c.fechaNacimientoCliente,"%d%/%m%/%Y" ) AS fechaNacimientoCliente',FALSE);
		$this->db->from('yoco_clientes as c');
		$this->db->join('yoco_rel_clientes_direccion as d','d.idCliente = c.idCliente','LEFT');
		$this->db->where('c.estatus', '1');
		$this->db->where('c.idTienda', $idTienda);
		if($this->input->post('idCliente') && $this->input->post('idCliente') != ''){
			$this->db->where('c.idCliente', $this->input->post('idCliente'));
			$this->db->limit(1);
		}

		if($this->input->post('inputSearch') && $this->input->post('inputSearch') != ''){

			$this->db->where('( CONCAT(c.nombresCliente, c.apellidosCliente) LIKE "%'.$this->input->post('inputSearch').'%" OR CONCAT(c.apellidosCliente, c.nombresCliente) LIKE "%'.$this->input->post('inputSearch').'%" OR c.codigoCliente LIKE "%'.$this->input->post('inputSearch').'%" OR c.emailCliente LIKE "%'.$this->input->post('inputSearch').'%" OR c.rfcCliente LIKE "%'.$this->input->post('inputSearch').'%" ) ');

			/*$this->db->or_like('( CONCAT(c.nombresCliente, c.apellidosCliente)' ,$this->input->post('inputSearch', 'both',FALSE));
			$this->db->or_like('CONCAT(c.apellidosCliente, c.nombresCliente)' ,$this->input->post('inputSearch'), 'both',FALSE);
			$this->db->or_like('c.codigoCliente' ,$this->input->post('inputSearch'), 'both',FALSE);
			$this->db->or_like('c.emailCliente' ,$this->input->post('inputSearch'), 'both',FALSE);
			$this->db->or_like('c.rfcCliente' ,$this->input->post('inputSearch').')', 'both',FALSE);

			/*$this->db->or_like(array(
				' CONCAT(c.nombresCliente, c.apellidosCliente)' =>$this->input->post('inputSearch'),
				'CONCAT(c.apellidosCliente, c.nombresCliente)' =>$this->input->post('inputSearch'),
				'c.codigoCliente' =>$this->input->post('inputSearch'),
				'c.emailCliente' =>$this->input->post('inputSearch'),
				'c.rfcCliente' =>$this->input->post('inputSearch')
			), 'both',FALSE);*/
		}

		$query = $this->db->get();
		$tmp = $query->num_rows();
		if ($tmp > 0){
			$res = $query->result_array();
		}
		else{
			if($this->input->post('idCliente') && $this->input->post('idCliente') != ''){
				$res = array(array('idCliente'=> '','codigoCliente'=> '','nombresCliente'=> '','apellidosCliente'=> '','emailCliente'=> '','telefonoCliente'=> '','fechaNacimientoCliente'=> '','edadCliente'=> '','rfcCliente'=> '','idCatConocio'=> '','fotoCliente'=> '','estatus'=> '','estatusFacturacion'=> '','idUsuario'=> '','fechaCaptura'=> '','ultimaModificacion'=> '','idDireccion'=> '','calle'=> '','calleInt'=> '','calleExt'=> '','colonia'=> '','referencia'=> '','cp'=> '','pais'=> '','estado'=> '','municipio'=> '','localidad'=> ''));
			}
		}
		if($this->input->post('idCliente') && $this->input->post('idCliente') == '-1'){
			$res = array(array('idCliente'=> '','codigoCliente'=> '','nombresCliente'=> '','apellidosCliente'=> '','emailCliente'=> '','telefonoCliente'=> '','fechaNacimientoCliente'=> '','edadCliente'=> '','rfcCliente'=> '','idCatConocio'=> '','fotoCliente'=> '','estatus'=> '','estatusFacturacion'=> '','idUsuario'=> '','fechaCaptura'=> '','ultimaModificacion'=> '','idDireccion'=> '','calle'=> '','calleInt'=> '','calleExt'=> '','colonia'=> '','referencia'=> '','cp'=> '','pais'=> '','estado'=> '','municipio'=> '','localidad'=> ''));
		}
	    return $res;
	}

	public function catalogo($cat = ''){
		$res = array();
		switch ($cat) {
			case 'conocio':
				$this->db->select('c.*');
				$this->db->from('yoco_cat_conocio as c');
				$this->db->where('c.estatus', '1');
				break;
		}
		$query = $this->db->get();
		$tmp = $query->num_rows();
		if ($tmp > 0){$res = $query->result_array();}
		return $res;
	}

	public function saveDataCliente(){
		$idTienda = $this->session->userdata('idTienda');
		$idUsuario = $this->session->userdata('idUsuario');
		if($this->input->post('codigoCliente') != '' && $this->input->post('nombre') != '' && $this->input->post('apellido') != '' && $this->input->post('email') != ''){
			$fechaNac = "0000-00-00";
			if($this->input->post('fechaNac') && $this->input->post('fechaNac') != ''){
				$f = explode('/',$this->input->post('fechaNac'));
				$fechaNac = $f[2]."-".$f[1]."-".$f[0];
			}
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
				'idCatConocio'=> $this->input->post('conocioid'),
				'estatusFacturacion'=> (($this->input->post('estatusFacturacion') && $this->input->post('estatusFacturacion') != '') ? '1' : 0),
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
				'localidad'=> $this->input->post('localida'),
			);
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
			}
			else{
				$this->db->insert('yoco_clientes', $dataCliente);

				$dataDireccion['idCliente'] = $this->db->insert_id();
				if(isset($_FILES) && count($_FILES) > 0)
				$fotoCliente = $this->guardarFotoCliente($idTienda, $dataDireccion['idCliente'], $_FILES);

				$this->db->insert('yoco_rel_clientes_direccion', $dataDireccion);
			}

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