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
        global $CONFIG;
        $id = $_GET['id'];
    
		$this->view->assign('active','active');
        $menuData = $this->models->get_menu($id);
        
        if($menuData['pos']==0){
            $position = 'Top Menu Content / '.$menuData['nm_eng'];
        }
        elseif($menuData['pos']==1){
            $position = 'Side Menu Content / '.$menuData['nm_eng'];
        }
        elseif($menuData['pos']==2){
            $position = 'Topical Menu Content / '.$menuData['nm_eng'];
        }
        elseif($menuData['pos']==3){
            $position = 'Bottom Menu Content / '.$menuData['nm_eng'];
        }
        
        if($menuData['menu_type']==1){
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
            $this->view->assign('menuPosition',$position);
    
    		return $this->loadView('content/content');
        }
	}
    
    public function contentdel($action='delete'){

		global $CONFIG;
        //pr($_POST);exit;
		$menuid = $_POST['menuId'];
        $ids = $_POST['ids'];
        if($_POST['action']) $action = $_POST['action'];
        
        if($ids){
            foreach($_POST['ids'] as $id){
                $getfile = $this->models->get_content_id($id);
                $delImage[] = $getfile['image'];
                $del_doc[] = $getfile['document_filename'];
                $del_cover[] = $getfile['document_covername'];
            }
            
            foreach ($delImage as $image){
                deleteFile($image,'news');
            }
            foreach ($del_doc as $doc){
                deleteFile($doc,'news/docs');
            }
            foreach ($del_cover as $cover){
                deleteFile($cover,'news/docs/cover');
            }
            
            $data = $this->models->content_del($ids, $action);
            $message = 'Data has been deleted';
        }
		
		echo "<script>alert('".$message."');window.location.href='".$CONFIG['admin']['base_url']."content/menu/?id=".$menuid."'</script>";
		
	}
}

?>
