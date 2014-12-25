<?php

class media extends Controller {
	
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
	** To show album's view
	** @param $lang = type of language
	** @return default empty is for Indonesia, id = Indonesia, en = English, uz = Uzbekistan
	**/
	function album(){
		//SET LANGUAGE
		$lang = $_GET['lang'];
		if ($lang == 'id'){require('lang/id.php');}
		elseif ($lang == 'en'){require('lang/eng.php');}
		elseif ($lang == 'uz'){require('lang/uzbek.php');}
		else{require('lang/id.php');}

		session_start();
    	$_SESSION['lang'] = $lang;
    	$this->view->assign('language',$LANG);

		//GET ALBUM
		$getAlbum = $this->contentHelper->getAlbum();
		$this->view->assign('album',$getAlbum);	
		
		return $this->loadView('album');
    }

    /**
	** To show view album's view
	** @param $lang = type of language
	** @return default empty is for Indonesia, id = Indonesia, en = English, uz = Uzbekistan
	** @param $id = id of detail album to be shown
	**/
    function viewAlbum(){
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
		//GET TITLE ALBUM
		$titleAlbum = $this->contentHelper->titleAlbum($id);
		$this->view->assign('titleAlbum',$titleAlbum);	
		//VIEW ALBUM
		$viewAlbum = $this->contentHelper->viewAlbum($id);
		$this->view->assign('viewAlbum',$viewAlbum);	
		
		return $this->loadView('viewAlbum');
    }

    /**
	** To show video's view
	** @param $lang = type of language
	** @return default empty is for Indonesia, id = Indonesia, en = English, uz = Uzbekistan
	**/
    function video(){
    	//SET LANGUAGE
		$lang = $_GET['lang'];
		if ($lang == 'id'){require('lang/id.php');}
		elseif ($lang == 'en'){require('lang/eng.php');}
		elseif ($lang == 'uz'){require('lang/uzbek.php');}
		else{require('lang/id.php');}

		session_start();
    	$_SESSION['lang'] = $lang;
    	$this->view->assign('language',$LANG);

		//GET VIDEO
		$getVideo = $this->contentHelper->getVideo();
		foreach ($getVideo as $key => $value) {
			$getVideo[$key]['content_en'] = html_entity_decode($value['content_en'],ENT_QUOTES, 'UTF-8');
		}
		$this->view->assign('video',$getVideo);	
		
		return $this->loadView('video');
    }

    /**
	** To show view video's view
	** @param $lang = type of language
	** @return default empty is for Indonesia, id = Indonesia, en = English, uz = Uzbekistan
	** @param $id = id of detail video to be shown
	**/
    function viewVideo(){
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
		
		//VIEW VIDEO
		$viewVideo = $this->contentHelper->viewVideo($id);
		foreach ($viewVideo as $key => $value) {
			$viewVideo[$key]['content_en'] = html_entity_decode($value['content_en'],ENT_QUOTES, 'UTF-8');
		}
		$this->view->assign('viewVideo',$viewVideo);	
		
		return $this->loadView('viewVideo');
    }
}

?>
