<?php
$conn = new mysqli("ttu295439.ttu.edu", "rdbManager", "VSws5dQzgrqePJCt", "rdb");

$sql = "SELECT FirstName, LastName, PhoneNumber FROM transactions T
		JOIN customer C ON C.CustomerID = T.CustomerID
		WHERE TransactionID = '" . $_GET['order'] . "'";

$result = $conn->query($sql);
	if($result->num_rows > 0) {
		while($row = $result->fetch_assoc()) {
			echo "<p><strong>Name</strong>: " . $row['FirstName'] . " " . $row['LastName'] . "</p>";	
			echo "<p><strong>Phone Number:</strong> " . $row['PhoneNumber'] . "</p>";	
		}
	} else {
		echo "ERROR!";
	}
$conn->close();	
?>