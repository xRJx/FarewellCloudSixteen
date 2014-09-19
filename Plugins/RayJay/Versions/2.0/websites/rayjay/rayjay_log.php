<?php
	if ($_POST["product"] == NULL || $_POST["key"] == NULL || $_POST["host"] == NULL || $_POST["ip"] == NULL || $_POST["port"] == NULL)
	{
		echo "fgt";
		return;
	}
	else
	{
		
		
		$product = $_POST["product"];
		$key = $_POST["key"];
		
		$host = $_POST["host"];
		$ip = $_POST["ip"];
		$port = $_POST["port"];
		
		$date = date_create();
		$filedate = date_create();
		$filetimestamp = date_format($date, 'Y-m-d');
		$file = "admin/RayJayLog-" . $filetimestamp . ".txt";
		$timestamp = date_format($date, 'U = Y-m-d H:i:s');
		
		$log = "\n" . $timestamp . ": " . $key . " used on " . $ip . ":" . $port . " for " . $product . " (" . $host . ")";
		
		$handle = fopen($file, 'a');
		fwrite($handle, $log);
		fclose($handle);
	}
?>