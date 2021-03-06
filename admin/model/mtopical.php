<?php
class mtopical extends Database {
	
	var $prefix = "uzbemb";
	function topical_inp($data)
	{
		
		$date = date('Y-m-d H:i:s');
		$datetime = array();
        
		if(!empty($data['postdate'])) $data['postdate'] = date("Y-m-d H:i:s",strtotime($data['postdate']));
        if(!empty($data['expired_date'])) $data['expired_date'] = date("Y-m-d H:i:s",strtotime($data['expired_date']));
        
        /*$data['title_bhs'] = mysql_escape_string($data['title_bhs']);
        $data['title_en'] = mysql_escape_string($data['title_en']);
        $data['title_uzbek'] = mysql_escape_string($data['title_uzbek']);
        
        $data['brief_bhs'] = mysql_escape_string($data['brief_bhs']);
        $data['brief_en'] = mysql_escape_string($data['brief_en']);
        $data['brief_uzbek'] = mysql_escape_string($data['brief_uzbek']);
        
        $data['content_bhs'] = mysql_escape_string($data['content_bhs']);
        $data['content_en'] = mysql_escape_string($data['content_en']);
        $data['content_uzbek'] = mysql_escape_string($data['content_uzbek']);*/
        
        $data['title_bhs'] = addslashes($data['title_bhs']);
        $data['title_en'] = addslashes($data['title_en']);
        $data['title_uzbek'] = addslashes($data['title_uzbek']);
        
        $data['brief_bhs'] = addslashes($data['brief_bhs']);
        $data['brief_en'] = addslashes($data['brief_en']);
        $data['brief_uzbek'] = addslashes($data['brief_uzbek']);
        
        $data['content_bhs'] = addslashes($data['content_bhs']);
        $data['content_en'] = addslashes($data['content_en']);
        $data['content_uzbek'] = addslashes($data['content_uzbek']);
        
		if($data['action'] == 'insert'){
			//pr($data);exit;
			//yang atas nama variabel @ db.
			$query = "INSERT INTO  
			  
						{$this->prefix}_topical_issues (
                            icon_image,file_icon,langid,
                            title_bhs,brief_bhs,content_bhs,
                            title_en,brief_en,content_en,
                            title_uzbek,brief_uzbek,content_uzbek,
                            image,file,created_date,
                            posted_date,author_id,n_stats)
					VALUES
						('".$data['icon']."','".$data['icon_url']."','".$data['langID']."'
                        ,'".$data['title_bhs']."','".$data['brief_bhs']."','".$data['content_bhs']."'
                        ,'".$data['title_en']."','".$data['brief_en']."','".$data['content_en']."'
                        ,'".$data['title_uzbek']."','".$data['brief_uzbek']."','".$data['content_uzbek']."'
                        ,'".$data['image']."','".$data['image_url']."','".$date."'
                        ,'".$data['postdate']."','".$data['authorid']."','".$data['n_stats']."')";
                        
                        //pr($query);exit;

		} else {
            if($data['categoryid']=='1' && $data['articletype']=='2') $date = $data['postdate'];
			$query = "UPDATE {$this->prefix}_topical_issues
						SET 
							title_bhs = '".$data['title_bhs']."',
							brief_bhs = '".$data['brief_bhs']."',
							content_bhs = '".$data['content_bhs']."',
                            
                            title_en = '".$data['title_en']."',
							brief_en = '".$data['brief_en']."',
							content_en = '".$data['content_en']."',
                            
                            title_uzbek = '".$data['title_uzbek']."',
							brief_uzbek = '".$data['brief_uzbek']."',
							content_uzbek = '".$data['content_uzbek']."',
                            
							image = '{$data['image']}',
							file = '{$data['image_url']}',
							icon_image = '{$data['icon_image']}',
							file_icon = '{$data['icon_url']}',
							posted_date = '".$date."',
                            expired_date = '{$data['expired_date']}',
							author_id = '{$data['authorid']}',
							n_stats = {$data['n_stats']}
						WHERE
							id = '{$data['id']}'";
		}
// pr($query);
		$result = $this->query($query);
		
		return $result;
	}
	
	function get_topical($n_stats=null)
	{
		$query = "SELECT * FROM {$this->prefix}_topical_issues WHERE n_stats != '2' ORDER BY posted_date DESC";
		
		$result = $this->fetch($query,1);

 		foreach ($result as $key => $value) {
 			$query = "SELECT username FROM admin_member WHERE id={$value['author_id']} LIMIT 1";
 
 			$username = $this->fetch($query,0);
 
 			$result[$key]['username'] = $username['username'];
 		}
		
		return $result;
	}
    
    function get_topical_filter($categoryid=null,$articletype=null,$type=1)
	{
		$query = "SELECT * FROM {$this->prefix}_topical_issues WHERE n_stats = '1' AND categoryid = '{$categoryid}' AND articleType = '{$articletype}' OR n_status = '0' AND categoryid = '{$categoryid}' AND articleType = '{$articletype}' ORDER BY created_date DESC";
		
		$result = $this->fetch($query,0);
        
        if($result){
    		$query = "SELECT username FROM admin_member WHERE id={$result['authorid']} LIMIT 1";
    
    		$username = $this->fetch($query,0);
    
    		$result['username'] = $username['username'];
		}
		return $result;
	}
	
	function get_topical_trash($categoryid=null)
	{
		$query = "SELECT * FROM {$this->prefix}_topical_issues WHERE n_status = '2' AND categoryid = '{$categoryid}' ORDER BY created_date DESC";
		
		$result = $this->fetch($query,1);

		foreach ($result as $key => $value) {
			$query = "SELECT username FROM admin_member WHERE id={$value['authorid']} LIMIT 1";

			$username = $this->fetch($query,0);

			$result[$key]['username'] = $username['username'];
		}
		
		return $result;
	}
	
	function get_topical_id($id)
	{
		$query = "SELECT * FROM {$this->prefix}_topical_issues WHERE id= {$id}";
		
		$result = $this->fetch($query,0);

		//if($result['posted_date'] != '') $result['posted_date'] = dateFormat($result['posted_date'],'dd-mm-yyyy');
		($result['n_status'] == 1) ? $result['n_status'] = 'checked' : $result['n_status'] = '';

		return $result;
	}
    
    function topical_del($id)
	{
		//pr($id);
		foreach ($id as $key => $value) {
			
			$query = "DELETE FROM {$this->prefix}_topical_issues WHERE id = '{$value}'";
		
			$result = $this->query($query);
		
		}

		return true;
		
	}
}
?>