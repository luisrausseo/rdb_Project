<?php
$conn = new mysqli("ttu295439.ttu.edu", "rdbManager", "VSws5dQzgrqePJCt", "rdb");
$order = $_GET['order'];

$sql = "SELECT FoodID, FoodName FROM menu";

$result = $conn->query($sql);
	if($result->num_rows > 0) {
		while($row = $result->fetch_assoc()) {	
			echo "<button class='foodButton' onclick='addFood(" . json_encode($row['FoodID'] . "|" . $_GET['order']) . ");'>" . $row['FoodName'] . "</button>";
		}
	} else {
		echo "ERROR!";
	}
$conn->close();	
?>