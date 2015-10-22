<?php
class contentHelper extends Database {
	
	var $prefix = "uzbemb";
	var $salt = "";
	function __construct()
	{
		// $this->db = new Database;
		$this->salt = "ovancop1234";
		$this->token = str_shuffle('cmsaj23y4ywdni237yeisa');
		$this->date = date('Y-m-d H:i:s');
	}

	/**
	** Get title of content to be shown
	** @param $id = id of content to be shown
	**/
    function getTitle($id){
        $sql = "SELECT * FROM {$this->prefix}_menu_list WHERE id = $id;";
        $res = $this->fetch($sql,1);

        if ($res) return $res;
        return false;
    }

    /**
	** Get content to be shown
	** @param $lang = language id
	** @param 0 = indonesia, 1 = english, 2 = uzbekistan
	** @param $menu = id of content to be shown
	** @param $start = query limit start number
	** @param $limit = query limit end number
	**/
	function getNews($lang=0, $menu=1, $start=0, $limit=5)
	{
		
		$langID = "0";
		if ($lang) $langID = "{$lang} ";

		$sql = "SELECT * FROM {$this->prefix}_news_content WHERE menuId = {$menu} AND n_status = '1' $filter ORDER BY id DESC LIMIT {$start},{$limit}";
		//pr($sql);exit;
		$res = $this->fetch($sql,1);
		if ($res) return $res;
		return false;
	}

	/**
	** Get content with news menu
	** @param $title = news title from Config
	**/
	function getNewsID($title)
	{
		
		$sql = "SELECT `id` FROM {$this->prefix}_menu_list WHERE nm_eng = '".$title."'";
		//pr($sql);exit;
		$res = $this->fetch($sql,1);
		if ($res) return $res;
		return false;
	}

	/**
	** Get content of list menu content to be shown
	** @param $lang = language id
	** @param 0 = indonesia, 1 = english, 2 = uzbekistan
	** @param $menu = id of content to be shown
	** @param $start = query limit start number
	** @param $limit = query limit end number
	**/
	function getNewsListDetail($lang=0, $id=1, $start=0, $limit=5)
	{
		
		$langID = "0";
		if ($lang) $langID = "{$lang} ";

		$sql = "SELECT * FROM {$this->prefix}_news_content WHERE id = {$id} $filter LIMIT {$start},{$limit}";
		//pr($sql);exit;
		$res = $this->fetch($sql,1);
		if ($res) return $res;
		return false;
	}

	/**
	** Get headlines content
	**/
	function getHeadlines(){
		$sql = "SELECT * FROM {$this->prefix}_headlines;";
		//pr($sql);exit;
		$res = $this->fetch($sql,1);
		if ($res) return $res;
		return false;
	}

	/**
	** Get banner content
	**/
	function getBanner(){
		$sql = "SELECT * FROM {$this->prefix}_banner;";
		//pr($sql);exit;
		$res = $this->fetch($sql,1);
		if ($res) return $res;
		return false;
	}

	/**
	** Get newest photo content
	**/
	function getNewestPhoto(){
		$sql = "SELECT * FROM {$this->prefix}_news_content WHERE categoryid=9 AND n_status=1 ORDER BY id DESC LIMIT 5;";
		//pr($sql);exit;
		$res = $this->fetch($sql,1);
		if ($res) return $res;
		return false;
	}

	/**
	** Get newest video content
	**/
	function getNewestVideo(){
		$sql = "SELECT * FROM {$this->prefix}_video ORDER BY id DESC LIMIT 2;";
		//pr($sql);exit;
		$res = $this->fetch($sql,1);
		if ($res) return $res;
		return false;
	}

	/**
	** Get album content
	**/
	function getAlbum(){
		$sql = "SELECT * FROM {$this->prefix}_news_content WHERE categoryid = 9 AND n_status=1";
		//pr($sql);exit;
		$res = $this->fetch($sql,1);
		if ($res) return $res;
		return false;
	}

	/**
	** Get Title of album
	** @param $id = id of content to be shown
	**/
	function titleAlbum($id){
		$sql = "SELECT * FROM {$this->prefix}_news_content WHERE id = {$id}";
		//pr($sql);exit;
		$res = $this->fetch($sql,1);
		if ($res) return $res;
		return false;
	}

	/**
	** Get detail of album
	** @param $id = id of content to be shown
	**/
	function viewAlbum($id){
		$sql = "SELECT * FROM {$this->prefix}_news_content_repo WHERE otherid = {$id}";
		//pr($sql);exit;
		$res = $this->fetch($sql,1);
		if ($res) return $res;
		return false;
	}

	/**
	** Get video content
	**/
	function getVideo(){
		$sql = "SELECT * FROM {$this->prefix}_video";
		//pr($sql);exit;
		$res = $this->fetch($sql,1);
		if ($res) return $res;
		return false;
	}

	/**
	** Get detail of video
	** @param $id = id of content to be shown
	**/
	function viewVideo($id){
		$sql = "SELECT * FROM {$this->prefix}_video WHERE id = {$id}";
		//pr($sql);exit;
		$res = $this->fetch($sql,1);
		if ($res) return $res;
		return false;
	}

	/**
	** Get contact content
	**/
	function getContactContent(){
		$sql = "SELECT * FROM {$this->prefix}_contactus;";
		//pr($sql);exit;
		$res = $this->fetch($sql,1);
		if ($res) return $res;
		return false;
	}

	/**
	** Send message query
	** @todo Insert posted data into database
	** @param $table = name of table to be processed
	** @param $data = posted data
	**/
    function sendMsg($table,$data){
        $sql = "INSERT INTO `{$table}` (`id`, `name`, `mail`, `address`, `subject`, `message`, `n_stats`, `date_received`) VALUES ('', '{$data['name']}', '{$data['mail']}', '{$data['address']}', '{$data['subject']}', '{$data['message']}', '', CURRENT_TIMESTAMP);";
        //pr($sql);exit;
        $res = $this->query($sql);  
        if ($res) return true;
        return false;
    }
}
?>