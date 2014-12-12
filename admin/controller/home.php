<?php
// defined ('TATARUANG') or exit ( 'Forbidden Access' );

class home extends Controller {
	
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
		
		$this->models = $this->loadModel('mmenu');
	}
	
	public function index(){
		$this->view->assign('active','active');
		$data = $this->models->get_menu();
        

		if ($data){
			foreach ($data as $key => $val){
                
				$data[$key]['date_created'] = dateFormat($val['date_created'],'article');
                
                if($val['pos'] == '0') {
					$data[$key]['pos'] = 'Top';
				} else {
					$data[$key]['pos'] = 'Side';
				}
                
                $data[$key]['id_parent'] = '-';
                if($val['id_parent'] != 0) {
                    $get_parent = $this->models->get_parent($val['id_parent']);
                    $data[$key]['parent_data'] = $get_parent;
				}
				
				if($val['is_child'] == 0) {
					$data[$key]['is_child'] = 'Parent ';
					$data[$key]['mstat_color'] = 'green';
                    
                    $getchild = $this->models->get_child($val['id']);
                    if($getchild) $data[$key]['disabled'] = 'disabled';
                    
                    $get_content = $this->models->get_content($val['id']);
                    if($get_content) $data[$key]['disabled'] = 'disabled';
                    
				} else {
					$data[$key]['is_child'] = 'Child';
					$data[$key]['mstat_color'] = 'blue';
                    
                    $get_content = $this->models->get_content($val['id']);
                    if($get_content) $data[$key]['disabled'] = 'disabled';
				}
				
				if($val['n_stats'] == '1') {
					$data[$key]['n_stats'] = 'Publish';
					$data[$key]['status_color'] = 'green';
				} else {
					$data[$key]['n_stats'] = 'Unpublish';
					$data[$key]['status_color'] = 'red'; 
				}
                
                
			}
		}
        //exit;
		$this->view->assign('data',$data);

		return $this->loadView('home');

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
