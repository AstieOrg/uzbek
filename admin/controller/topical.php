<?php
// defined ('TATARUANG') or exit ( 'Forbidden Access' );

class topical extends Controller {
	
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
		
		$this->models = $this->loadModel('mtopical');
	}
	
	public function index(){
		$this->view->assign('active','active');

		$data = $this->models->get_topical();
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

		return $this->loadView('topical/topical');
	}
    
    public function topicaldel(){

		global $CONFIG;
        $path = 'news';
        
        foreach($_POST['ids'] as $id){
            $getfile = $this->models->get_topical_id($id);
            $delImage[] = $getfile['image'];
            $delIcon[] = $getfile['icon_image'];
        }
        
        foreach ($delImage as $image){
            deleteFile($image,$path.'/image');
        }
        
        foreach ($delIcon as $icon){
            deleteFile($icon,$path.'/icon');
        }                
        
		$data = $this->models->topical_del($_POST['ids']);
		
        $redirect = $CONFIG['admin']['base_url'].'topical';
        $message = 'Data has been deleted';
        
		echo "<script>alert('".$message."');window.location.href='".$redirect."'</script>";
		
	}
}

?>
