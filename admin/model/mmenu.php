<?php
/*Query Database*/
class mmenu extends Database {
	
	var $prefix = "api";
	function menu_inp($data)
	{
		
		$date = date('Y-m-d H:i:s');
		$datetime = array();
        
		if(!empty($data['dateCreate'])) $data['dateCreate'] = date("Y-m-d H:i:s",strtotime($data['dateCreate']));
        //if(!empty($data['expired_date'])) $data['expired_date'] = date("Y-m-d H:i:s",strtotime($data['expired_date']));
        
        //data action di input di controller? Hard code. 
	//klo gak ada id -> insert, klo id ada -> update yang else. 
// 	menu_type : ARTICLE, GALLERY
// 	MENU_STAT : PARENT, CHILD
// 	ID_PARENT : ID MENU PARENT
	
		if($data['action'] == 'insert'){
			
			$query = "INSERT INTO  
						{$this->prefix}_menu_list (nm_bhs, nm_eng, nm_rus, menu_type, pos, menu_stat, id_parent, date_created,
						stats)
					VALUES
						('".$data['mnameBahasa']."','".$data['mnameEng']."','".$data['mnameRus']."','".$data['menuType']."'
                        ,'".$data['menuPos']."','".$data['menuStat']."','".$data['menuParent']."','".$data['dateCreate']."','".$data['stats']."')";
                        //pr($query);exit;

		} // kondisi untuk update.
		else {
		if($data['menuType']=='1' && $data['menuType']=='2') $date = $data['dateCreate'];
			$query = "UPDATE {$this->prefix}_menu_list
						SET 
							title = '{$data['title']}',
							brief = '{$data['brief']}',
							content = '{$data['content']}',
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
 //pr($query);exit;
		$result = $this->query($query);
		
		return $result;
	}
	//n_stat : status menu itu udah di delete atau belum, klo 1 udah di delete -> masuk ke trash
	function get_menu($n_stats=null)
	{
 		$query = "SELECT * FROM {$this->prefix}_menu_list WHERE n_stats = '{$n_stats}' ORDER BY date_created DESC";
 		
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
	
	function get_menu_slide()
	{
		$query = "SELECT nc.*, cc.category, ct.type FROM cdc_news_content nc LEFT JOIN cdc_news_content_category cc 
					ON nc.categoryid = cc.id LEFT JOIN cdc_news_content_type ct ON nc.articletype = ct.id 
					WHERE nc.n_status < 2 AND nc.articletype > 0  ORDER BY nc.createdate DESC";
		
		$result = $this->fetch($query,1);
		
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
	
	function menu_del($id)
	{
		foreach ($id as $key => $value) {
			
			$query = "UPDATE {$this->prefix}_menu_list SET stats = '2' WHERE id = '{$value}'";
		
			$result = $this->query($query);
		
		}

		return true;
		
	}
	
	function menu_delpermanent($id)
	{
		$query = "DELETE FROM cdc_news_content WHERE id = '{$id}'";
		
		$result = $this->query($query);
		
		return $result;
		
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
	
	function frame_inp($data){

		foreach ($data[0] as $key => $val) {
			$tmpfield[] = $key;
			$tmpvalue[] = "'$val'";
		}

		$field = implode(',', $tmpfield);
		$value = implode(',', $tmpvalue);

		$query = "INSERT INTO {$this->prefix}_news_content_repo ({$field}) VALUES ($value)";

		$result = $this->query($query);

		$queryid = "SELECT id FROM {$this->prefix}_news_content_repo ORDER BY created_date DESC LIMIT 1";

		$id = $this->fetch($queryid,0);

		$data[1]['otherid'] = $id['id'];

		foreach ($data[1] as $key => $val) {
			$tmpfield2[] = $key;
			$tmpvalue2[] = "'$val'";
		}

		$field2 = implode(',', $tmpfield2);
		$value2 = implode(',', $tmpvalue2);

		$query2= "INSERT INTO {$this->prefix}_news_content_repo ({$field2}) VALUES ($value2)";

		$result = $this->query($query2);
		return true;
	}

	function get_frameList(){

		global $CONFIG;

		$query = "SELECT * FROM {$this->prefix}_news_content_repo WHERE gallerytype = 1 AND n_status = 1 ORDER BY created_date DESC";

		$result = $this->fetch($query,1);

		foreach ($result as $key => $val) {
			$query = "SELECT * FROM {$this->prefix}_news_content_repo WHERE gallerytype = 2 AND n_status = 1 AND otherid = {$val['id']} LIMIT 1";
			$res = $this->fetch($query,0);
			$result[$key]['cover'] = $res['files'];
			$result[$key]['covername'] = $res['title'];

			//typealbum
			if($val['typealbum'] == 4){
				$result[$key]['typealbum'] = 'Facebook';
			} elseif ($val['typealbum'] == 5) {
				$result[$key]['typealbum'] = 'Twitter';
			}
			
			//dimension
			list($result[$key]['frWidth'], $result[$key]['frHeight'], $type, $attr) = @getimagesize($CONFIG['admin']['upload_path']."frame/".$result[$key]['files']);
			list($result[$key]['covWidth'], $result[$key]['covHeight'], $type, $attr) = @getimagesize($CONFIG['admin']['upload_path']."cover/".$res['files']);
		}

		return $result;
	}

	function updateStatusFrame($id=false,$n_status=0)
	{
		if (!$id) return false;


		$query2= "UPDATE {$this->prefix}_news_content_repo SET n_status = {$n_status} WHERE id = {$id} LIMIT 1";

		$result = $this->query($query2);
		if ($result) return true;
		return false;

	}
}
?>