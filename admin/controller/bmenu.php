<?php
// defined ('TATARUANG') or exit ( 'Forbidden Access' );

class bmenu extends Controller {
	
	var $models = FALSE;
	
	public function __construct()
	{
		parent::__construct();

		global $app_domain;
		$this->loadmodule();
		$this->view = $this->setSmarty();
		$sessionAdmin = new Session;
		$this->admin = $sessionAdmin->get_session();
		$this->view->assign('app_domain',$app_domain);
	}
	public function loadmodule()
	{
		
		$this->models = $this->loadModel('mbmenu');
	}
	
	public function index(){
		$this->view->assign('active','active');

		$data = $this->models->get_menu();
        //pr($data);exit;

		if ($data){
			foreach ($data as $key => $val){

				$data[$key]['created_date'] = dateFormat($val['created_date'],'article');

				$data[$key]['posted_date'] = dateFormat($val['posted_date'],'article');

				if($val['n_stats'] == '1') {
					$data[$key]['n_stats'] = 'Publish';
					$data[$key]['status_color'] = 'green';
				} else {
					$data[$key]['n_stats'] = 'Unpublish';
					$data[$key]['status_color'] = 'red'; 
				}
			}
		}
		
		// pr($data);exit;
		$this->view->assign('data',$data);
		//$this->view->assign('menuId',$menuId);

		return $this->loadView('bmenu/menu');
	}
    
    public function menuadd(){		
		$this->view->assign('active','active');
	

		if(isset($_GET['id']))
		{

			$data = $this->models->get_menu_id($_GET['id']);
            
            if($data){
                $data['created_date'] = dateFormat($data['created_date'],'dd-mm-yyyy');
                $data['posted_date'] = dateFormat($data['posted_date'],'dd-mm-yyyy');
            }
            
			$this->view->assign('data',$data);
		} 
		
	
        $this->view->assign('admin',$this->admin['admin']);
		return $this->loadView('bmenu/addmenu');
	}
	
	
	public function menuinp(){
		global $CONFIG;
		
		if(isset($_POST['n_stats'])){
			if($_POST['n_stats']=='on') $_POST['n_stats']=1;
		} else {
			$_POST['n_stats']=0;
		}
 		
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
                        
						//upload file
						if(!empty($_FILES)){
							if($_FILES['file_image']['name'] != ''){
                                
                                $path = 'news';
                                
								if($x['action'] == 'update') deleteFile($x['image'],$path.'/image');
                                
								$image = uploadFile('file_image',$path.'/image','image');
                                
								$x['image_url'] = $CONFIG['admin']['app_url'].$image['folder_name'].$image['full_name'];
								$x['image'] = $image['full_name'];
							}
                            
                            if($_FILES['file_icon']['name'] != ''){
                                
                                $path = 'news';

                                if($x['action'] == 'update') deleteFile($x['icon'],$path.'/icon');
                                
								$icon = uploadFile('file_icon',$path.'/icon','image');
                                
								$x['icon_url'] = $CONFIG['admin']['app_url'].$icon['folder_name'].$icon['full_name'];
								$x['icon'] = $icon['full_name'];
							}
						}
						$data = $this->models->menu_inp($x);
			   		}
				   	
			   }catch (Exception $e){}
            
            $redirect = $CONFIG['admin']['base_url'].'bmenu';
            $message = 'Save data succeed';
            
            echo "<script>alert('".$message."');window.location.href='".$redirect."'</script>";
            }
	}
    
    public function menudel(){

		global $CONFIG;
        $path = 'news';
        
        foreach($_POST['ids'] as $id){
            $getfile = $this->models->get_menu_id($id);
            $delImage[] = $getfile['image'];
            $delIcon[] = $getfile['icon_image'];
        }
        
        foreach ($delImage as $image){
            deleteFile($image,$path.'/image');
        }
        
        foreach ($delIcon as $icon){
            deleteFile($icon,$path.'/icon');
        }                
        
		$data = $this->models->menu_del($_POST['ids']);
		
        $redirect = $CONFIG['admin']['base_url'].'bmenu';
        $message = 'Data has been deleted';
        
		echo "<script>alert('".$message."');window.location.href='".$redirect."'</script>";
		
	}
}

?>
