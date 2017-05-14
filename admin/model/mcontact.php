<?php
/*Query Database*/
class mcontact extends Database {
	
	var $prefix = "uzbemb";
	function contact_inp($data)
	{
		
		$date = date('Y-m-d H:i:s');
		$datetime = array();
        
		if(!empty($data['dateReceived'])) $data['dateReceived'] = date("Y-m-d H:i:s",strtotime($data['dateReceived']));
        //if(!empty($data['expired_date'])) $data['expired_date'] = date("Y-m-d H:i:s",strtotime($data['expired_date']));
        
        // 	menu_type : ARTICLE, GALLERY
        // 	MENU_STAT : PARENT, CHILD
        // 	ID_PARENT : ID MENU PARENT
    	
        $data['title'] = mysql_escape_string($data['title']);
        $data['brief'] = mysql_escape_string($data['brief']);
        $data['content'] = mysql_escape_string($data['content']);
        
		if($data['action'] == 'insert'){
			
			$query = "INSERT INTO  
						{$this->prefix}_contact_list (name, mail, tel, subject, message)
					VALUES
						('".$data['mnameBahasa']."','".$data['mnameEng']."','".$data['mnameRus']."','".$data['menuType']."'
                        ,'".$data['menuPos']."','".$data['menuStat']."','".$data['menuParent']."','".$data['dateCreate']."','".$data['stats']."')";
                        

		}
		else {
		if($data['menuType']=='1' && $data['menuType']=='2') $date = $data['dateCreate'];
			$query = "UPDATE {$this->prefix}_menu_list
						SET 
							title = '".$data['title']."',
							brief = '".$data['brief']."',
							content = '".$data['content']."',
							image = '{$data['image']}',
							file = '{$data['image_url']}',
                            articletype = '{$data['articletype']}',
							posted_date = '".$date."',
                            expired_date = '{$data['expired_date']}',
							authorid = '{$data['authorid']}',
							n_status = {$data['n_status']}
						WHERE
							id = '{$data['id']}'";
		}
        
		$result = $this->query($query);
		
		return $result;
	}
	//n_stat : status menu itu udah di delete atau belum, klo 1 udah di delete -> masuk ke trash
	function get_contact($condition,$n_stats)
	{
		if($condition){
 			$query = "SELECT * FROM {$this->prefix}_contact_list WHERE n_stats = '{$n_stats}' ORDER BY date_received DESC";
 		}
 		else{
 			$query = "SELECT * FROM {$this->prefix}_contact_list ORDER BY date_received DESC";
 		}
 		$result = $this->fetch($query,1);
 		
 		return $result;
	}
    
    function read_msg($id){
    	$query = "UPDATE {$this->prefix}_contact_list SET n_stats = '1' WHERE id = $id;";
    	$result = $this->query($query);
    	return true;
    }

    function get_single_msg($id){
    	$query = "SELECT * FROM {$this->prefix}_contact_list WHERE id = $id";
    	$result = $this->fetch($query,1);
    	return $result;
    }
    
    function contact_del($id, $action)
	{
		foreach ($id as $key => $value) {
			
			
            if($action == 'delete'){
                $query = "DELETE FROM {$this->prefix}_contact_list WHERE id = '{$value}'";
            }else{
                $query = "UPDATE {$this->prefix}_contact_list SET n_status = '2' WHERE id = '{$value}'";
            }
		
			$result = $this->query($query);
		
		}

		return true;
		
	}
}
?>