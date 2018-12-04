<?php
date_default_timezone_set('America/Chicago');
$date_now = new DateTime();
$conn = new mysqli("ttu295439.ttu.edu", "rdbManager", "VSws5dQzgrqePJCt", "rdb");

$sql = "SELECT FirstName, LastName, PartySize, PhoneNumber FROM reservation r
		LEFT JOIN (SELECT * FROM customer) c
		ON r.CustomerID = c.CustomerID
		WHERE r.Waiting = 1   ";

$result = $conn->query($sql);
	if($result->num_rows > 0) {
		echo "<table style='width:100%'><tr><th>Customer</th><th>Party Size</th></tr>";
		while($row = $result->fetch_assoc()) {
			echo "<tr onclick='seatIn(" . json_encode($row['PhoneNumber']) . ");'><td>" . $row['FirstName'] . " " . $row['LastName'] . "</td><td>" . $row['PartySize'] . "</td></tr>";	
		}
		echo "</table>";
	} else {
		echo "None!";
	}





?>