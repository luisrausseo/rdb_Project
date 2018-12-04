<?php
if(isset($_GET['table'])) {
	$conn = new mysqli("ttu295439.ttu.edu", "rdbManager", "VSws5dQzgrqePJCt", "rdb");
	$sql = "UPDATE tables SET TransactionID = NULL WHERE TableNumber = '" . $_GET['table'] . "'";
		if ($conn->query($sql) === TRUE) {
			echo "true";
		} else {
			echo "Error updating record: " . $conn->error;
		}

}

$conn->close();	


?>