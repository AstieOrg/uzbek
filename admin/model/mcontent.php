<?php
class mcontent extends Database {
	
	var $prefix = "api";
	function content_inp($data)
	{
		
		$date = date('Y-m-d H:i:s');
		$datetime = array();
        
        if($data['n_status']=='on') $data['n_status'] = 1;
        
		if(!empty($data['postdate'])) $data['postdate'] = date("Y-m-d H:i:s",strtotime($data['postdate']));
        //if(!empty($data['expired_date'])) $data['expired_date'] = date("Y-m-d H:i:s",strtotime($data['expired_date']));
        
		if($data['action'] == 'insert'){
			
			//yang atas nama variabel @ db.
			$query = "INSERT INTO  
			  
						{$this->prefix}_news_content (title,lang_id,menuId,parentid,brief,content,image,file,categoryid,articletype,
												created_date,posted_date,expired_date,authorid,n_status)
					VALUES
						('".$data['contentTitle']."','".$data['langID']."','".$data['menuId']."','".$data['parentMenu']."','".$data['brief']."','".$data['content']."','".$data['image']."'
                        ,'".$data['image_url']."','".$data['categoryid']."','".$data['articletype']."','".$date."'
                        ,'".$data['postdate']."','".$data['expired_date']."','".$data['authorid']."','".$data['n_status']."')";
                        //yang bawah itu nama db @ website
                        //pr($query);exit;

		} else {
			$query = "UPDATE {$this->prefix}_news_content
						SET 
							title        = '{$data['contentTitle']}',
							lang_id      = '{$data['langID']}',
							menuId       = '{$data['menuId']}',
							parentid     = '{$data['parentMenu']}',
							brief        = '{$data['brief']}',
                            content      = '{$data['content']}',
							image        = '{$data['image']}',
                            file         = '{$data['image_url']}',
							categoryid   = '{$data['categoryid']}',
							articletype  = '{$data['articletype']}',
                            posted_date  = '{$data['postdate']}',
                            expired_date = '{$data['expired_date']}',
                            authorid     = '{$data['authorid']}'
                            
						WHERE
							id = '{$data['id']}'";
		}
// pr($query);
		$result = $this->query($query);
		
		return $result;
	}
    
    function get_menu($id)
	{
 		$query = "SELECT * FROM {$this->prefix}_menu_list WHERE id = '{$id}'";
 		
 		$result = $this->fetch($query);
 		
 		return $result;
	}
	
	function get_content($menuId=null, $loop=1)
	{
		$query = "SELECT * FROM {$this->prefix}_news_content WHERE n_status = '1' AND menuId = '{$menuId}' OR n_status = '0' AND menuId = '{$menuId}' ORDER BY created_date DESC";
		//pr($query);exit;
		$result = $this->fetch($query,$loop);
        
        if($loop){
     		foreach ($result as $key => $value) {
                if($value['authorid']){
         			$query = "SELECT username FROM admin_member WHERE id={$value['authorid']} LIMIT 1";
         
         			$username = $this->fetch($query,0);
         
         			$result[$key]['username'] = $username['username'];
                }
     		}
        }
		
		return $result;
	}
    
    function get_content_filter($categoryid=null,$articletype=null,$type=1)
	{
		$query = "SELECT * FROM {$this->prefix}_news_content WHERE n_status = '1' AND categoryid = '{$categoryid}' AND articleType = '{$articletype}' OR n_status = '0' AND categoryid = '{$categoryid}' AND articleType = '{$articletype}' ORDER BY created_date DESC";
		
		$result = $this->fetch($query,0);
        
        if($result){
    		$query = "SELECT username FROM admin_member WHERE id={$result['authorid']} LIMIT 1";
    
    		$username = $this->fetch($query,0);
    
    		$result['username'] = $username['username'];
		}
		return $result;
	}
	
	function get_content_trash($categoryid=null)
	{
		$query = "SELECT * FROM {$this->prefix}_news_content WHERE n_status = '2' AND categoryid = '{$categoryid}' ORDER BY created_date DESC";
		
		$result = $this->fetch($query,1);

		foreach ($result as $key => $value) {
			$query = "SELECT username FROM admin_member WHERE id={$value['authorid']} LIMIT 1";

			$username = $this->fetch($query,0);

			$result[$key]['username'] = $username['username'];
		}
		
		return $result;
	}
	
	function content_del($id, $action)
	{
		foreach ($id as $key => $value) {
			
			
            if($action == 'delete'){
                $query = "DELETE FROM {$this->prefix}_news_content WHERE id = '{$value}'";
            }else{
                $query = "UPDATE {$this->prefix}_news_content SET n_status = '2' WHERE id = '{$value}'";
            }
		
			$result = $this->query($query);
		
		}

		return true;
		
	}
	
	function content_restore($id)
	{
		foreach ($id as $key => $value) {
			
			$query = "UPDATE {$this->prefix}_news_content SET n_status = '0' WHERE id = '{$value}'";
		
			$result = $this->query($query);
		
		}

		return true;
		
	}
	
	function get_content_id($menuId)
	{
		$query = "SELECT * FROM {$this->prefix}_news_content WHERE id= {$menuId} LIMIT 1";
		
		$result = $this->fetch($query,0);

		//if($result['posted_date'] != '') $result['posted_date'] = dateFormat($result['posted_date'],'dd-mm-yyyy');
		($result['n_status'] == 1) ? $result['n_status'] = 'checked' : $result['n_status'] = '';

		return $result;
	}
    
    function getheadline(){
        $query = "SELECT * FROM {$this->prefix}_news_content WHERE categoryid = '3'";
		
		$result = $this->fetch($query,0);

		($result['n_status'] == 1) ? $result['n_status'] = 'checked' : $result['n_status'] = '';

		return $result;
    }
}
?>