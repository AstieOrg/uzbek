<?php

class home extends Controller {
	
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
		$this->view->assign('leftMenu',$leftMenu);

		//GET HEADLINES
		$getHeadlines = $this->contentHelper->getHeadlines();
		$this->view->assign('headlines',$getHeadlines);

		//GET NEWS
		$lang = $_SESSION['lang'];
		$getNews = $this->contentHelper->getNews($lang,'26','0','6');
		$this->view->assign('news',$getNews);
		
		return $this->loadView('home');
    }

    function content(){
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

		$id = $_GET['id'];
		$type = $_GET['type'];
		$lang = $_SESSION['lang'];

		$getTitle = $this->contentHelper->getTitle($id);
		$this->view->assign('title',$getTitle);
		
		if($type == '0'){
			$getContent = $this->contentHelper->getNews($lang,$id,'0','10');
			$this->view->assign('content',$getContent);
			return $this->loadView('list');
		}
		else{
			$getContent = $this->contentHelper->getNews($lang,$id,'0','1');
			$this->view->assign('content',$getContent);
			return $this->loadView('detail');
		}
	}

    function lang(){
    	$basedomain = 'http://localhost/uzbek/framework';
    	$lang = $_GET['lang'];
    	$url = $_GET['url'];
    	session_start();
    	$_SESSION['lang'] = $lang;
    	header('location:http://'.$url);
    	die();
    }
}

?>
