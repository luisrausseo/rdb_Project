<!doctype html>
<html class="no-js" lang="">

<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>RDB Reservation</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link rel="manifest" href="site.webmanifest">
	<link rel="apple-touch-icon" href="icon.png">
	<!-- Place favicon.ico in the root directory -->
	<link rel="stylesheet" href="css/normalize.css">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	<script src='https://code.jquery.com/jquery-3.2.1.min.js'></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	
	<style>
	table {
		border-collapse: collapse;
		width: 100%;
	}

	th, td {
		text-align: center;
		padding: 8px;
	}

	tr:nth-child(odd){background-color: #f2f2f2}

	th {
		background-color: #87387d;
		color: white;
	}
	
	tr:hover {background-color: #f6f6f6;}
	
	.section{
		border: 1px solid #ccc!important;
		border-radius: 16px;
	}
	
	button.UIbutton {
		width:100px;
		height:100px;
		margin:15px;
		position: relative;
		vertical-align:top;
	}
	
	/* The Modal (background) */
	.modal {
		display: none; /* Hidden by default */
		position: fixed; /* Stay in place */
		z-index: 1; /* Sit on top */
		padding-top: 100px; /* Location of the box */
		left: 0;
		top: 0;
		width: 100%; /* Full width */
		height: 100%; /* Full height */
		overflow: auto; /* Enable scroll if needed */
		background-color: rgb(0,0,0); /* Fallback color */
		background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}

	/* Modal Content */
	.modal-content {
		background-color: #fefefe;
		margin: auto;
		padding: 20px;
		border: 1px solid #888;
		width: 60%;
	}

	/* The Close Button */
	.close {
		color: #aaaaaa;
		float: right;
		font-size: 28px;
		font-weight: bold;
	}

	.close:hover,
	.close:focus {
		color: #000;
		text-decoration: none;
		cursor: pointer;
	}
	
	</style>
	
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#">
			<img src="img/logo.PNG" height="30" class="d-inline-block align-top" alt="">
			Restaurant Management System
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="intranet.php">Home <span class="sr-only">(current)</span></a>
				</li>
			</ul>
		</div>
	</nav>
	</br>
	<div class="container-fluid">
		<div class="row">
			<div class="col-3">
				<div class="container-fluid section" style="padding: 15px;">
					<h4>Tables</h4>
					<?php include("php/tableStatus.php"); ?>
				</div>
			</div>
			<div class="col-6 section" style="padding: 15px;">				
					<button class="UIbutton" onclick="checkin();"><i class="fas fa-user-check fa-3x"></i></br>Check-in</button>
			</div>
			<div class="col-3">
				<div class="container-fluid section" style="padding: 15px;height:100%">
					<h4>Customers Waiting</h4>
					<?php include("php/customersWaiting.php"); ?>
				</div>
			</div>
		</div>
	</div>
	
	<!-- The Modal -->
	<div id="myModal" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-10">
						
					</div>
					<div class="col-2">
						<a class="close" onclick="closeModal();">&times;</a>
					</div>
				</div>
				<div class="row">
					<iframe id="check-in" src="" style="width:100%;height:300px" frameborder="0"></iframe>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		var modal = document.getElementById('myModal');
		
		function checkin() {
			$('#check-in').attr('src', 'php/check-in.php');
			openModal();
		}
		
		function seatIn(phoneNumber) {
			$('#check-in').attr('src', 'php/check-in.php?phone=' + phoneNumber);
			openModal();
		}
		
		function openModal() {
			modal.style.display = "block";
		}
		
		function closeModal() {
			modal.style.display = "none";
			location.reload();
		}
		
		window.onclick = function(event) {
			if (event.target == modal) {
				closeModal();
			}
		}
	</script>

</body>

</html>
