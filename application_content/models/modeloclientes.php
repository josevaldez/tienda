<?php
class modeloClientes extends CI_Model {

	public function __construct(){
		$this->load->database();
		$this->load->helper('url');
	}

	public function listClientes(){
		$res = array();
		$this->db->select('c.*,d.idDireccion,d.calle,d.calleInt,d.calleExt,d.colonia,d.referencia,d.cp,d.pais,d.estado,d.municipio,d.localidad');
		$this->db->from('yoco_clientes as c');
		$this->db->join('yoco_clientes_direccion as d','d.idCliente = c.idCliente','LEFT');
		$this->db->where('c.estatus', '1');
		if($this->input->post('idCliente') && $this->input->post('idCliente') != ''){
			$this->db->where('c.idCliente', $this->input->post('idCliente'));
			$this->db->limit(1);
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
		if($this->input->post('codigoCliente') != '' && $this->input->post('nombre') != '' && $this->input->post('apellido') != '' && $this->input->post('email') != ''){
			$dataCliente = array(
				//'idCliente'=> '',
				'codigoCliente'=> $this->input->post('codigoCliente'),
				'nombresCliente'=> $this->input->post('nombre'),
				'apellidosCliente'=> $this->input->post('apellido'),
				'emailCliente'=> $this->input->post('email'),
				'telefonoCliente'=> $this->input->post('telefono'),
				'fechaNacimientoCliente'=> $this->input->post('fechaNac'),
				'edadCliente'=> $this->input->post('anos'),
				'rfcCliente'=> $this->input->post('rfc'),
				'idCatConocio'=> $this->input->post('conocioid'),
				'estatusFacturacion'=> (($this->input->post('estatusFacturacion') && $this->input->post('estatusFacturacion') != '') ? '1' : 0),
				'idUsuario'=> '',
				'fechaCaptura'=> '',
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
				if($this->input->post('idDireccion') != ''){
					$this->db->where('idDireccion', $this->input->post('idDireccion'));
					$this->db->update('yoco_clientes_direccion', $dataDireccion);
				}
				else{
					$dataDireccion['idCliente'] = $this->input->post('idCliente');
					$this->db->insert('yoco_clientes_direccion', $dataDireccion);
				}
			}
			else{
				$this->db->insert('yoco_clientes', $dataCliente);

				$dataDireccion['idCliente'] = $this->db->insert_id();
				$this->db->insert('yoco_clientes_direccion', $dataDireccion);
			}

			return array('error'=>false,'HTML'=>'Exito');

		}
	}

}