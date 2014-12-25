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
		else{require('lang/id.php');}

		session_start();
    	$_SESSION['lang'] = $lang;
    	$this->view->assign('language',$LANG);
    	
    	
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
	    	$insertMail = $this->contentHelper->sendMsg('uzbemb_contact_list',$data);
	    	echo "<script>alert('".$message."');window.location.href='".$basedomain."contact'</script>";
    	}
    	else{
    		echo "<script>alert('".$empty."');window.location.href='".$basedomain."contact'</script>";
    	}
    }
}

?>
