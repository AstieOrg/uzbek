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
	
	/**
	** To show contact's view
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

    	//GET Contact Content
		$getContactContent = $this->contentHelper->getContactContent();
		foreach ($getContactContent as $key => $value) {
			$getContactContent[$key]['content_bhs'] = html_entity_decode($value['content_bhs'],ENT_QUOTES, 'UTF-8');
			$getContactContent[$key]['content_en'] = html_entity_decode($value['content_en'],ENT_QUOTES, 'UTF-8');
			$getContactContent[$key]['content_uzbek'] = html_entity_decode($value['content_uzbek'],ENT_QUOTES, 'UTF-8');
		}
		$this->view->assign('contactContent',$getContactContent);
    	
    	
		return $this->loadView('contact');
    }

    /**
	** The process of sending message
	** @param $data = Post from contact's from
	** @param $lang = Taken from language session
	**/
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
    		$insertMail = $this->contentHelper->sendMsg('uzbemb_message',$data);
	    	echo "<script>alert('".$message."');window.location.href='".$basedomain."contact/index/?lang='".$langURL."</script>";
    	}
    }
}

?>
