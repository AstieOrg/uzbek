<?php
class mbook extends Database {
	
    var $prefix = "uzbemb";
    /**
     * @todo insert a record to database
     * 
     * @param $table = table name
     * @param $data = array data to insert
     * @param $db2 = boolean using second database or not
     * 
     * @return lastid = id of inserted data
     * @return status = boolean status of data
     * 
     * */
	function insertData($table=false, $data=array(), $db2=false)
	{
        global $CONFIG, $basedomain;
		if (!$table and empty($data)) return false;

		$return = array();
		$return['status'] = false;
        
        if(!empty($data['created_date'])) $data['created_date'] = date("Y-m-d H:i:s",strtotime($data['created_date']));
        if(!empty($data['expired_date'])) $data['expired_date'] = date("Y-m-d H:i:s",strtotime($data['expired_date']));
		
		foreach ($data as $key=>$val){
            if(!empty($val)){
                
                $sanitize = str_replace(array('\'', '"'), '', $val);
                
                $tmpfield[] = "`$key`";
                $tmpvalue[] = "'{$sanitize}'";
            }
		}
		
		$field = implode (',',$tmpfield);
		$value = implode (',',$tmpvalue);
		
		$sql = "INSERT INTO {$this->prefix}_{$table} ({$field}) VALUES ({$value})";
        
        if($db2){
            $res = $this->query($sql,1);
        }else{
            $res = $this->query($sql);
        }
        
		if ($res){
			$return['lastid'] = $this->insert_id();
			$return['status'] = true;
		}
		return $return;
	}
    
    function bookInp($table,$data)
	{
		
		$date = date('Y-m-d H:i:s');
		$datetime = array();
        
		if(!empty($data['created_date'])) $data['created_date'] = date("Y-m-d H:i:s",strtotime($data['created_date']));
        if(!empty($data['expired_date'])) $data['expired_date'] = date("Y-m-d H:i:s",strtotime($data['expired_date']));
        else $data['expired_date'] = '0000-00-00';
        
        $data['title'] = addslashes($data['title']);
        $data['brief'] = addslashes($data['brief']);
        $data['category'] = addslashes($data['category']);

		if($data['action'] == 'insert'){
			
			$query = "INSERT INTO  
						{$this->prefix}_{$table} (
                            title, category, brief,
                            authorid, gallerytype, realname,
                            created_date, status, files,
                            filename, content
                        )
					VALUES
						('".$data['title']."','".$data['category']."','".$data['brief']."'
                        ,'".$data['authorid']."','".$data['gallerytype']."','".$data['realname']."'
                        ,'".$data['created_date']."','".$data['status']."','".$data['files']."'
                        ,'".$data['filename']."','".$data['content']."')";
                        //pr($query);exit;

		} else {
			$query = "UPDATE {$this->prefix}_{$table}
						SET 
							title = '{$data['title']}',
							brief = '{$data['brief']}',
							content = '{$data['content']}',
                            
							category = '{$data['category']}',
                            authorid = '{$data['authorid']}',
							files = '{$data['files']}',
                            filename = '{$data['filename']}',
                            realname = '{$data['realname']}',
                            
                            gallerytype = '{$data['gallerytype']}',
                            created_date = '{$data['created_date']}',
							status = {$data['status']}
						WHERE
							id = '{$data['id']}'";

            //pr($query);exit;
		}
		$result = $this->query($query);
		
		return $result;
	}
    
    function get_book($status=null)
	{
		$query = "SELECT * FROM {$this->prefix}_repo WHERE status != '2' ORDER BY created_date DESC";
		
		$result = $this->fetch($query,1);
        
 		foreach ($result as $key => $value) {
 			$query = "SELECT username FROM admin_member WHERE id={$value['authorid']} LIMIT 1";
 
 			$username = $this->fetch($query,0);
 
 			$result[$key]['username'] = $username['username'];
 		}
		
		return $result;
	}
    
    function get_book_id($id)
	{
		$query = "SELECT * FROM {$this->prefix}_repo WHERE id= {$id}";
		
		$result = $this->fetch($query,0);

		//if($result['posted_date'] != '') $result['posted_date'] = dateFormat($result['posted_date'],'dd-mm-yyyy');
		($result['status'] == 1) ? $result['status'] = 'checked' : $result['status'] = '';

		return $result;
	}
}
?>