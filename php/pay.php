<?php
$conn = new mysqli("ttu295439.ttu.edu", "rdbManager", "VSws5dQzgrqePJCt", "rdb");
$transactionID = $_GET['order'];

function getPayment() {
	$paymentType = array("cash", "visa", "mastercard", "maestro", "americanexpress");
	$type = $paymentType[rand(0, 4)];
	
	if ($type === "cash") {
		$authCode = "0000";
	} else {
		for ($authCode = mt_rand(1, 9), $i = 1; $i < 9; $i++) {
			$authCode .= mt_rand(0, 9);
		}
	}
	
	return array($type, $authCode);
}

$payment = getPayment();

$sql = "UPDATE transactions SET PaymentType = '" . $payment[0] . "', AuthCode = '" . $payment[1] . "' WHERE TransactionID = " . $transactionID;	 
if($conn->query($sql) === TRUE) {
	echo "Payment Type: " . $payment[0] . "</br>";
	echo "AuthCode: " . $payment[1] . "</br>";
} else {
	echo "ERROR";
}

$conn->close();	
?>