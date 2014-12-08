<?php
// defined ('MICRODATA') or exit ( 'Forbidden Access' );

class addtopical extends Controller {
	
	var $models = FALSE;

	public function __construct()
	{
		parent::__construct();
		$this->loadmodule();
		$this->view = $this->setSmarty();
		$sessionAdmin = new Session;
		$this->admin = $sessionAdmin->get_session();
	}
	public function loadmodule()
	{
		
		$this->models = $this->loadModel('mtopical');
	
	}
	public function index(){
	

	}
	
	public function topicaladd(){		
		$this->view->assign('active','active');
	

		if(isset($_GET['id']))
		{

			$data = $this->models->get_topical_id($_GET['id']);
            
            if($data){
                $data['created_date'] = dateFormat($data['created_date'],'dd-mm-yyyy');
                $data['posted_date'] = dateFormat($data['posted_date'],'dd-mm-yyyy');
            }
            
			$this->view->assign('data',$data);
		} 
		
	
        $this->view->assign('admin',$this->admin['admin']);
		return $this->loadView('topical/addtopical');
	}
	
	
	public function topicalinp(){
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
                                if($x['action'] == 'update') deleteFile($x['icon'],$path.'/icon');
                                
								$image = uploadFile('file_image',$path.'/image','image');
								$icon = uploadFile('file_icon',$path.'/icon','image');
                                
								$x['image_url'] = $CONFIG['admin']['app_url'].$image['folder_name'].$image['full_name'];
								$x['image'] = $image['full_name'];
                                
								$x['icon_url'] = $CONFIG['admin']['app_url'].$icon['folder_name'].$icon['full_name'];
								$x['icon'] = $icon['full_name'];
							}
						}
						$data = $this->models->topical_inp($x);
			   		}
				   	
			   }catch (Exception $e){}
            
            $redirect = $CONFIG['admin']['base_url'].'topical';
            $message = 'Save data succeed';
            
            echo "<script>alert('".$message."');window.location.href='".$redirect."'</script>";
            }
	}

}

?>
