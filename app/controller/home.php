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

		//GET BANNER
		$getBanner = $this->contentHelper->getBanner();
		$this->view->assign('banner',$getBanner);

		//GET TOPICAL ISSUES
		$getTopicalIssues = $this->contentHelper->getTopicalIssues();
		$this->view->assign('topicalIssues',$getTopicalIssues);

		//GET HEADLINES
		$getHeadlines = $this->contentHelper->getHeadlines();
		$this->view->assign('headlines',$getHeadlines);

		//GET NEWS
		$lang = $_GET['lang'];
		if($lang == 'id'){$langID = '0';}
		elseif($lang == 'en'){$langID = '1';}
		elseif($lang == 'uz'){$langID = '2';}
		else{$langID = '0';}
		$getNews = $this->contentHelper->getNews($langID,'26','0','6');
		$this->view->assign('news',$getNews);

		//GET NEWEST PHOTO
		$getNewestPhoto = $this->contentHelper->getNewestPhoto();
		$this->view->assign('newestPhoto',$getNewestPhoto);

		//GET BOTTOM MENU
		$getBottomMenu = $this->contentHelper->getBottomMenu();
		$this->view->assign('bottomMenu',$getBottomMenu);

		//SET LANGUAGE
		$lang = $_GET['lang'];
		if ($lang == 'id'){require_once('lang/id.php');}
		elseif ($lang == 'en'){require_once('lang/eng.php');}
		elseif ($lang == 'uz'){require_once('lang/uzbek.php');}
		else{require_once('lang/id.php');}

		session_start();
    	$_SESSION['lang'] = $lang;
    	$this->view->assign('language',$LANG);
		

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

		//GET BOTTOM MENU
		$getBottomMenu = $this->contentHelper->getBottomMenu();
		$this->view->assign('bottomMenu',$getBottomMenu);

		//GET TOPICAL ISSUES
		$getTopicalIssues = $this->contentHelper->getTopicalIssues();
		$this->view->assign('topicalIssues',$getTopicalIssues);

		$id = $_GET['id'];
		$type = $_GET['type'];
		$lang = $_SESSION['lang'];

		$getTitle = $this->contentHelper->getTitle($id);
		$this->view->assign('title',$getTitle);

		//SET LANGUAGE
		$lang = $_GET['lang'];
		if ($lang == 'id'){require_once('lang/id.php');}
		elseif ($lang == 'en'){require_once('lang/eng.php');}
		elseif ($lang == 'uz'){require_once('lang/uzbek.php');}
		else{require_once('lang/id.php');}

		session_start();
    	$_SESSION['lang'] = $lang;
    	$this->view->assign('language',$LANG);
		
		//SET TYPE
		$lang = $_GET['lang'];
		if($lang == 'id'){$langID = '0';}
		elseif($lang == 'en'){$langID = '1';}
		elseif($lang == 'uz'){$langID = '2';}
		else{$langID = '0';}

		if($type == '0'){
			$getContent = $this->contentHelper->getNews($langID,$id,'0','10');
			$this->view->assign('content',$getContent);
			return $this->loadView('list');
		}
		else if($type == '1' || $type ==''){
			$getContent = $this->contentHelper->getNews($langID,$id,'0','1');
			$this->view->assign('content',$getContent);
			return $this->loadView('detail');
		}
		else if($type == '2'){
			$getContent = $this->contentHelper->getTopical('_topical_issues', $id);
			$this->view->assign('content',$getContent);
			//pr($getContent);
			return $this->loadView('detail_topical');
		}
		else if($type == '3'){
			$getContent = $this->contentHelper->getTopical('_menu_bottom', $id);
			$this->view->assign('content',$getContent);
			return $this->loadView('detail_topical');
		}
	}

    function lang(){
    	global $basedomain;
    	$lang = $_POST['lang'];
    	$oldLang = $_SESSION['lang'];

    	if('http://'.$_POST['url'] == $basedomain){
    		header('location:http://'.$_POST['url'].'home/index/?lang='.$lang);
    		die();
    	}
    	else{

	    	//pr($lang);
	    	$url_uzbk = str_replace("uzbk/","",$_POST['url']);
	    	$url = str_replace("lang=".$oldLang,"lang=".$lang,$url_uzbk);
	    	//pr ($url);
	    	
	    	header('location:http://'.$url);
	    	die();
    	}
    }
}

?>
