<?php

class contact extends Controller {
	
	var $models = FALSE;
	var $view;

	
	function __construct()
	{
		global $basedomain;
		$this->loadmodule();
		$this->view = $this->setSmarty();
		$this->view->assign('basedomain',$basedomain);
    }
	
	function loadmodule()
	{
        $this->contentHelper = $this->loadModel('contentHelper');
	}
	
	function index(){
		//GET TOP MENU
		$getTopMenu = $this->contentHelper->getMenu('0','0');
		if (is_array($getTopMenu)){
			foreach ($getTopMenu as $getTopMenuSub) {
				$getTopMenuSub['child'] = '';
				$getSub = $this->contentHelper->getMenu('0','1');
				if (is_array($getSub)){
					foreach ($getSub as $sub) {
						if($getTopMenuSub['id'] == $sub['id_parent']){
							$getTopMenuSub['child'][] = $sub;
						}
					}
				}
				$topMenu[]=$getTopMenuSub;
			}
		}
		$this->view->assign('topMenu',$topMenu);
		
		//GET LEFT MENU
		$getLeftMenu = $this->contentHelper->getMenu('1','0');
		if (is_array($getLeftMenu)){
			foreach ($getLeftMenu as $getLeftMenuSub) {
				$getLeftMenuSub['child'] = '';
				$getSub = $this->contentHelper->getMenu('1','1');
				if (is_array($getSub)){
					foreach ($getSub as $sub) {
						if($getLeftMenuSub['id'] == $sub['id_parent']){
							$getLeftMenuSub['child'][] = $sub;
						}
					}
				}
				$leftMenu[]=$getLeftMenuSub;
			}
		}
		//pr($leftMenu);
		$this->view->assign('leftMenu',$leftMenu);

		$getNews = $this->contentHelper->getNews('0','8','0','6');

		
		
		$this->view->assign('news',$getNews);
		return $this->loadView('contact');
    }

    function send_message(){
    	global $basedomain;
    	$data = $_POST;
    	$lang = $_SESSION['lang'];
	    	if($lang == '0'){
	    		$message = 'Pesan telah dikirim.';
	    		$empty = 'Pesan Kosong.';
	    	}
	    	else if($lang == '1'){
	    		$message = 'Message has sent.';
	    		$empty = 'Empty Message.';
	    	}
	    	else if($lang == '2'){
	    		$message = 'Message has sent.';
	    		$empty = 'Empty Message.';
	    	}
	    	else{
	    		$message = 'Message has sent.';
	    		$empty = 'Empty Message.';
	    	}

    	if(!empty($data)){
	    	$insertMail = $this->contentHelper->sendMsg('api_contact_list',$data);
	    	echo "<script>alert('".$message."');window.location.href='".$basedomain."contact'</script>";
    	}
    	else{
    		echo "<script>alert('".$empty."');window.location.href='".$basedomain."contact'</script>";
    	}
    }
}

?>
