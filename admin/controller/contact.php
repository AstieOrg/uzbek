<?php
// defined ('TATARUANG') or exit ( 'Forbidden Access' );

class contact extends Controller {
	
	var $models = FALSE;
	
	public function __construct()
	{
		parent::__construct();

		global $app_domain;
		$this->loadmodule();
		$this->view = $this->setSmarty();
		$sessionAdmin = new Session;
		$this->admin = $sessionAdmin->get_session();
		// $this->validatePage();
		$this->view->assign('app_domain',$app_domain);
	}
	public function loadmodule()
	{
		
		$this->models = $this->loadModel('mcontact');
	}
	
	public function index(){
		$this->view->assign('active','active');
		$data = $this->models->get_contact(0);
		//pr($data);exit;

		if ($data){
		
			foreach ($data as $key => $val){

				$data[$key]['date_received'] = dateFormat($val['date_received'],'article');

				//$data[$key]['posted_date'] = dateFormat($val['posted_date'],'article');
				
			}
		}
		// pr($data);exit;
		$this->view->assign('data',$data);

		return $this->loadView('contact/contactus');

	}

	public function frame(){

		$data = $this->models->get_frameList();
		// pr($data);
		$this->view->assign('data',$data);

		return $this->loadView('listFrame');
	}
	
	function ajax()
	{
		
		$id = _p('id');
		$n_status = _p('n_status');
		
		$data = $this->models->updateStatusFrame($id, $n_status);
		if ($data){
			print json_encode(array('status'=>true));
		}else{
			print json_encode(array('status'=>false));
		}

		exit;
	}
}

?>
