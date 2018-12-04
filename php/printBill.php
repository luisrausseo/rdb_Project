<?php
date_default_timezone_set('America/Chicago');
$transactionID = $_GET['order'];
$restaurantName = 'The Southern Vine';
$restaurantAddress = "2246 Smithfield Avenue\nLubbock, TX\n786-376-5680";
$tax = 0.0825;
$subtotal = 0;
$date_now = new DateTime();
echo "<html>
	  <head>
	  <style>
		  table { 
			border-collapse: collapse; 
		  } 
		  table th { 
			border-bottom: 1px solid; 
			padding: 10px; 
			text-align: right;
		  }
		  table td {
			text-align: right;
		  }
		  table.totalTable {
			 width:35%; margin-left:65%; margin-right:0%; 
		  }
		  table.totalTable td {
			text-align: right;
			font-weight: bold;
		  }
		  img {
			  display: block;
			  margin-left: auto;
			  margin-right: auto;
		  }
	   </style>
	   </head>
	   <body>";
	   
$conn = new mysqli("ttu295439.ttu.edu", "rdbManager", "VSws5dQzgrqePJCt", "rdb");


$sql = "SELECT FirstName FROM transactions T
		JOIN employees E ON E.EmployeeID = T.EmployeeID
		WHERE T.TransactionID = " . $transactionID;
$result = $conn->query($sql);
if($result->num_rows > 0) {
	$row = $result->fetch_assoc();
	$hostName = $row['FirstName'];
} else {	
	echo "ERROR";
}


echo "<pre><div style='width:85vw; max-width:450px'>";
echo "<h2 align=center>" . $restaurantName . "\n" . $restaurantAddress . "</h2>";
echo "Receipt# " . $transactionID . "</br>";
echo $date_now->format("m-d-Y") . "\t" . $date_now->format("H:i") . "</br>";
echo "TABLE " . $_GET['table'] . " \tHOST " . $hostName . "</br>";

$sql = "SELECT * FROM (SELECT * FROM orders t
		WHERE t.TransactionID = '" . $transactionID . "') a
		JOIN menu m ON m.FoodID = a.FoodID";
$result = $conn->query($sql);
if($result->num_rows > 0) {
	echo "<table style='width:100%'><tr><th>QTY</th><th>DESC</th><th>AMT</th></tr>";
	while($row = $result->fetch_assoc()) {
		echo "<tr><td>" . $row['Quantity'] . "</td><td>" . substr($row['FoodName'],0,25) . "</td><td>$" . number_format($row['Price']*$row['Quantity'], 2, '.', ',') . "</td></tr>";
		$subtotal = $subtotal + $row['Price']*$row['Quantity'];
	}
	echo "</table>";
} else {
	echo "ERROR";
}	

$taxTotal = $subtotal*$tax;
$total = number_format($subtotal + $taxTotal, 2, '.', ',');
$sql = "UPDATE transactions SET Total = " . $total . ", Date = '" . $date_now->format("Y-m-d H:i:s") . "' WHERE TransactionID = " . $transactionID;	 
if($conn->query($sql) === TRUE) {
	
} else {
	echo "ERROR";
}		 

echo "</br><table class='totalTable'>";
echo "<tr><td></td><td>Subtotal</td><td>$" . $subtotal . "</td></tr>";
echo "<tr><td></td><td>Tax</td><td>$" . number_format($taxTotal, 2, '.', ',') . "</td></tr>";
echo "<tr><td></td><td><strong>Check</strong></td><td>$" . $total . "</td></tr>";
echo "<tr><td></td><td><strong>Tip</strong></td><td>_________</td></tr>";
echo "<tr><td></td><td><strong>Total</strong></td><td>_________</td></tr>";
echo "</table>";

echo "<h4 align='center'>Thank You!</h4>";
echo "<img src='barcode.php?text=" . $transactionID . "&size=50&sizefactor=2'/>";
echo "</div></pre></body></html>";


$conn->close();	




?>