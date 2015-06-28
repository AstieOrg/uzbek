<?php
// defined ('MICRODATA') or exit ( 'Forbidden Access' );

class contactinfo extends Controller {
	
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
        global $CONFIG;
    
		$this->view->assign('active','active');
        $contact = $this->models->get_contact();
        
        if($contact){
            $data = $this->models->get_content($id,0);
            redirect($CONFIG['admin']['base_url']."addcontent/contentadd/?id=".$data['id']."&menuid=".$id);
        }else{
    		$data = $this->models->get_content($id);
            
    		if ($data){
    			foreach ($data as $key => $val){
    
    				$data[$key]['created_date'] = dateFormat($val['created_date'],'article');
    
    				//$data[$key]['posted_date'] = dateFormat($val['posted_date'],'article');
                    
                    $get_menu = $this->models->get_menu($val['menuId']);
                    $data[$key]['menu_data'] = $get_menu;
    
    				if($val['n_status'] == '1') {
    					$data[$key]['n_status'] = 'Publish';
    					$data[$key]['status_color'] = 'green';
    				} else {
    					$data[$key]['n_status'] = 'Unpublish';
    					$data[$key]['status_color'] = 'red'; 
    				}
    			}
    		}
    // 		$this->view->assign('menu',$menuList);
    		$this->view->assign('data',$data);
    		$this->view->assign('menuid',$id);
    
    		return $this->loadView('content/content');
        }
	}

}

?>
