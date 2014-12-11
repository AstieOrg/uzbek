<?php
class mkepakaran extends Database {
	
	var $prefix = "uzbemb";
	function category_inp($data)
	{
		
		$date = date('Y-m-d H:i:s');
		$datetime = array();
		
		if(!empty($data['postdate'])) $data['postdate'] = date("Y-m-d",strtotime($data['postdate'])); 

		if($data['action'] == 'insert'){
			
			$query = "INSERT INTO  
						{$this->prefix}_category (category_name,description,image,create_date,n_status)
					VALUES
						('".$data['category_name']."','".$data['description']."','".$data['image']."','".$date."','".$data['n_status']."')";

		} else {
			$query = "UPDATE {$this->prefix}_news_content
						SET 
							category_name = '{$data['category_name']}',
							description = '{$data['description']}',
							image = '{$data['image']}',
							create_date = '".$date."',
							authorid = '{$data['authorid']}',
							n_status = {$data['n_status']}
						WHERE
							id = '{$data['id']}'";
		}
// pr($query);
		$result = $this->query($query);
		
		return $result;
	}
	
	function get_category($type=1)
	{
		$query = "SELECT * FROM {$this->prefix}_category WHERE n_status = '1' OR n_status = '0' ORDER BY create_date DESC";
		
		$result = $this->fetch($query,1);

		foreach ($result as $key => $value) {
			$query = "SELECT username FROM admin_member WHERE id=1 LIMIT 1";
			// $query = "SELECT username FROM admin_member WHERE id={$value['authorid']} LIMIT 1";

			$username = $this->fetch($query,0);

			$result[$key]['username'] = $username['username'];
		}
		
		return $result;
	}
	
	function get_category_trash()
	{
		$query = "SELECT * FROM {$this->prefix}_category WHERE n_status = '2' ORDER BY create_date DESC";
		
		$result = $this->fetch($query,1);

		foreach ($result as $key => $value) {
			$query = "SELECT username FROM admin_member WHERE id=1 LIMIT 1";

			$username = $this->fetch($query,0);

			$result[$key]['username'] = $username['username'];
		}
		
		return $result;
	}
	
	function category_del($id)
	{
		foreach ($id as $key => $value) {
			
			$query = "UPDATE {$this->prefix}_category SET n_status = '2' WHERE id = '{$value}'";
		
			$result = $this->query($query);
		
		}

		return true;
		
	}
	
	function article_restore($id)
	{
		foreach ($id as $key => $value) {
			
			$query = "UPDATE {$this->prefix}_news_content SET n_status = '0' WHERE id = '{$value}'";
		
			$result = $this->query($query);
		
		}

		return true;
		
	}
	
	function get_category_id($data)
	{	
		$query = "SELECT * FROM {$this->prefix}_category WHERE id= {$data} LIMIT 1";
		// pr("ada");exit;
		$result = $this->fetch($query,0);

		if($result['posted_date'] != '') $result['posted_date'] = dateFormat($result['posted_date'],'dd-mm-yyyy');
		($result['n_status'] == 1) ? $result['n_status'] = 'checked' : $result['n_status'] = '';

		return $result;
	}

}
?>