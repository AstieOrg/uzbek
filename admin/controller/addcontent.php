<?php
// defined ('MICRODATA') or exit ( 'Forbidden Access' );

class addcontent extends Controller {
	
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
		
		$this->models = $this->loadModel('mcontent');
		// gak usah. kan menunya udah ada di sidebar
		//$this->getmodels = $this->loadModel('getMenuHelper');
	
	}
	public function index(){
	

	}
	
	public function contentadd(){
	$menuId = $_GET['menuid'];
    $id = $_GET['id'];
	//pr($menuId); exit;		
		$this->view->assign('active','active');
        
        

		if($id)
		{
		//ini utk edit
			$data = $this->models->get_content_id($id);
            
            if($data){
                //$data['dateCreate'] = dateFormat($data['dateCreate'],'dd-mm-yyyy');
                $data['posted_date'] = dateFormat($data['posted_date'],'dd-mm-yyyy');
                //$data['expired_date'] = dateFormat($data['expired_date'],'dd-mm-yyyy');
            }
            
			$this->view->assign('data',$data);
		} 
		
	
	      	$this->view->assign('admin',$this->admin['admin']);
	      	$this->view->assign('menuid',$menuId);
		/* folder: content file:addcontent.html */
		return $this->loadView('content/addcontent');
	}
	
	
	public function contentinp(){
		global $CONFIG;
        $menuId = $_POST['menuId'];
		
		if(isset($_POST['stats'])){
			if($_POST['stats']=='on') $_POST['stats']=1;
		} else {
			$_POST['stats']=0;
		}
        
		if(isset($_POST['menuType'])){
			if($_POST['menuType']=='on') {
				if($_POST['articleid_old']!=0){
					$_POST['menuType'] = $_POST['articleid_old'];
				} else {
					$_POST['menuType']=1; 
				}
			}
		} else {
			$_POST['menuType']=0;
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
                                //$delete = deleteFile($x['image'],'news');
								if($x['action'] == 'update') deleteFile($x['image'],'news');
								$image = uploadFile('file_image','news','image');
								
								$x['image_url'] = $CONFIG['admin']['app_url'].$image['folder_name'].$image['full_name'];
								$x['image'] = $image['full_name'];
							}
                            if($_FILES['doc_file']['name'] != ''){
								if($x['action'] == 'update') deleteFile($x['document_filename'],'news/docs');
								$document = uploadFile('doc_file','news/docs','document_ext');
								
								$x['document_file'] = $CONFIG['admin']['app_url'].$document['folder_name'].$document['full_name'];
								$x['document_filename'] = $document['full_name'];
							}
                            if($_FILES['doc_cover']['name'] != ''){
								if($x['action'] == 'update') deleteFile($x['document_covername'],'news/docs/cover');
								$cover = uploadFile('doc_cover','news/docs/cover','image');
								
								$x['document_cover'] = $CONFIG['admin']['app_url'].$cover['folder_name'].$cover['full_name'];
								$x['document_covername'] = $cover['full_name'];
							}
						}
                        
						$data = $this->models->content_inp($x);
			   		}
				   	
			   }catch (Exception $e){}
            
            $redirect = $CONFIG['admin']['base_url'].'content/menu/?id='.$menuId;
            $message = 'Save data succeed';
            
            echo "<script>alert('".$message."');window.location.href='".$redirect."'</script>";
            }
	}
	
	public function contentdel(){

		global $CONFIG;
		// pr($_POST);exit;
		$data = $this->models->content_del($_POST['ids']);
		
		echo "<script>alert('Data dipindahkan ke trash');window.location.href='".$CONFIG['admin']['base_url']."home'</script>";
		
	}
    
    public function del_one(){
        global $CONFIG;        
        $id = $_GET['id'];
        $menuId = $_GET['menuid'];        
        $get['ids'][1] = $id;
        $data = $this->models->content_del($get['ids'], 'delete');
    
        echo "<script>alert('Data berhasil dihapus');window.location.href='".$CONFIG['admin']['base_url']."addcontent/contentadd/?id=&menuid=".$menuId."'</script>";        
    }        
	
	public function trash(){
       
		$data = $this->models->get_content_trash(1);
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

		return $this->loadView('content/viewtrash');

	}
	
	
	public function contentrest(){

		global $CONFIG;
		
		$data = $this->models->content_restore($_POST['ids']);
        
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
	
	public function contentdelp(){

		global $CONFIG;
		
		$id = $_GET['id'];

		$data = $this->models->article_delpermanent($id);
		
		echo "<script>alert('Data berhasil di hapus secara permanen');window.location.href='".$CONFIG['admin']['base_url']."article/trash'</script>";
		
	}

}

?>
