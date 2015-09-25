<?php
/*Query Database*/
class mtopicalmenu extends Database {
	
	var $prefix = "uzbemb";
	function menu_inp($data)
	{
		
		$date = date('Y-m-d H:i:s');
		$datetime = array();
        
		if(!empty($data['dateCreate'])) $data['dateCreate'] = date("Y-m-d H:i:s",strtotime($data['dateCreate']));
        
        //data action di input di controller? Hard code. 
	//klo gak ada id -> insert, klo id ada -> update yang else. 
// 	menu_type : ARTICLE, GALLERY
// 	MENU_STAT : PARENT, CHILD
// 	ID_PARENT : ID MENU PARENT
        
        $data['mnameBahasa'] = mysql_escape_string($data['mnameBahasa']);
        $data['mnameEng'] = mysql_escape_string($data['mnameEng']);
        $data['nm_uzbek'] = mysql_escape_string($data['nm_uzbek']);
        
		if($data['action'] == 'insert'){
			
			$query = "INSERT INTO  
						{$this->prefix}_menu_list (nm_bhs, nm_eng, nm_uzbek, menu_type, pos, is_child, id_parent, date_created, n_stats)
					VALUES
						('".$data['mnameBahasa']."','".$data['mnameEng']."','".$data['nm_uzbek']."','".$data['menuType']."'
                        ,'".$data['pos']."','".$data['menuStat']."','".$data['menuParent']."','".$data['dateCreate']."'
                        ,'".$data['n_stats']."')";

		} // kondisi untuk update.
		else {

			$query = "UPDATE {$this->prefix}_menu_list
						SET 
							nm_bhs = '".$data['mnameBahasa']."',
							nm_eng = '".$data['mnameEng']."',
							nm_uzbek = '".$data['nm_uzbek']."',
							menu_type = '{$data['menuType']}',
							pos = '{$data['pos']}',
                            is_child = '{$data['menuStat']}',
							id_parent = '{$data['menuParent']}',
                            date_created = '{$data['dateCreate']}',
                            n_stats = '{$data['n_stats']}'
						WHERE
							id = '{$data['id']}'";
		}
        
		$result = $this->query($query);
		
		return $result;
	}
	//n_stat : status menu itu udah di delete atau belum, klo 1 udah di delete -> masuk ke trash
	function get_menu()
	{
 		$query = "SELECT * FROM {$this->prefix}_menu_list WHERE n_stats != 2 AND pos=2 ORDER BY date_created DESC";
 		
 		$result = $this->fetch($query,1);
 
 		foreach ($result as $key => $value) {
//   			$query = "SELECT username FROM admin_member WHERE id={$value['authorid']} LIMIT 1";
//  
//  			$username = $this->fetch($query,0);
//  
//  			$result[$key]['username'] = $username['username'];
 		}
 		
 		return $result;
	}
    
    function get_child($id)
	{
 		$query = "SELECT * FROM {$this->prefix}_menu_list WHERE id_parent = '{$id}' ORDER BY date_created DESC";
 		
 		$result = $this->fetch($query,1);
 		
 		return $result;
	}
    
    function get_parent($id)
	{
 		$query = "SELECT * FROM {$this->prefix}_menu_list WHERE id = '{$id}'";
 		
 		$result = $this->fetch($query);
 		
 		return $result;
	}
    
    function get_content($id)
	{
 		$query = "SELECT * FROM {$this->prefix}_news_content WHERE menuId = '{$id}' ORDER BY created_date DESC";
 		
 		$result = $this->fetch($query,1);
 		
 		return $result;
	}
    
    function get_menu_filter($menuType=null,$articletype=null,$type=1)
	{
		$query = "SELECT * FROM {$this->prefix}_menu_list WHERE stats = '1' AND menu_type = '{$menuType}' AND articleType = '{$articletype}' OR stats = '0' AND menu_type = '{$menuType}' AND articleType = '{$articletype}' ORDER BY created_date DESC";
		
		$result = $this->fetch($query,0);
        
        if($result){
    		$query = "SELECT username FROM admin_member WHERE id={$result['authorid']} LIMIT 1";
    
    		$username = $this->fetch($query,0);
    
    		$result['username'] = $username['username'];
		}
		return $result;
	}
	
	function get_menu_trash($categoryid=null)
	{
		$query = "SELECT * FROM {$this->prefix}_menu_list WHERE n_status = '2' AND categoryid = '{$categoryid}' ORDER BY created_date DESC";
		
		$result = $this->fetch($query,1);

		foreach ($result as $key => $value) {
			$query = "SELECT username FROM admin_member WHERE id={$value['authorid']} LIMIT 1";

			$username = $this->fetch($query,0);

			$result[$key]['username'] = $username['username'];
		}
		
		return $result;
	}
	
	function menu_del($id, $action)
	{
		foreach ($id as $key => $value) {
			
			
            if($action == 'delete'){
                $query = "DELETE FROM {$this->prefix}_menu_list WHERE id = '{$value}'";
            }else{
                $query = "UPDATE {$this->prefix}_menu_list SET n_status = '2' WHERE id = '{$value}'";
            }
		
			$result = $this->query($query);
		
		}

		return true;
		
	}
	
	function menu_restore($id)
	{
		foreach ($id as $key => $value) {
			
			$query = "UPDATE {$this->prefix}_menu_list SET stats = '0' WHERE id = '{$value}'";
		
			$result = $this->query($query);
		
		}

		return true;
		
	}
	
	function get_menu_id($data)
	{
		$query = "SELECT * FROM {$this->prefix}_menu_list WHERE id= {$data} LIMIT 1";
		
		$result = $this->fetch($query,0);

		//if($result['posted_date'] != '') $result['posted_date'] = dateFormat($result['posted_date'],'dd-mm-yyyy');
		($result['stats'] == 1) ? $result['stats'] = 'checked' : $result['stats'] = '';

		return $result;
	}

}
?>