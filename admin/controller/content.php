<?php
// defined ('TATARUANG') or exit ( 'Forbidden Access' );

class content extends Controller {
	
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
		
		$this->models = $this->loadModel('mcontent');
	}
	
	public function index(){
		$this->view->assign('active','active');
		$data = $this->models->get_content($menuId);

		if ($data){
			foreach ($data as $key => $val){

				$data[$key]['created_date'] = dateFormat($val['created_date'],'article');

				//$data[$key]['posted_date'] = dateFormat($val['posted_date'],'article');

				if($val['n_status'] == '1') {
					$data[$key]['n_status'] = 'Publish';
					$data[$key]['status_color'] = 'green';
				} else {
					$data[$key]['n_status'] = 'Unpublish';
					$data[$key]['status_color'] = 'red'; 
				}
			}
		}
		
		// pr($data);exit;
		$this->view->assign('data',$data);
		$this->view->assign('menuId',$menuId);

		return $this->loadView('content/content');
	}
	
	public function menu(){
	
	$id = $_GET['id'];
	//pr($menuId);exit;
		$this->view->assign('active','active');
// 		$menuList = $this->getmenuModels->getMenuData();
		$data = $this->models->get_content($id);

		if ($data){
			foreach ($data as $key => $val){

				$data[$key]['created_date'] = dateFormat($val['created_date'],'article');

				//$data[$key]['posted_date'] = dateFormat($val['posted_date'],'article');

				if($val['n_status'] == '1') {
					$data[$key]['n_status'] = 'Publish';
					$data[$key]['status_color'] = 'green';
				} else {
					$data[$key]['n_status'] = 'Unpublish';
					$data[$key]['status_color'] = 'red'; 
				}
			}
		}
		
		// pr($data);exit;
// 		$this->view->assign('menu',$menuList);
		$this->view->assign('data',$data);
		$this->view->assign('menuid',$id);

		return $this->loadView('content/content');
	}
    
    public function contentdel($action='delete'){

		global $CONFIG;
        //pr($_POST);exit;
		$menuid = $_POST['menuId'];
        $ids = $_POST['ids'];
        if($_POST['action']) $action = $_POST['action'];
        
        if($ids){
            $data = $this->models->content_del($ids, $action);
            $message = 'Data has been deleted';
        }
		
		echo "<script>alert('".$message."');window.location.href='".$CONFIG['admin']['base_url']."content/menu/?id=".$menuid."'</script>";
		
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
