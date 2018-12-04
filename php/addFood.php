<?php
if ($_POST['FoodID']) {
	$conn = new mysqli("ttu295439.ttu.edu", "rdbManager", "VSws5dQzgrqePJCt", "rdb");
	$foodID = $_POST['FoodID'];
	$order =  $_POST['Order'];

	$sql = "SELECT * FROM orders
			WHERE TransactionID = '" . $order . "'
			AND FoodID = '" . $foodID . "'";
	
	$result = $conn->query($sql);
	if($result->num_rows == 0) {
		$sql = "INSERT INTO orders (FoodID, TransactionID, Quantity) VALUES (". $foodID .", ". $order .", 1)";
		if ($conn->query($sql) === TRUE) {
			echo "true";
		} else {
			echo "Error updating record: " . $conn->error;
		}
	} else {
		$sql = "UPDATE orders SET Quantity = Quantity + 1 WHERE FoodID = " . $foodID;
		if ($conn->query($sql) === TRUE) {
			echo "true";
		} else {
			echo "Error updating record: " . $conn->error;
		}
	}	
	$conn->close();		
}
?>