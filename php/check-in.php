<?php
date_default_timezone_set('America/Chicago');
$date_now = new DateTime();
$conn = new mysqli("ttu295439.ttu.edu", "rdbManager", "VSws5dQzgrqePJCt", "rdb");
echo "<html>
		<head>
			<script src='https://code.jquery.com/jquery-3.2.1.min.js'></script>
		</head>
		<body>";
		
function tableSelector($customerID, $conn) {
	$sql = "SELECT TableNumber FROM tables WHERE TransactionID IS NULL";
	$result = $conn->query($sql);
	if($result->num_rows > 0) {
		echo "Seat on Table:<select id='tableSelector'>
								<option value='0|" . $customerID . "'>Wait</option>";
		while($row = $result->fetch_assoc()) {
			echo "<option value='". $row['TableNumber'] . "|" . $customerID . "'>". $row['TableNumber'] . "</option>";
		}
		echo "</select>" . "</br>";
	}
}

function serverSelector($conn) {
	$sql = "SELECT EmployeeID, FirstName FROM employees WHERE Position = 'server'";
	$result = $conn->query($sql);
	if($result->num_rows > 0) {
		echo "<div hidden id='server'>Select server:<select id='serverSelector'>";
		while($row = $result->fetch_assoc()) {
			echo "<option value='" . $row['EmployeeID'] . "'>". $row['FirstName'] . "</option>";
		}
		echo "</select>" . "</div></br>";
	}
}
		
if (empty($_POST['phoneNumber']) and empty($_POST['table']) and empty($_POST['customerInfo']) and empty($_POST['partySize']) and empty($_GET['phone'])) {

	echo "<div id='step1'>
			  <input type='text' name='phoneNumber' class='form-control' id='phoneNumber' placeholder='987-654-3210' required>
			  </br>
			  <button onclick='checkCustomer();'>Check-In</button>
		  </div>";
	echo "<div id='step2'></div>";
	echo "<div id='step3'></div>";
}


if (isset($_POST['phoneNumber']) or isset($_GET['phone'])) {
	
	if (isset($_POST['phoneNumber'])) {
		$phoneNumber = $_POST['phoneNumber'];
	} else {
		$phoneNumber = $_GET['phone'];
		echo "<div id='step2'>";
	}
	
	$sql = "SELECT * FROM reservation r
			LEFT JOIN (SELECT *
					   FROM customer) c
			ON r.CustomerID = c.CustomerID
			WHERE PhoneNumber = '" . $phoneNumber . "'
			AND Date > '" . $date_now->format("Y-m-d") . "'";
	$result = $conn->query($sql);
	if($result->num_rows > 0) {
		while($row = $result->fetch_assoc()) {
			echo "<strong>Reservation found:</strong></br>";
			echo "Customer: " . $row['FirstName'] . " " . $row['LastName'] . "</br>";
			echo "Party Size: " . $row['PartySize'] . "</br>";
			echo "Phone Number: " . $row['PhoneNumber'] . "</br>";
			tableSelector($row['CustomerID'], $conn);
			serverSelector($conn);
			echo "<button onclick='seatCustomer();'>Seat</button>";
			if (isset($_GET['phone'])){echo "</div>";echo "<div id='step3'></div>";};
		}
	} else {
		$sql = "SELECT * FROM customer WHERE PhoneNumber = '" . $phoneNumber . "'";
		$result = $conn->query($sql);
		if($result->num_rows > 0) {
			while($row = $result->fetch_assoc()) {
				echo "Customer: " . $row['FirstName'] . " " . $row['LastName'] . "</br>";
				echo "Party Size: </br>";
				echo "<input type='text' name='partySize' class='form-control' id='partySize' placeholder='1' required>". "</br>";
				echo "Phone Number: " . $row['PhoneNumber'] . "</br>";
				tableSelector($row['CustomerID'], $conn);
				echo "<button onclick='seatCustomer();'>Seat</button>";
			}
		} else {
			echo "<strong>Customer info:</strong></br>";
			echo "<input type='text' name='firstName' class='form-control' id='firstName' placeholder='John' required>";
			echo "<input type='text' name='lastName' class='form-control' id='lastName' placeholder='Doe' required>";
			echo "<input type='text' name='phoneNumber' class='form-control' id='phoneNumber' value='" . $phoneNumber . "' required>";
			echo "<input type='text' name='partySize' class='form-control' id='partySize' placeholder='1' required>";
			echo "<button onclick='addCustomer();'>Add</button>";
		}
	}
	$conn->close();
}

if (isset($_POST['table'])) {
	$table = explode('|', $_POST['table'][0])[0];
	$customerID =  explode('|', $_POST['table'][0])[1];
	
	
	if($table > 0) {
		$sql = "SELECT TransactionID FROM transactions ORDER BY TransactionID DESC LIMIT 1";
		$result = $conn->query($sql);
		$row = $result->fetch_assoc();
		$transactionID = $row['TransactionID'] + 1;
		
		$sql = "UPDATE tables SET TransactionID = '" . $transactionID . "' WHERE TableNumber = '" . $table . "'";
		if ($conn->query($sql) === TRUE) {
			echo "Customer seated on table " . $table . "</br>";
		} else {
			echo "Error updating record: " . $conn->error;
		}
		$serverID = $_POST['table'][1];
		$sql = "INSERT INTO transactions (TransactionID, CustomerID, EmployeeID) VALUES (" . $transactionID . "," . $customerID . ", " . $serverID . ")";
		if ($conn->query($sql) === TRUE) {
			echo "Transaction " . $transactionID . " created successfully" . "</br>";
			$sql = "UPDATE reservation SET Waiting = '0' WHERE CustomerID = " . $customerID . "
				AND Date > '" . $date_now->format("Y-m-d") . "'";
			$conn->query($sql);	
			if ($conn->query($sql) === TRUE) {
				echo "Updated reservation.</br>";
			} else {
				echo "Error updating record: " . $conn->error;
			}
		} else {
			echo "Error updating record: " . $conn->error;
		}
		
	} else {
		$sql = "UPDATE reservation SET Waiting = '1' WHERE CustomerID = " . $customerID . "
				AND Date > '" . $date_now->format("Y-m-d") . "'";
		$conn->query($sql);	
		if (mysqli_affected_rows($conn)> 0) {
			echo "Customer is waiting for a table.</br>";
		} else {
			$sql = "INSERT INTO reservation (Date, PartySize, CustomerID, Waiting) VALUES ('" . $date_now->format("Y-m-d H:i:s") . "', " . $_POST['partySize'] . ", " . $customerID . ",1)";
			if ($conn->query($sql) === TRUE) {
					echo "Customer is waiting</br>";
			} else {
				echo "Error updating record: " . $conn->error;
			}
		}
	}
	$conn->close();
}

if (isset($_POST['customerInfo'])) {
	$firstName = $_POST['customerInfo'][0];
	$lastName = $_POST['customerInfo'][1];
	$phoneNumber = $_POST['customerInfo'][2];
	$partySize = $_POST['customerInfo'][3];
	
	$sql = "INSERT INTO customer (FirstName, LastName, PhoneNumber) VALUES('" . $firstName . "','" . $lastName . "','" . $phoneNumber . "')";
	
	if ($conn->query($sql) === TRUE) {
			echo "Customer " . $firstName . " registered</br>";
	} else {
		echo "Error updating record: " . $conn->error;
		exit();
	}
	$customerID = $conn->insert_id;
	$sql = "INSERT INTO reservation (Date, PartySize, CustomerID, Waiting) VALUES ('" . $date_now->format("Y-m-d H:i:s") . "', " . $partySize . ", " . $customerID . ",1)";
	if ($conn->query($sql) === TRUE) {
			echo "Customer " . $firstName . " is waiting</br>";
	} else {
		echo "Error updating record: " . $conn->error;
	}
	$conn->close();
}

echo 	"<script>
			function checkCustomer() {
				var phoneNum = $('#phoneNumber').val();
				$.post('check-in.php', { phoneNumber: phoneNum }, function(data){
					$('#step1').empty();
					$('#step2').append(data);
				});
			}
			function seatCustomer() {
				var table = $('#tableSelector').val();
				var partySize = $('#partySize').val();
				var server = $('#serverSelector').val();
				if (typeof(partySize) == 'undefined') {
					$.post('check-in.php', { table: [table, server] }, function(data){
						$('#step2').empty();
						$('#step3').append(data);
					});
				} else {
					$.post('check-in.php', { table: [table, server], partySize: partySize }, function(data){
						$('#step2').empty();
						$('#step3').append(data);
					});
				}
			}
			function addCustomer() {
				var firstName = $('#firstName').val();
				var lastName = $('#lastName').val();
				var phoneNumber = $('#phoneNumber').val();
				var partySize = $('#partySize').val();
				$.post('check-in.php', { customerInfo: [firstName,lastName,phoneNumber,partySize] }, function(data){
					$('#step2').empty();
					$('#step3').append(data);
				});
			}
			
			$('#tableSelector').change(function() {
				if ($(this).val().split('|')[0] == 0) {
					$('#server').hide();
				} else {
					$('#server').show();
				}
			});
		</script>";		
				
echo "</body></html>";
?>