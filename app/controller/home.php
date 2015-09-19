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
	
	/**
	** To show home's view
	** @param $lang = type of language
	** @return default empty is for Indonesia, id = Indonesia, en = English, uz = Uzbekistan
	**/
	function index(){
		//SET LANGUAGE
		$lang = $_GET['lang'];
		if ($lang == 'id'){require('lang/id.php');}
		elseif ($lang == 'en'){require('lang/eng.php');}
		elseif ($lang == 'uz'){require('lang/uzbek.php');}
		else{require('lang/eng.php');}

		session_start();
    	$_SESSION['lang'] = $lang;
    	$this->view->assign('language',$LANG);

		//GET BANNER
		$getBanner = $this->contentHelper->getBanner();
		$this->view->assign('banner',$getBanner);

		//GET HEADLINES
		$getHeadlines = $this->contentHelper->getHeadlines();
		foreach ($getHeadlines as $key => $value) {
			$getHeadlines[$key]['content_bhs'] = html_entity_decode($value['content_bhs'],ENT_QUOTES, 'UTF-8');
			$getHeadlines[$key]['content_en'] = html_entity_decode($value['content_en'],ENT_QUOTES, 'UTF-8');
			$getHeadlines[$key]['content_uzbek'] = html_entity_decode($value['content_uzbek'],ENT_QUOTES, 'UTF-8');
		}
		$this->view->assign('headlines',$getHeadlines);

		//GET NEWS
		$lang = $_GET['lang'];
		if($lang == 'id'){$langID = '0';}
		elseif($lang == 'en'){$langID = '1';}
		elseif($lang == 'uz'){$langID = '2';}
		else{$langID = '1';}

		global $newstitle;
		$getNewsID = $this->contentHelper->getNewsID($newstitle);

		$getNews = $this->contentHelper->getNews($langID,$getNewsID['0']['id'],'0','9');
		$this->view->assign('news',$getNews);

		//GET NEWEST PHOTO
		$getNewestPhoto = $this->contentHelper->getNewestPhoto();
		$this->view->assign('newestPhoto',$getNewestPhoto);

		//GET NEWEST VIDEO
		$getNewestVideo = $this->contentHelper->getNewestVideo();
		foreach ($getNewestVideo as $key => $value) {
			$getNewestVideo[$key]['content_en'] = html_entity_decode($value['content_en'],ENT_QUOTES, 'UTF-8');
		}
		$this->view->assign('newestVideo',$getNewestVideo);

		return $this->loadView('home');
    }

    /**
	** To show every content's view
	** @param $lang = type of language
	** @return default empty is for English, id = Indonesia, en = English, uz = Uzbekistan
	** @param $id = id of content to be shown
	** @param $type = type of content to be shown
	** @return 0 = list, 1 = detail, 2 = detail for topical issues, 3 = detail for bottom menu
	**/
    function content(){
    	//SET LANGUAGE
		$lang = $_GET['lang'];
		if ($lang == 'id'){require('lang/id.php');}
		elseif ($lang == 'en'){require('lang/eng.php');}
		elseif ($lang == 'uz'){require('lang/uzbek.php');}
		else{require('lang/eng.php');}

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
		else{$langID = '1';}

		if($type == '0'){
			$getContent = $this->contentHelper->getNews($langID,$id,'0','100');
			$this->view->assign('content',$getContent);
			return $this->loadView('list');
		}
		else if($type == '1' || $type ==''){
			$getContent = $this->contentHelper->getNews($langID,$id,'0','1');
			if($getContent){
				foreach ($getContent as $key => $value) {
					$getContent[$key]['document_filesize'] = formatSizeUnits($value['document_filesize']);
				}
				
				$this->view->assign('content',$getContent);
			}
			
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
		else if($type == '4'){
			$getContent = $this->contentHelper->getNewsList($langID,$id,'0','1');
			if($getContent){
				foreach ($getContent as $key => $value) {
					$getContent[$key]['document_filesize'] = formatSizeUnits($value['document_filesize']);
				}
				$this->view->assign('content',$getContent);
			}
			return $this->loadView('detail');
		}
	}

	/**
	** Language changing process
	** @param $data = Post of language form
	**/
    function lang(){
    	global $basedomain;
    	$data = $_POST;
    	$url_uzbk = str_replace("uzbk/","",$data['url']);

    	if('http://'.$url_uzbk == $basedomain){
    		header('location:http://'.$url_uzbk.'home/index/?lang='.$data['lang']);
    		die();
    	}
    	else{

	    	$url = str_replace("lang=".$data['oldLang'],"lang=".$data['lang'],$url_uzbk);
	    	header('location:http://'.$url);
	    	die();
    	}
    }
}

?>
