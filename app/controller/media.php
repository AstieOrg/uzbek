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
	
	function album(){
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
		//pr($topMenu);exit;
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

		//GET TOPICAL ISSUES
		$getTopicalIssues = $this->contentHelper->getTopicalIssues();
		$this->view->assign('topicalIssues',$getTopicalIssues);

		//GET BOTTOM MENU
		$getBottomMenu = $this->contentHelper->getBottomMenu();
		$this->view->assign('bottomMenu',$getBottomMenu);

		//GET ALBUM
		$getAlbum = $this->contentHelper->getAlbum();
		$this->view->assign('album',$getAlbum);	
		
		//SET LANGUAGE
		$lang = $_GET['lang'];
		if ($lang == 'id'){require_once('lang/id.php');}
		elseif ($lang == 'en'){require_once('lang/eng.php');}
		elseif ($lang == 'uz'){require_once('lang/uzbek.php');}
		else{require_once('lang/id.php');}

		session_start();
    	$_SESSION['lang'] = $lang;
    	$this->view->assign('language',$LANG);

		return $this->loadView('album');
    }

    function viewAlbum(){
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
		//pr($topMenu);exit;
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

		//GET TOPICAL ISSUES
		$getTopicalIssues = $this->contentHelper->getTopicalIssues();
		$this->view->assign('topicalIssues',$getTopicalIssues);

		//GET BOTTOM MENU
		$getBottomMenu = $this->contentHelper->getBottomMenu();
		$this->view->assign('bottomMenu',$getBottomMenu);

		$id = $_GET['id'];
		//GET TITLE ALBUM
		$titleAlbum = $this->contentHelper->titleAlbum($id);
		$this->view->assign('titleAlbum',$titleAlbum);	
		//VIEW ALBUM
		$viewAlbum = $this->contentHelper->viewAlbum($id);
		$this->view->assign('viewAlbum',$viewAlbum);	
		
		//SET LANGUAGE
		$lang2 = $_GET['lang'];
		if ($lang2 == 'en'){$lang3 ='1';}
		elseif ($lang2 == 'id') {$lang3 = '0';}
		elseif ($lang2 == 'uz') {$lang3 = '2';}
		else{echo $lang3 = '';}

		session_start();
    	$_SESSION['lang'] = $lang3;
    	
		$lang = $_SESSION['lang'];
		if($lang == '0' || $lang == ''){require_once('lang/id.php');}
		elseif ($lang == '1') {require_once('lang/eng.php');}
		elseif ($lang ==  '2') {require_once('lang/uzbek.php');}
		$this->view->assign('language',$LANG);
		
		return $this->loadView('viewAlbum');
    }

    function video(){
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
		//pr($topMenu);exit;
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

		//GET TOPICAL ISSUES
		$getTopicalIssues = $this->contentHelper->getTopicalIssues();
		$this->view->assign('topicalIssues',$getTopicalIssues);

		//GET BOTTOM MENU
		$getBottomMenu = $this->contentHelper->getBottomMenu();
		$this->view->assign('bottomMenu',$getBottomMenu);

		//GET ALBUM
		$getVideo = $this->contentHelper->getVideo();
		$this->view->assign('video',$getVideo);	
		
		//SET LANGUAGE
		$lang = $_GET['lang'];
		if ($lang == 'id'){require_once('lang/id.php');}
		elseif ($lang == 'en'){require_once('lang/eng.php');}
		elseif ($lang == 'uz'){require_once('lang/uzbek.php');}
		else{require_once('lang/id.php');}

		session_start();
    	$_SESSION['lang'] = $lang;
    	$this->view->assign('language',$LANG);

		return $this->loadView('video');
    }

    function viewVideo(){
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
		//pr($topMenu);exit;
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

		//GET TOPICAL ISSUES
		$getTopicalIssues = $this->contentHelper->getTopicalIssues();
		$this->view->assign('topicalIssues',$getTopicalIssues);

		//GET BOTTOM MENU
		$getBottomMenu = $this->contentHelper->getBottomMenu();
		$this->view->assign('bottomMenu',$getBottomMenu);

		$id = $_GET['id'];
		//VIEW VIDEO
		$viewVideo = $this->contentHelper->viewVideo($id);
		$this->view->assign('viewVideo',$viewVideo);	
		
		//SET LANGUAGE
		$lang2 = $_GET['lang'];
		if ($lang2 == 'en'){$lang3 ='1';}
		elseif ($lang2 == 'id') {$lang3 = '0';}
		elseif ($lang2 == 'uz') {$lang3 = '2';}
		else{echo $lang3 = '';}

		session_start();
    	$_SESSION['lang'] = $lang3;
    	
		$lang = $_SESSION['lang'];
		if($lang == '0' || $lang == ''){require_once('lang/id.php');}
		elseif ($lang == '1') {require_once('lang/eng.php');}
		elseif ($lang ==  '2') {require_once('lang/uzbek.php');}
		$this->view->assign('language',$LANG);
		
		return $this->loadView('viewVideo');
    }
}

?>
