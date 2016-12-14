<?php
class My_Controller extends CI_Controller
{

    public function __construct() {

        parent::__construct();
        $this->load->model('modeloadmin');
        $this->smarty->assign("lang", "spanish");
		$this->smarty->assign("raiz", INDEX_YOCO);

		$this->load->library('form_validation');
		$this->load->library('session');
		$this->load->helper('captcha');
		$this->load->helper('url');
		$this->load->helper('string');
		$this->form_validation->set_error_delimiters('<p class="error">', '</p>');

    }

    public function funcionesBasicas($tituloSeccion = 'Inicio'){
		$this->modeloadmin->validarUsuario();
		$datos = array();
		$datos['SECCIONACTUAL'] = $tituloSeccion;
		$datos['MIGAS'] = '';
		if( (! empty($tituloSeccion))&&($tituloSeccion != 'Inicio') ){
			$datos['MIGAS'] = '<div class="well well-sm"><a href="'.INDEX_YOCO.'"> Inicio </a> » '.$tituloSeccion.'</div>';
		}
		$resOpciones = $this->modeloadmin->obtenerUsuarioOpciones();
		$datos['SISTEMAS'] = $resOpciones['OPCIONES'];
		$datos['TIPOUSUARIO'] = $this->session->userdata('perfilUsuario');

		//INFO DEL USUARIO
		$ultimaActividad = $this->session->userdata('ultimoAcceso');
		$datos['NOMBREUSUARIO'] = $this->session->userdata('nombreUsuario');

		$datos['ULTIMACONEXION'] = "<img src='".INDEX_YOCO."resources/images/ico_reloj.png' class='icon16' alt='Hora ingreso' /> No existe registro de su última actividad";
		if(!empty($ultimaActividad)){
			if(substr($ultimaActividad, 8, 2) != '00'){
				$datos['ULTIMACONEXION'] = " Último inicio de sesión <img src='".INDEX_YOCO."resources/images/ico_reloj.png' class='icon16' alt='Hora ingreso' /><br>".substr($ultimaActividad, 8, 2)." de ".$this->modeloadmin->mes(date("F", strtotime($ultimaActividad)))." del ".substr($ultimaActividad, 0, 4)." a las ".substr($ultimaActividad, 11, 5)." ".$this->modeloadmin->ampm(substr($ultimaActividad, 11, 2));
			}
		}
		$res = $this->modeloadmin->generaToken();
		$datos['INDEX_YOCO'] = INDEX_YOCO;
 		$datos['token_name'] = $res['token_name'];
 		$datos['token'] = $res['token'];

		return $datos;
	}
}
?>