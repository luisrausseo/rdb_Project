<?php
date_default_timezone_set('America/Chicago');
$date_now = new DateTime();
$conn = new mysqli("ttu295439.ttu.edu", "rdbManager", "VSws5dQzgrqePJCt", "rdb");

$sql = "SELECT * FROM tables";

$result = $conn->query($sql);
	if($result->num_rows > 0) {
		echo "<table style='width:100%'><tr><th>Table#</th><th>TransactionID</th></tr>";
		while($row = $result->fetch_assoc()) {
			if(!empty($row['TransactionID'])) {
				echo "<tr><td>" . $row['TableNumber'] . "</td><td><a href='orders.php?order=" . $row['TransactionID'] . "&table=" . $row['TableNumber'] . "'>" . $row['TransactionID'] . "</a></td></tr>";	
			} else {
				echo "<tr><td>" . $row['TableNumber'] . "</td><td>Available</td></tr>";
			}
		}
		echo "</table>";
	} else {
		echo "ERROR!";
	}





?>