<?php

class getMenuHelper extends Database {
	var $prefix = "uzbemb";
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
    
    function getMenuParent($pos=FALSE)
	{
        if($pos){
            $sql = "SELECT * FROM {$this->prefix}_menu_list WHERE is_child=0 AND pos={$pos}";
        }else{
            $sql = "SELECT * FROM {$this->prefix}_menu_list WHERE is_child=0";
        }
		
		$res = $this->fetch($sql, 1);
		if ($res) return $res;
		return false;
	}
    
    function getMenuId($id){
        $sql = "SELECT * FROM {$this->prefix}_menu_list WHERE id='{$id}'";
		$res = $this->fetch($sql, 0);
		if ($res) return $res;
		return false;
    }
    
    function getChild($id)
	{
 		$sql = "SELECT * FROM {$this->prefix}_menu_list WHERE id_parent = '{$id}'";
 		
 		$res = $this->fetch($sql,1);
        
 		if ($res) return $res;
		return false;
	}
	
}
?>