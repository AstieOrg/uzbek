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

    function getMenu($position, $is_child){
        $sql = "SELECT * FROM {$this->prefix}_menu_list WHERE pos = $position AND is_child = $is_child AND n_stats=1;";
        $res = $this->fetch($sql,1);

        if ($res) return $res;
        return false;
    }

    function getTitle($id){
        $sql = "SELECT * FROM {$this->prefix}_menu_list WHERE id = $id;";
        $res = $this->fetch($sql,1);

        if ($res) return $res;
        return false;
    }

	function getNews($lang=0, $menu=1, $start=0, $limit=5)
	{
		
		$langID = "0";
		if ($lang) $langID = "{$lang} ";

		$sql = "SELECT * FROM {$this->prefix}_news_content WHERE lang_id = {$langID} AND menuId = {$menu} $filter LIMIT {$start},{$limit}";
		//pr($sql);exit;
		$res = $this->fetch($sql,1);
		if ($res) return $res;
		return false;
	}

    function sendMsg($table,$data){
        $sql = "INSERT INTO `{$table}` (`id`, `name`, `mail`, `address`, `subject`, `message`, `n_stats`, `date_received`) VALUES ('', '{$data['name']}', '{$data['mail']}', '{$data['address']}', '{$data['subject']}', '{$data['message']}', '', CURRENT_TIMESTAMP);";
        //pr($sql);exit;
        $res = $this->query($sql);  
        if ($res) return true;
        return false;
    }
}
?>