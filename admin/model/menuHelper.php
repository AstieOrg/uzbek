<?php
class menuHelper extends Database {
	
	
	function getMenu($id=false)
	{
		$query = "SELECT * FROM {$this->prefix}_menu_list WHERE n_status = '1' AND menuId = '{$menuId}' OR n_status = '0' AND menuId = '{$menuId}' ORDER BY created_date DESC";
		
		$result = $this->fetch($query,1);
		
		return $result;
		
	}
	
}
?>