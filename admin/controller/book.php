<?php
// defined ('TATARUANG') or exit ( 'Forbidden Access' );

class book extends Controller {
	
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
        $this->mbook = $this->loadModel('mbook');
	}
	
	public function index(){
		
	}
    
    public function booklist(){
        $data = $this->mbook->get_book();
        //pr($data);exit;

		if ($data){
			foreach ($data as $key => $val){

				$data[$key]['created_date'] = dateFormat($val['created_date'],'article');

				if($val['status'] == '1') {
					$data[$key]['status'] = 'Publish';
					$data[$key]['status_color'] = 'green';
				} else {
					$data[$key]['status'] = 'Unpublish';
					$data[$key]['status_color'] = 'red'; 
				}
			}
		}
		
		// pr($data);exit;
		$this->view->assign('data',$data);
        return $this->loadView('book/repository');
    }
    
    public function addfiles(){
        if(isset($_GET['id']))
		{

			$data = $this->mbook->get_book_id($_GET['id']);
            
            if($data){
                $data['created_date'] = dateFormat($data['created_date'],'dd-mm-yyyy');
            }
            
			$this->view->assign('data',$data);
		}
        
        $this->view->assign('admin',$this->admin['admin']);
        return $this->loadView('book/inputFile');
    }
    
    public function inpFile(){

		global $CONFIG;
        
        if(isset($_POST['status'])){
			if($_POST['status']=='on') $_POST['status']=1;
		} else {
			$_POST['status']=0;
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
                    //pr($_FILES);exit;
					if($_FILES['file_image']['error']==0){
						
						$path_upload = 'book';
						
                        if($x['action'] == 'update') deleteFile($x['filename'],$path_upload);
						$image = uploadFile('file_image',$path_upload);
                        
						$x['files'] = $CONFIG['admin']['app_url'].$image['folder_name'].$image['full_name'];
                        $x['realname'] = $image['real_name'];
						$x['filename'] = $image['full_name'];
                        
					}
                    //pr($x);exit;
					$data = $this->mbook->bookInp('repo',$x);
					
		   		}
			   	
		   }catch (Exception $e){}
        
        $redirect = $CONFIG['admin']['base_url'].'home';
        if(isset($x['gallerytype'])){
            if($x['gallerytype']=='0'){
				$redirect = $CONFIG['admin']['base_url'].'book/booklist';
			}
        }
        
        echo "<script>alert('Data berhasil di simpan');window.location.href='".$redirect."'</script>";
        }
	}
    
    function deleteFile(){
        global $CONFIG;
        $path = 'book';
        
        foreach($_POST['ids'] as $id){
            $getfile = $this->mbook->get_book_id($id);
            $delImage[] = $getfile['filename'];
        }
        
        foreach ($delImage as $image){
            $delete = deleteFile($image,$path);
        }
        
		$data = $this->mbook->file_del($_POST['ids']);
		
        $redirect = $CONFIG['admin']['base_url'].'book/booklist';
        
		echo "<script>alert('Data berhasil dihapus');window.location.href='".$redirect."'</script>";
    }
    
}

?>
