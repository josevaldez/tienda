<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
require_once APPPATH."/third_party/mPDF/mPDF.php";

class mpdfhtml extends mPDF {
	public function __construct() {
		parent::__construct();
	}
}