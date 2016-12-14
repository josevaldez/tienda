<?php
class admin extends MY_Controller {

	public function __construct(){
		parent::__construct();
	}

	public function index(){
		$resVerificar = $this->modeloadmin->verificarAcceso();
		if ($resVerificar['STATUS']){
			//$this->salir();
			/*echo "<pre>";
			$session_status = $this->session->all_userdata();
			print_r($session_status);
			die();//*/
			header("Location: ".INDEX_YOCO."inicio");
		}else{
			$data = $resVerificar['RES'];
			if ( $this->input->post('action') != 'INICIAR SESIÓN' ){
				$data['captcha'] = self::generateCaptcha();

			}
			if ( $this->input->post('action') == 'INICIAR SESIÓN' ){
				$this->form_validation->set_rules('username', 'usuario', 'trim|required|min_length[4]|max_length[20]|xss_clean');
				$this->form_validation->set_rules('password', 'contraseña', 'trim|required|max_length[12]|xss_clean');
				//$this->form_validation->set_rules('captcha', 'CAPTCHA', 'trim|required|min_length[5]|max_length[5]|xss_clean');
				if ( ! $this->form_validation->run() ){
				  	$data['error'] = 'Alguno de los datos es incorrecto, por favor ingrese de nuevo sus credenciales';
				  	$data['captcha'] = self::generateCaptcha();
				  	$data['dataBack'] = $this->modeloadmin->getBackground();
				  	$this->smarty->view( 'index.tpl', $data );
				}
				else{
					//VERIFY THE CAPTCHA WORD
					$this->verificarUsuario();
					/*
					$captcha = md5(CAPTCHA_HASH . strtoupper($this->input->post('captcha')) );
					if ($captcha == $this->session->userdata('c_wd')){$this->verificarUsuario();}
				  	else{
				  		$data['advice'] = '<p class="warning error alert alert-danger">El texto de la imagen no es correcto</p>';
				  		$data['captcha'] = self::generateCaptcha();
				  		$this->smarty->view( 'index.tpl', $data );
				  	}*/
				}
			}
			else{
				$data['message'] = '';
				$data['advice'] = '';
				$data['dataBack'] = $this->modeloadmin->getBackground();
				//print_r($data);
				$this->smarty->view( 'index.tpl', $data );
			}
		}
	}

	public function salir(){$this->session->sess_destroy();header("Location: ".INDEX_YOCO);}

	private function generateCaptcha(){$captchaRes = $this->modeloadmin->captcha();return $captchaRes;}

	public function verificarUsuario()
	{
		$data['advice'] = "";
		$valid_user = $this->modeloadmin->verifyUser($this->input->post('username'),$this->input->post('password'));
		$sistemas = array();
		if ($valid_user['STATUS'])
		{
		 	$status = array(
		 		'status' => 'logged',
		 		'nombreUsuario' =>  $valid_user['DATOS'][0]['nombreUsuario'],
		 		'perfilUsuario' =>  $valid_user['DATOS'][0]['id_tipousuario'],
		 		'ultimoAcceso' =>  $valid_user['DATOS'][0]['ultimoAcceso'],
		 		'tipoUsuario' =>  $valid_user['DATOS'][0]['describe_usuario'],
		 		'idUsuario' 	=>  $valid_user['DATOS'][0]['idUsuario']
		 		);
		 	$this->session->set_userdata($status);
			header("Location: ".INDEX_YOCO."inicio");
		}
		else
		{
			$data['advice'] = '<p class=" warning alert alert-danger">El nombre de usuario y/o Contraseña no son correctos</p>';
			if($valid_user['MSG'] != ''){ $data['advice'] =  '<p class=" warning alert alert-danger">'.  $valid_user['MSG'] .'</p>'; }
			$data['valid_user'] = "";
			$data['contacto'] = "";

			$data['message'] = '';
			$data['error'] = '';
			//TOKENS CORRESPONDING TO csrf SECURITY
			$res = $this->modeloadmin->generaToken();
	 		$data['token_name'] = $res['token_name'];
	 		$data['token'] = $res['token'];
			//GENERATE CAPTCHA
			$data['captcha'] = self::generateCaptcha();
			$data['dataBack'] = $this->modeloadmin->getBackground();
  		  	$this->smarty->view( 'index.tpl', $data );
		}
	}

	public function portada(){
		$datos = $this->funcionesBasicas();
		$perfilUsuario = $this->session->userdata('perfilUsuario');
		$datos['textoBienvenida'] = $this->modeloadmin->obtenerPerfilBienvenida($perfilUsuario);
		$datos['INDEX_YOCO'] = INDEX_YOCO;
		//echo "<pre>";print_r($datos);
		$this->smarty->view( 'home.tpl', $datos );
	}


}

