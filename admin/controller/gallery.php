<?php
// defined ('TATARUANG') or exit ( 'Forbidden Access' );

class gallery extends Controller {
	
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
		$this->models = $this->loadModel('marticle');
		$this->gallery = $this->loadModel('mgallery');
	}
	
	public function index(){
		$this->view->assign('active','active');
		$data = $this->models->get_article(9);
		//pr($data);exit;
		$this->view->assign('data',$data);
		return $this->loadView('gallery/album');
	}
	
    public function articleinp(){
		global $CONFIG;
		
		if(isset($_POST['n_status'])){
			if($_POST['n_status']=='on') $_POST['n_status']=1;
		} else {
			$_POST['n_status']=0;
		}
        
		if(isset($_POST['articletype'])){
			if($_POST['articletype']=='on') {
				if($_POST['articleid_old']!=0){
					$_POST['articletype'] = $_POST['articleid_old'];
				} else {
					$_POST['articletype']=1; 
				}
			}
		} else {
			$_POST['articletype']=0;
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
                        
                        //pr($x);exit;
						//upload file
						if(!empty($_FILES)){
							if($_FILES['file_image']['name'] != ''){
							
								if($x['categoryid'] == '9'){
									$path_upload = 'gallery/images';
								}else{
									$path_upload = 'news';
								}
							
                                $delete = deleteFile($x['image'],$path_upload);
								//if($x['action'] == 'update') deleteFile($x['image'],$path_upload);
								$image = uploadFile('file_image',$path_upload,'image');
								
								$x['image_url'] = $CONFIG['admin']['app_url'].$image['folder_name'].$image['full_name'];
								$x['image'] = $image['full_name'];
							}
						}
						$data = $this->models->article_inp($x);
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
                }elseif($x['categoryid']=='9'){
					if($x['articletype']=='1'){
                        $redirect = $CONFIG['admin']['base_url'].'gallery';
                    }elseif($x['articletype']=='2'){
                        $redirect = $CONFIG['admin']['base_url'].'gallery';
                    }
				}elseif($x['categoryid']=='8'){
					$redirect = $CONFIG['admin']['base_url'].'direktori/repository/listCategory';
				}
            }
            
            echo "<script>alert('Data berhasil di simpan');window.location.href='".$redirect."'</script>";
            }
	}
    
	public function add(){
        $albumId = $_GET['album'];
        $data = $this->gallery->get_album($albumId);
        $this->view->assign('data',$data);
		return $this->loadView('gallery/inputAlbum');
	}
	
	public function album(){
		$albumId = $_GET['album'];
		$data = $this->gallery->get_images($albumId);
		
		$this->view->assign('data',$data);
		$this->view->assign('albumId',$albumId);
		return $this->loadView('gallery/images');
	}
	
	public function gallerydel(){

		global $CONFIG;

		$data = $this->gallery->gallery_del($_POST['ids']);
		
		echo "<script>alert('Data berhasil dihapus');window.location.href='".$CONFIG['admin']['base_url']."gallery'</script>";
		
	}
	public function imagedel(){

		global $CONFIG;
		$albumid=$_POST['album'];
        
		$data = $this->gallery->image_del($_POST['ids']);
		
		echo "<script>alert('Data berhasil dihapus');window.location.href='".$CONFIG['admin']['base_url']."gallery/album/?album=".$albumid."'</script>";
		
	}
	public function addImages(){
		$albumId = $_GET['album'];
		$this->view->assign('albumId',$albumId);
		return $this->loadView('gallery/addImages');
	}
	
	public function inpGallery(){
		global $CONFIG;
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
						
						if($x['gallerytype'] == '9'){
							$path_upload = 'gallery/images';
						}else{
							$path_upload = '';
						}
						
						$image = uploadFileMultiple('file_image',$path_upload,'image');
						foreach ($_FILES['file_image']['name'] as $filekey => $file){
							$x['image_url'] = $CONFIG['admin']['app_url'].$image[$filekey]['folder_name'].$image[$filekey]['full_name'];
							$x['image'] = $image[$filekey]['full_name'];
							$data = $this->gallery->gallery_inp($x);
						}
					}
					
		   		}
			   	
		   }catch (Exception $e){}
        
        $redirect = $CONFIG['admin']['base_url'].'home';
        if(isset($x['gallerytype'])){
            if($x['gallerytype']=='9'){
				$redirect = $CONFIG['admin']['base_url'].'gallery/album/?album='.$x['otherid'];
			}
        }
        
        echo "<script>alert('Data berhasil di simpan');window.location.href='".$redirect."'</script>";
        }
	}
}

?>