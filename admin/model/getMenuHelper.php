<?php

class getMenuHelper extends Database {
	var $prefix = "api";
    function __construct()
    {
        global $basedomain;
        $this->loadmodule();
    }
    
    function loadmodule()
    {
       
    }

	function getMenuData()
	{
		$sql = "SELECT * FROM {$this->prefix}_menu_list";
		$res = $this->fetch($sql, 1);
		if ($res) return $res;
		return false;
	}
	
}
?>