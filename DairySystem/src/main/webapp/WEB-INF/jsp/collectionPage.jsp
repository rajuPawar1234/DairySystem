<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<style type="text/css">
</style>
</head>
<body onload="formatAMPM()">

<script type="text/javascript">
	$(document).ready(function() {
		$('#FarmerId').autocomplete({
			source : 'searchFarmerIdAutocomplete'
		});

		$('#FarmerName').autocomplete({
			source : 'searchFarmerNameAutocomplete'
		});
		
	});
</script>
	<script type="text/javascript">
		function onFarmerNameChange() {
			var FarmerName = $("#FarmerName").val();
			$.getJSON('getFarmerDetailsByNameOnChange', {
				FarmerName : FarmerName
			}).done(function(data) {
				$("#FarmerId").val(data[0].fid);
			});
		}

		function onFarmerIdChange() {
			var FarmerId = $("#FarmerId").val();
			$.getJSON('getFarmerDetailsByFarmerIdOnChange', {
				FarmerId : FarmerId
			}).done(function(data) {
				$("#FarmerName").val(data[0].fname);
			});
		}
	</script>
	<script type="text/javascript">
		function formatAMPM() {
			var date = new Date();
			var dd = date.getDate() +"/"+ date.getMonth() + 1 +"/"+ date.getFullYear();
			var hours = date.getHours();
			var minutes = date.getMinutes();
			var ampm = hours >= 12 ? 'PM' : 'AM';
			hours = hours % 12;
			hours = hours ? hours : 12; // the hour '0' should be '12'
			minutes = minutes < 10 ? '0' + minutes : minutes;
			var strTime = dd +' ('+ hours + ':' + minutes + ' ' + ampm +')';
			document.getElementById('DateTime').innerHTML = strTime;

			if(ampm =='AM'){
				document.getElementById('ShiftTime').value = "Morning";
			}else{
				document.getElementById('ShiftTime').value = "Evening";
			}
		}
		setInterval(formatAMPM, 1000);
	</script>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-7">
				<h4>
					<strong >Daily Milk Collection</strong>
				</h4>
			</div>
			<div class="col-md-3">
				<h4><label id="DateTime">Date Time</label></h4>
			</div>
			<div class="col-md-2">
				<h4>
					<strong>
					<input name="" id="ShiftTime" class="form-control mb-md" readonly type="text" value="">
					<!-- <select class="form-control mb-md">
							<option value="morning">Morning</option>
							<option value="evening">Evening</option>
					</select> -->
					</strong>
				</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3"><label>Farmer Id</label>
				<input name="farmerId" id="FarmerId" onchange="onFarmerIdChange()" class="form-control mb-md" type="text" placeholder="Enter Farmer Id">
			</div>
			<div class="col-md-6"><label>Farmer Name</label>
				<input name="farmerName" id="FarmerName" onchange="onFarmerNameChange()" class="form-control mb-md" type="text" placeholder="Enter Farmer Name">
			</div>
			<div class="col-md-3"><label>Select Milk Type</label> <br>
				<strong><select class="form-control mb-md">
							<option value="cow">Cow</option>
							<option value="buffalo">Buffalo</option>
					</select></strong>
			</div>
			<div class="col-md-3 col-sm-6 col-12"><label>Enter Fat</label>
				<input class="form-control mb-md" type="text" placeholder="Enter Fat">
			</div>
			<div class="col-md-3"><label>Enter SNF</label>
				<input class="form-control mb-md" type="text" placeholder="Enter SNF">
			</div>
			<div class="col-md-3"><label>Enter Milk Qty</label>
				<input class="form-control mb-md" type="text" placeholder="Enter Milk Qty">
			</div>
			<div class="col-md-3"><label>Rate</label>
				<input class="form-control mb-md" type="text" placeholder="Rate">
			</div>
			<div class="col-md-3"><label>Total Amount</label>
				<input class="form-control mb-md" type="text" placeholder="Rate">
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<button type="submit" class="btn btn-success">Save Milk Record</button>
			</div>
		</div>
	</div>
</body>
</html>