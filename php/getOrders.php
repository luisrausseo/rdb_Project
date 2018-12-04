<?php
$conn = new mysqli("ttu295439.ttu.edu", "rdbManager", "VSws5dQzgrqePJCt", "rdb");

$sql = "SELECT FoodName, Quantity FROM orders O
		JOIN menu M
		ON O.FoodID = M.FoodID
		WHERE O.TransactionID = '" . $_GET['order'] . "'";

$result = $conn->query($sql);
if($result->num_rows > 0) {
	echo "<table style='width:100%'><tr><th>Product</th><th>Quantity</th></tr>";
	while($row = $result->fetch_assoc()) {
		echo "<tr><td>" . $row['FoodName'] . "</td><td>" . $row['Quantity'] . "</a></td></tr>";	
	}
	echo "</table>";
} else {
	echo "NONE";
}

$conn->close();	

?>