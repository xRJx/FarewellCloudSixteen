<?php
	if ($_POST["token"] == NULL && $_POST["product"] == NULL && $_POST["version"] == NULL && $_POST["key"] == NULL)
	{
		echo "fgt";
		return;
	}
	else
	{
		if ($_POST["token"] != "139hr879sdfy73")
		{
			echo "print(\"[RayJay] Security breach. Process terminated.\");";
			return;
		}
		else
		{
			$product = $_POST["product"];
			if ($_POST["version"] != "1.0")
			{
				echo "print([RayJay] The " . $product . " product could not be loaded. RayJay update required.);";
				return;
			}
			else
			{
				$key = $_POST["key"];
				
				if (strlen($key) !== 24)
				{
					echo "print(\"[RayJay] The " . $product . " product could not be loaded. Invalid key.\")";
					return;
				}
				else
				{
					$productlist = file_get_contents("products/productlist.txt");
					
					if (!preg_match("/\b" . $product . "\b/", $productlist))
					{
						echo "print(\"[RayJay] The " . $product . " product could not be loaded. Invalid product.\")";
						return;
					}
					else
					{
						$lowerproduct = strtolower($product);
						$keyid = $lowerproduct . "-" . $key;
						$keylist = file_get_contents("../clockwork/admin/keys.txt");
						
						if (!preg_match("/\b" . $keyid . "\b/", $keylist))
						{
							echo "print(\"[RayJay] The " . $product . " product could not be loaded. Invalid key.\")";
							return;
						}
						else
						{
							$contents = file_get_contents("encrypted/" . $product . ".php");
							$snip = array("<?php", "/*", "*/", "?>");
							
							echo str_replace($snip, "", $contents);
							echo "print(\"[RayJay] The " . $product . " product has been loaded.\");";
							return;
						}
					}
				}
			}
			echo "print(\"[RayJay] The " . $product . " product could not be loaded. Error.\")";
			return;
		}
	}
?>