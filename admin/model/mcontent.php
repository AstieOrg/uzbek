<?php
class mcontent extends Database {
	
	var $prefix = "uzbemb";
	function content_inp($data)
	{
		
		$date = date('Y-m-d H:i:s');
		$datetime = array();
        
        if($data['n_status']=='on') $data['n_status'] = 1;
        
		if(!empty($data['postdate'])) $data['postdate'] = date("Y-m-d H:i:s",strtotime($data['postdate']));
        //if(!empty($data['expired_date'])) $data['expired_date'] = date("Y-m-d H:i:s",strtotime($data['expired_date']));
        
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
			
			//yang atas nama variabel @ db.
			$query = "INSERT INTO  
			  
						{$this->prefix}_news_content (
                                title_bhs,brief_bhs,content_bhs,
                                title_en,brief_en,content_en,
                                title_uzbek,brief_uzbek,content_uzbek,
                                menuId,parentid,image,file,categoryid,articletype,
                                created_date,posted_date,expired_date,authorid,n_status,
                                document_file,document_filename,
                                document_cover,document_covername)
					VALUES
						('".$data['title_bhs']."','".$data['brief_bhs']."','".$data['content_bhs']."'
                        ,'".$data['title_en']."','".$data['brief_en']."','".$data['content_en']."'
                        ,'".$data['title_uzbek']."','".$data['brief_uzbek']."','".$data['content_uzbek']."'
                        ,'".$data['menuId']."','".$data['parentMenu']."','".$data['image']."'
                        ,'".$data['image_url']."','".$data['categoryid']."','".$data['articletype']."','".$date."'
                        ,'".$data['postdate']."','".$data['expired_date']."','".$data['authorid']."','".$data['n_status']."'
                        ,'".$data['document_file']."','".$data['document_filename']."'
                        ,'".$data['document_cover']."','".$data['document_covername']."')";
                        //yang bawah itu nama db @ website
                        //pr($query);exit;

		} else {
			$query = "UPDATE {$this->prefix}_news_content
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
							
							menuId       = '{$data['menuId']}',
							parentid     = '{$data['parentMenu']}',
							image        = '{$data['image']}',
                            file         = '{$data['image_url']}',
							categoryid   = '{$data['categoryid']}',
							articletype  = '{$data['articletype']}',
                            posted_date  = '{$data['postdate']}',
                            expired_date = '{$data['expired_date']}',
                            authorid     = '{$data['authorid']}',
                            
                            document_file = '{$data['document_file']}',
                            document_filename = '{$data['document_filename']}',
                            document_cover = '{$data['document_cover']}',
                            document_covername = '{$data['document_covername']}'
                            
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