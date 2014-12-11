<?php
// defined ('MICRODATA') or exit ( 'Forbidden Access' );

class menu extends Controller {
	
	var $models = FALSE;
	
	public function __construct()
	{
		parent::__construct();
		$this->loadmodule();
		$this->view = $this->setSmarty();
		$sessionAdmin = new Session;
		$this->admin = $sessionAdmin->get_session();
		// $this->validatePage();
	}
	public function loadmodule()
	{
		
		$this->models = $this->loadModel('mmenu');
		$this->getmenuModels = $this->loadModel('getMenuHelper');
	}
	
	public function index(){
       
		

	}
	
	public function addmenu(){
		
		$this->view->assign('active','active');
		$menuList = $this->getmenuModels->getMenuParent();
        
		if(isset($_GET['id']))
		{
			$data = $this->models->get_menu_id($_GET['id']);
			//print_r($data);exit;
            if($data){
                $data['date_created'] = dateFormat($data['date_created'],'dd-mm-yyyy');
                //$data['posted_date'] = dateFormat($data['posted_date'],'dd-mm-yyyy');
                //$data['expired_date'] = dateFormat($data['expired_date'],'dd-mm-yyyy');
                
                $getchild = $this->models->get_child($data['id']);
                if($getchild) $parentOption = 'disabled';
                
                $get_content = $this->models->get_content($data['id']);
                if($get_content) $parentOption = 'disabled';
            }
            
		$this->view->assign('data',$data);
        $this->view->assign('parentOption', $parentOption);
			
		}
		
		
		$this->view->assign('menu',$menuList);

		$this->view->assign('admin',$this->admin['admin']);
		return $this->loadView('menu/inputmenu');
	}
    
	public function menuinp(){
		global $CONFIG;
		
		if(isset($_POST['n_stats'])){
			if($_POST['n_stats']=='on') $_POST['n_stats']=1;
		} else {
			$_POST['n_stats']=0;
		}
 		//print_r($_POST);exit;
		if(isset($_POST)){
                // validasi value yang masuk
               $x = form_validation($_POST);
			   try
			   {
			   		if(isset($x) && count($x) != 0)
			   		{
						//update or insert
						$x['action'] = 'insert';
						if($x['id'] != ''){
							$x['action'] = 'update';
						}
                        
                        //pr($x);exit;
						//upload file
						if(!empty($_FILES)){
							if($_FILES['file_image']['name'] != ''){
                                $delete = deleteFile($x['image'],'news');
								if($x['action'] == 'update') deleteFile($x['image']);
								$image = uploadFile('file_image','news','image');
								
								$x['image_url'] = $CONFIG['admin']['app_url'].$image['folder_name'].$image['full_name'];
								$x['image'] = $image['full_name'];
							}
						}
						$data = $this->models->menu_inp($x);
						//$menuList = $this->getmenuModels->menu_inp($x);
			   		}
				   	
			   }catch (Exception $e){}
            
            $redirect = $CONFIG['admin']['base_url'].'home';
            if(isset($x['categoryid'])){
                if($x['categoryid'] == '1'){
                    $redirect = $CONFIG['admin']['base_url'].'home';
                }elseif($x['categoryid']=='2'){
                    $redirect = $CONFIG['admin']['base_url'].'agenda';
                }elseif($x['categoryid']=='3'){
                    if($x['articletype']=='1'){
                        $redirect = $CONFIG['admin']['base_url'].'about/profile';
                    }elseif($x['articletype']=='2'){
                        $redirect = $CONFIG['admin']['base_url'].'about/struktur';
                    }
                }
            }
            
            echo "<script>alert('Data saved');window.location.href='".$redirect."'</script>";
            }
	}
	
	public function menudel($action='delete'){

		global $CONFIG;
        //pr($_POST);exit;
		$menuid = $_POST['menuId'];
        $ids = $_POST['ids'];
        if($_POST['action']) $action = $_POST['action'];
        
        if($ids){
            $data = $this->models->menu_del($ids, $action);
            $message = 'Data has been deleted';
        }
		
		echo "<script>alert('".$message."');window.location.href='".$CONFIG['admin']['base_url']."home/'</script>";
		
	}
	
	public function trash(){
       
		$data = $this->models->get_article_trash(1);
		if ($data){
			foreach ($data as $key => $val){
				$data[$key]['created_date'] = dateFormat($val['created_date'],'article');

				$data[$key]['posted_date'] = dateFormat($val['posted_date'],'article');

				if($val['n_status'] == '2') {
					$data[$key]['n_status'] = 'Deleted';
					$data[$key]['status_color'] = 'red';
				} 
			}
		}

		$this->view->assign('active','active');
		$this->view->assign('data',$data);

		return $this->loadView('article/viewtrash');

	}
	
	
	public function articlerest(){

		global $CONFIG;
		
		$data = $this->models->article_restore($_POST['ids']);
        
        $redirect = $CONFIG['admin']['base_url'].'home';
        if(isset($_POST['categoryid'])){
            if($_POST['categoryid'] == '1'){
                $redirect = $CONFIG['admin']['base_url'].'article';
            }elseif($_POST['categoryid']=='2'){
                $redirect = $CONFIG['admin']['base_url'].'agenda';
            }
        }
		
		echo "<script>alert('Data berhasil dikembalikan');window.location.href='".$redirect."/trash'</script>";
		
	}
	
	public function articledelp(){

		global $CONFIG;
		
		$id = $_GET['id'];

		$data = $this->models->article_delpermanent($id);
		
		echo "<script>alert('Data berhasil di hapus secara permanen');window.location.href='".$CONFIG['admin']['base_url']."article/trash'</script>";
		
	}

}

?>
