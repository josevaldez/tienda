<?php
class modeloAdmin extends CI_Model {

	const CAPTCHA_ROUTE = "resources/captcha/";
	const TBL_USUARIOS = "yoco_usuarios";
	const TBL_SECCIONES = "yoco_cat_secciones";
	const TBL_REL_PERFILSECCIONES = "yoco_rel_tiposusuarios_secciones";
	const TBL_PERFILES = "yoco_cat_tipo_usuarios";

	const SESION_ACTIVA = 120;  //MINUTES
	const NUM_INTENTOS = 5;


	public function __construct(){
		$this->load->database();
		$this->load->helper('url');
	}

	public function generaToken(){
		$res = array();
 		$res['token_name'] = $this->security->get_csrf_token_name();
 		$res['token'] = $this->security->get_csrf_hash();
		return $res;
	}

	public function verifyUser($user_name = FALSE,$user_pass = FALSE)
	{
		if (($user_name === FALSE)||($user_pass === FALSE))
		{
			return FALSE;
		}

		$res = array('STATUS' => FALSE, 'MSG'  => 'El nombre de usuario no se encuentra disponible o no existe.', 'DATOS' => '');
		$query = $this->db->get_where(self::TBL_USUARIOS, array('usuarioLogin' => $user_name,'estatus' => '1'));
		if($query->num_rows() > 0){
			$data =  $query->result_array();
			$dataRes = $data['0'];
			//return $dataRes;
			$user_pass_encoded = $dataRes['password'];
			if($this->verifyPass($user_pass, $user_pass_encoded))
			{
				$res['STATUS'] = TRUE;
				$res['MSG'] = 'Bienvenido';
				$this->actualizaAccesoUsuario($dataRes['idUsuario']);
				$res['DATOS'] = $this->obtenerDatosUsuario($dataRes['idUsuario']);
				$this->captcha_collector();
			}else{
				$res['MSG'] = 'La contraseña no es correcta';
			}
		}
		return $res;

	}

	private function captcha_collector(){
		$files = glob(self::CAPTCHA_ROUTE.'*');
		foreach($files as $file){if(is_file($file))@unlink($file);}
	}

	private function encryptSSHA_HASH($password = '', $hash = ''){
		$salt = substr(base64_decode($hash),20);
 		$passEncrypted = base64_encode(sha1( $password.$salt, TRUE ). $salt);
 		/*echo $hash."<br>";
 		echo $salt."<br>".$passEncrypted;die();*/
 		return $passEncrypted;
	}

	private function verifyPass($password = '', $hashedPass = ''){
		$passEncrypted =  $this->encryptSSHA_HASH($password, $hashedPass);
		if ($hashedPass == $passEncrypted){$res =  TRUE;}else{$res =  FALSE;}
		return $res;
	}

	public function actualizaAccesoUsuario($idUsuario = ''){
		if(empty($idUsuario)){return FALSE;}
		$fechaObj = new DateTime('NOW');
		$fechaMod = $fechaObj->format('Y-m-d H:i:s');
		$data = array('ultimoAcceso' => $fechaMod);
		$this->db->where('idUsuario', $idUsuario);
		$this->db->update(self::TBL_USUARIOS, $data);

	}

	public function verificarAcceso($idSistema = 0){
		$resVerificar = array('STATUS' => FALSE, 'RES' => '' );
		$res = $this->generaToken();
 		$data['token_name'] = $res['token_name'];
 		$data['token'] = $res['token'];
		$data['advice'] = "";
		$r1 = $r3 = $ses = FALSE;
		$r2 = TRUE;
		$session_status = $this->session->userdata('status');

		if($session_status=='logged'){
			$resVerificar['STATUS'] = TRUE;
		}
		$resVerificar['RES'] = $data;
		return $resVerificar;
	}

	public function obtenerDatosUsuario($idUsuario = ''){
		if(empty($idUsuario)){return FALSE;}

		$this->db->select('U.idUsuario,U.nombreUsuario,U.id_tipousuario,U.ultimoAcceso,TU.describe_usuario, U.idTienda');
		$this->db->from(self::TBL_USUARIOS." AS U");
		$this->db->join(self::TBL_PERFILES. " AS TU", 'U.id_tipousuario = TU.idtipo_usuarios');
 		$this->db->where('U.idUsuario', $idUsuario);
		$this->db->where('U.estatus', 1);
		$query = $this->db->get();
		$res = $query->num_rows();
		if ($res>0){
			$data =  $query->result_array();
	    	return $data;
		}else{
	    	return FALSE;
	  	}
	}

	public function captcha()
	{

		#create image and set background color
		$captcha = imagecreatetruecolor(180,60);
		$colorR = rand(0,80);
		$colorG = rand(0,80);
		$colorB = rand(0,80);
		$background_color = imagecolorallocate($captcha, $colorR, $colorG, $colorB);
		imagefill($captcha, 0, 0, $background_color);

		#draw some lines
		for($i=0;$i<10;$i++){
			$colorR = rand(48,96);
			$colorG = rand(48,96);
			$colorB = rand(48,96);
			imageline($captcha, rand(0,130),rand(0,60), rand(0,130), rand(0,60),imagecolorallocate($captcha, $colorR, $colorG, $colorB));
		}
		putenv('GDFONTPATH=' . realpath('.'));
		$font = './courbd.ttf';

		$stringText = $this->randomPassword();
		for($i=0;$i<strlen($stringText);$i++){
			$colorR = rand(100,255);
			$colorG = rand(100,255);
			$colorB = rand(100,255);
			if(file_exists($font)){
				$x=20+$i*30+rand(0,6);
				$y=15+rand(18,28);
				imagettftext  ($captcha, 24, rand(-25,25), $x, $y, imagecolorallocate($captcha, $colorR, $colorG, $colorB), $font, $stringText[$i]);
			}else{
				$x=20+$i*30+rand(0,6);
				$y=15+rand(1,18);
				imagestring($captcha, 24, $x, $y, $stringText[$i], imagecolorallocate($captcha, $colorR, $colorG, $colorB));
			}
		}

		$matrix = array(array(1, 1, 1), array(1.0, 7, 1.0), array(1, 1, 1));
		imageconvolution($captcha, $matrix, 16, 32);
		$nombre = random_string('alpha', 8);
		imagejpeg($captcha, 'resources/captcha/'.$nombre.'.jpg');

		$captchaCod = md5(CAPTCHA_HASH . $stringText);
		$captcha_data = array('c_wd' => $captchaCod);
		$this->session->set_userdata($captcha_data);
		return $nombre;

	}

	public function randomPassword($digits = 5) {
	    $alphabet = "ABCDEFGHIJKLMNOPQRSTUWXYZ123456789";
	    $pass = array();
	    $alphaLength = strlen($alphabet) - 1;
	    for ($i = 0; $i < $digits; $i++) {
	        $n = rand(0, $alphaLength);
	        $pass[] = $alphabet[$n];
	    }
	    return implode($pass);
	}

	public function validarUsuario(){
		$session_status = $this->session->userdata('status');
		if ($session_status != 'logged'){
			$this->load->helper('url');
			header("Location: ".INDEX_YOCO);
		}
	}

	public function obtenerUsuarioOpciones(){
		$perfilUsuario = $this->session->userdata('perfilUsuario');
		$res = array(); $userOpciones = array('OPCIONES' => '');
		if(empty($perfilUsuario)){return $userOpciones;}
		$this->db->select('s.*');
		$this->db->from(self::TBL_SECCIONES.' AS s');
		$this->db->join(self::TBL_REL_PERFILSECCIONES.' AS rus', 'rus.idSeccion = s.idSeccion','left');
		$this->db->where('rus.idtipo_usuarios', $perfilUsuario);
		$this->db->where('s.seccionEstatus', '1');
		$this->db->order_by('rus.ordenMenu');
		$query = $this->db->get();
		$tmp = $query->num_rows();
		if ($tmp > 0){
			//$res =  $query->result_array();
			$rTemp =  $query->result_array();
			foreach ($rTemp as $key => $value){
				if(empty($value['seccionSubMenu'])){
					//$res[$key] = $value;
					$res[$value['seccionUrl']] = $value;
				}else{
					$res[$value['seccionSubMenu']][] = $value;
				}

			}
		}
		$userOpciones['OPCIONES'] = $res;
		//echo "<pre>";print_r($res);echo "</pre>";die();
	    return $userOpciones;
	}

	public function obtenerPerfilBienvenida($perfilUsuario = ''){
		$res = '';
		if(empty($perfilUsuario)){return $res;}
		$this->db->select('a.bienvenidaUsuario');
		$this->db->from(self::TBL_PERFILES.' as a');
		$this->db->where('a.idtipo_usuarios', $perfilUsuario);
		$this->db->where('a.estatus', '1');
		$query = $this->db->get();
		$tmp = $query->num_rows();
		if ($tmp > 0){
			$res1 = $query->result_array();
			$res= $res1[0]['bienvenidaUsuario'];
		}
	    return $res;
	}

	public function getBackground(){
		$res = array();
		$this->db->select('a.*');
		$this->db->from('yoco_background as a');
		$this->db->where('a.estatus', '1');
		$this->db->order_by("RAND()");
		$this->db->limit(1);
		$query = $this->db->get();
		$tmp = $query->num_rows();
		if ($tmp > 0){
			$res = $query->result_array();
		}
	    return $res;
	}

	public function ampm($hora){
		if (intval($hora)>=12 )
			return "PM";
		else
			return "AM";
	}
	public function mes($mes){
		switch ($mes) {
			case 'January': return "Enero"; break;
			case 'February': return "Febrero"; break;
			case 'March': return "Marzo"; break;
			case 'April': return "Abril"; break;
			case 'May': return "Mayo"; break;
			case 'June': return "Junio"; break;
			case 'July': return "Julio"; break;
			case 'August': return "Agosto"; break;
			case 'September': return "Septiembre"; break;
			case 'October': return "October"; break;
			case 'November': return "Noviembre"; break;
			case 'December': return "Diciembre";break;
		}
	}

	public function catalogo($cat = '',$idBuscar = 0){
		$res = array();
		switch ($cat) {
			case 'conocio':
				$this->db->select('c.*');
				$this->db->from('yoco_cat_conocio as c');
				$this->db->where('c.estatus', '1');
				break;
			case 'paises':
				$this->db->select('c.*');
				$this->db->from('yoco_cat_paises as c');
				$this->db->order_by('c.nombre');
				break;
			case 'estados':
				$this->db->select('c.*');
				$this->db->from('yoco_cat_paises_estados as c');
				if($idBuscar != 0){
					$this->db->where('c.pais_id',$idBuscar);
				}
				$this->db->order_by('c.nombre');
				break;
			case 'municipios':
				$this->db->select('c.*');
				$this->db->from('yoco_cat_paises_estados_ciudad as c');
				if($idBuscar != 0){
					$this->db->where('c.estado_id',$idBuscar);
				}
				$this->db->order_by('c.nombre');
				break;
		}
		$query = $this->db->get();
		$tmp = $query->num_rows();
		if ($tmp > 0){$res = $query->result_array();}
		return $res;
	}

	public function autocomplete($catalogo , $termino){
		$idTienda = $this->session->userdata('idTienda');
		$idUsuario = $this->session->userdata('idUsuario');
		$data = array();
		switch ($catalogo) {
			case 'categorias':
				$this->db->select("CONCAT(c1.descripcionCategoria,' - ',c2.descripcionCategoria,' - ', c3.descripcionCategoria) AS Categorias,
					CONCAT(c1.descripcionCategoria,' - ',c2.descripcionCategoria,' - ', c3.descripcionCategoria) AS value,
					c1.idCategoria AS idCat1,
					c1.descripcionCategoria,
					c1.idParentCategoria,
					c2.idCategoria AS idCat2,
					c2.descripcionCategoria,
					c2.idParentCategoria,
					c3.idCategoria AS idCat3,
					c3.descripcionCategoria,
					c3.idParentCategoria
					",FALSE);
				$this->db->from('yoco_categorias AS c1');
				$this->db->join('yoco_categorias as c2','c1.idCategoria = c2.idParentCategoria AND c2.estatus = 1','LEFT');
				$this->db->join('yoco_categorias as c3','c2.idCategoria = c3.idParentCategoria AND c3.estatus = 1','LEFT');
				$this->db->where('c1.idParentCategoria', '0');
				$this->db->where('c1.estatus', '1');
				$this->db->where('c1.idTienda', $idTienda);
				$this->db->like("CONCAT(c1.descripcionCategoria,' - ',c2.descripcionCategoria,' - ', c3.descripcionCategoria)", $termino);
				$this->db->order_by('c1.descripcionCategoria,c2.descripcionCategoria,c3.descripcionCategoria');

				$query = $this->db->get();
				$res = $query->num_rows();
				if ($res>0){
					$data  =  $query->result();
				}
				break;
			case 'sucursales':
				$this->db->select("s.idSucursal,
					s.idTienda,
					s.nombre,s.nombre AS value,
					s.direccion,
					s.telefono,
					s.email,
					s.descripcion,
					s.almacen,
					s.estatus,
					s.fechaCaptura,
					s.fechaModificacion,
					s.tipoSucursal",FALSE);
				$this->db->from('yoco_sucursales AS s');
				$this->db->join('yoco_rel_usuarios_sucursal AS us','s.idSucursal = us.idSucursal');
				$this->db->where('us.idUsuario', $idUsuario);
				$this->db->where('s.estatus', '1');
				$this->db->where('s.idTienda', $idTienda);
				$this->db->like("s.nombre", $termino);
				$this->db->order_by('s.nombre');

				$query = $this->db->get();
				$res = $query->num_rows();
				if ($res>0){
					$data  =  $query->result();
				}
				break;
			default:
				return array();
				break;
		}
		return $data;
	}

}