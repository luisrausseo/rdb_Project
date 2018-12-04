<?php
function createCustomer($firstName, $lastName, $phoneNumber, $conn) {
	$sql = "INSERT INTO customer (FirstName, LastName, PhoneNumber) VALUES ('" . $firstName . "', '" . $lastName . "', '" . $phoneNumber . "')";
	if ($conn->query($sql) === TRUE) {
		return true;
	} else {
		echo "Error: " . $sql . "<br>" . $conn->error;
		return false;
	}
}

function createReservation($date, $partySize, $customerID, $conn) {
	$sql = "INSERT INTO reservation (Date, PartySize, CustomerID) VALUES ('" . $date->format("Y-m-d H:i:s") . "', " . $partySize . ", " . $customerID . ")";
	if ($conn->query($sql) === TRUE) {
		echo "Reservation created successfully";
		return true;
	} else {
		//If the customer already have a reservation at that time, give error.
		if ($conn->error) {
			echo "You already have a reservation on " . $date->format("m/d/Y H:i:s");
			return false;
		}
	}
}

function getCustomerID($phoneNumber, $conn) {
	$sql = "SELECT CustomerID FROM customer WHERE PhoneNumber = '" .  $phoneNumber . "'";
	$result = $conn->query($sql);
	if($result->num_rows > 0) {
		$row = $result->fetch_assoc();
		return $row['CustomerID'];
	} else {
		return false;
	}
}

if(isset($_POST)) {
	echo "<pre>";
	date_default_timezone_set('America/Chicago');
	//Input parameters
	$firstName = $_POST['firstName'];
	$lastName = $_POST['lastName'];
	$phoneNumber = $_POST['phoneNumber'];
	$partySize = $_POST['partySize'];
	$reservationDate = $_POST['datepicker'];
	$reservationTime = $_POST['timepicker'];
	// $firstName = "Luis";
	// $lastName = "Rausseo";
	// $phoneNumber = "786-916-5005";
	// $partySize = 4;
	// $reservationDate = "11/15/2018";
	// $reservationTime = "16:45";
	
	//Connection credentials
 	$conn = new mysqli("ttu295439.ttu.edu", "rdbManager", "VSws5dQzgrqePJCt", "rdb");

	if($customerID = getCustomerID($phoneNumber, $conn)) {
		//Customer exists, so reservation can be made. Get CustomerID and then create reservation.
		$date = DateTime::createFromFormat('m/d/Y H:i', $reservationDate . " " . $reservationTime);
		
		//Check if date is in the past
		$now = new DateTime();
		if($date < $now) {
			echo 'Error: date is in the past';
			exit();
		}
		
		//Creates reservation
		if (createReservation($date, $partySize, $customerID, $conn) == false) {
			exit();
		}
	} else {
		if (createCustomer($firstName, $lastName, $phoneNumber, $conn)) {
			//Customer created successfully, now creates reservation
			$date = DateTime::createFromFormat('m/d/Y H:i', $reservationDate . " " . $reservationTime);
			if (createReservation($date, $partySize, getCustomerID($phoneNumber, $conn), $conn) == false) {
				exit();
			}
		} else {
			exit();
		}
	}
	$conn->close();
	echo "</pre>";
}

?>