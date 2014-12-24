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
		//SET LANGUAGE
		$lang = $_GET['lang'];
		if ($lang == 'id'){require('lang/id.php');}
		elseif ($lang == 'en'){require('lang/eng.php');}
		elseif ($lang == 'uz'){require('lang/uzbek.php');}
		else{require('lang/id.php');}

		session_start();
    	$_SESSION['lang'] = $lang;
    	$this->view->assign('language',$LANG);

		//GET BANNER
		$getBanner = $this->contentHelper->getBanner();
		$this->view->assign('banner',$getBanner);

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

		//GET NEWEST VIDEO
		$getNewestVideo = $this->contentHelper->getNewestVideo();
		$this->view->assign('newestVideo',$getNewestVideo);
		

		return $this->loadView('home');
    }

    function content(){
    	//SET LANGUAGE
		$lang = $_GET['lang'];
		if ($lang == 'id'){require('lang/id.php');}
		elseif ($lang == 'en'){require('lang/eng.php');}
		elseif ($lang == 'uz'){require('lang/uzbek.php');}
		else{require('lang/id.php');}

		session_start();
    	$_SESSION['lang'] = $lang;
    	$this->view->assign('language',$LANG);

    	$id = $_GET['id'];
		$type = $_GET['type'];
		$lang = $_SESSION['lang'];

		$getTitle = $this->contentHelper->getTitle($id);
		$this->view->assign('title',$getTitle);

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
    	$oldLang = $_POST['oldLang'];
    	$url_uzbk = str_replace("uzbk/","",$_POST['url']);

    	if('http://'.$url_uzbk == $basedomain){
    		header('location:http://'.$url_uzbk.'home/index/?lang='.$lang);
    		die();
    	}
    	else{

	    	$url = str_replace("lang=".$oldLang,"lang=".$lang,$url_uzbk);
	    	
	    	header('location:http://'.$url);
	    	die();
    	}
    }
}

?>
