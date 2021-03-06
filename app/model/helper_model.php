<?php

class helper_model extends Database {
	
	var $user = null;
    var $prefix = "uzbemb";
	function __construct()
	{
		$session = new Session;
		$getSessi = $session->get_session();
		$this->user = $getSessi['login'];

	}

    /**
    ** Get menu content
    ** @param $position = id of position to be shown
    ** @return 0 = top menu, 1 = left menu
    ** @param $is_child = child validation id
    ** @return 0 = parent, 1 = child
    **/
    function getMenu($position, $is_child){
        $sql = "SELECT * FROM {$this->prefix}_menu_list WHERE pos = $position AND is_child = $is_child AND n_stats=1;";
        $res = $this->fetch($sql,1);

        if ($res) return $res;
        return false;
    }
    
    /**
	** Get newest book
	**/
	function getNewestBook(){
		$sql = "SELECT * FROM {$this->prefix}_repo WHERE gallerytype=0 AND status=1 ORDER BY created_date DESC LIMIT 2;";
		//pr($sql);exit;
		$res = $this->fetch($sql,1);
		if ($res) return $res;
		return false;
	}
    
    function getNews($id=false, $categoryid=1, $type=1, $start=0, $limit=5)
    {
        
        $filter = "";
        if ($id) $filter = " AND id = {$id} ";

        $sql = "SELECT * FROM {$this->prefix}_news_content WHERE n_status = 1 AND categoryid = {$categoryid}
                AND articleType = {$type} {$filter} LIMIT {$start},{$limit}";
        // pr($sql);
        $res = $this->fetch($sql,1);
        
        if ($res){

            foreach ($res as $key => $value) {
                
                $newData[$key]['title'] = $value['title'];
                $newData[$key]['start'] = date('Y-m-d', strtotime($value['posted_date']));
                $newData[$key]['end'] = date('Y-m-d', strtotime($value['expired_date']));
            }

            //print_r($newData);
            return $newData;  
        } 
        return false;
    }
    
    function getBrief($start=0, $limit=10)
    {
        
        $filter = "";
        if ($id) $filter = " AND id = {$id} ";

        $sql = "SELECT * FROM {$this->prefix}_news_content WHERE n_status = 1 AND ticker_status = 1 ORDER BY created_date DESC LIMIT {$start},{$limit}";
        //print_r($sql);
        $res = $this->fetch($sql,1);
        if ($res){

            foreach ($res as $key => $value) {
                
                $newData[$key]['brief_bhs'] = $value['brief_bhs'];
                $newData[$key]['brief_en'] = $value['brief_en'];
                $newData[$key]['brief_uzbek'] = $value['brief_uzbek'];
                
            }

            //print_r($newData[0]['brief_en']);
            return $newData;  
        } 
        return false;
    }
    
    function logActivity($action='surf', $comment=null)
    {
    	$sql = "SELECT id FROM code_activity WHERE activityValue = '{$action}' LIMIT 1 ";
    	$res = $this->fetch($sql,0,1);
    	if ($res){

    		$date = date('Y-m-d H:i:s'); 
    		$source = $_SERVER['REMOTE_ADDR'];
    		$comment = htmlentities($comment, ENT_QUOTES);
    		
    		$ins = "INSERT INTO code_activity_log (userid, activityId, activityDesc, source, datetimes, n_status)
    				VALUES ({$this->user['id']}, {$res['id']}, '{$comment}', '{$source}', '{$date}',1)";
    		$result = $this->query($ins,1);

    		if ($result) return true;
    		return false;
    	}

    	return false;
    }
}
?>
