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
		$data = $this->models->get_contact(false,'');
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

	public function view(){
		$id = $_GET['id'];
		$read = $this->models->read_msg($id);
		$getMsg = $this->models->get_single_msg($id);
		//pr($getMsg);
		if ($getMsg){
			foreach ($getMsg as $key => $val){
				$getMsg[$key]['date_received'] = dateFormat($val['date_received'],'article');
			}
		}
		$this->view->assign('msg',$getMsg);
		return $this->loadView('contact/viewMessage');
	}
    
    public function contactdel($action='delete'){

		global $CONFIG;
        //pr($_POST);exit;
		$menuid = $_POST['menuId'];
        $ids = $_POST['ids'];
        if($_POST['action']) $action = $_POST['action'];
        
        if($ids){
            $data = $this->models->contact_del($ids, $action);
            $message = 'Data has been deleted';
        }
		
		echo "<script>alert('".$message."');window.location.href='".$CONFIG['admin']['base_url']."contact'</script>";
		
	}
}

?>
