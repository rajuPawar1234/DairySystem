<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.form-control-sm {
	color: green;
}
</style>

<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript">
	$(function() {
		$("#BirthDate").datepicker({
			dateFormat : "dd-mm-yy",
			changeMonth : true,
			changeYear : true
		}).val()

		$("#TodaysDate").datepicker({
			dateFormat : "dd-mm-yy",
			changeMonth : true,
			changeYear : true
		}).val()
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#mobileNo').autocomplete({
			source : 'getMobileNoListAutoComplete'
		});
	});
</script>

<script type="text/javascript">
	function onMobileNoChange() {
		var mobileNo = $("#mobileNo").val();
		$.getJSON('getCustomerDetailsByMobile', {
			mobileNo : mobileNo
		}).done(function(data) {
			$("#CID").val(data[0].customerid);
			$("#Name").val(data[0].name);
			$("#Address").val(data[0].address);
			$("#BirthDate").val(data[0].birthdate);
			$("#Email").val(data[0].email);

			document.getElementById("Name").disabled = true;
			document.getElementById("Address").disabled = true;
			document.getElementById("BirthDate").disabled = true;
			document.getElementById("Email").disabled = true;
			document.getElementById("TokenNumber").focus();
		});
	}
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#Name').autocomplete({
			source : 'getCustomerNameListAutoComplete'
		});
	});
</script>

<script type="text/javascript">
	function onNameChange() {
		var Name = $("#Name").val();
		$.getJSON('getCustomerDetailsByName', {
			Name : Name
		}).done(function(data) {
			$("#CID").val(data[0].customerid);
			$("#mobileNo").val(data[0].mobileno);
			$("#Address").val(data[0].address);
			$("#BirthDate").val(data[0].birthdate);
			$("#Email").val(data[0].email);

			document.getElementById("Name").disabled = true;
			document.getElementById("Address").disabled = true;
			document.getElementById("BirthDate").disabled = true;
			document.getElementById("Email").disabled = true;
			document.getElementById("TokenNumber").focus();
		});
	}
</script>

<script type="text/javascript">
	function getCurrDate() {
		var d = new Date();
		var month = d.getMonth() + 1;
		var day = d.getDate();
		var output = (day < 10 ? '0' : '') + day + '-'
				+ (month < 10 ? '0' : '') + month + '-' + d.getFullYear();
		document.getElementById("TodaysDate").value = output;
		document.getElementById("TTodaysDate").value = output;
	}

	function onSelectDateChange() {
		document.getElementById("TTodaysDate").value = document
				.getElementById("TodaysDate").value;
	}
</script>

<body onload="getCurrDate()" class="container">
	<div class="dashboard-ecommerce">
		<div class="container-fluid dashboard-content ">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb-2">
				<div class="section-block">
					<div class="row">
						<div class="col-xl-9 col-lg-9 col-md-6 col-sm-6 col-6">
							Developer Master 
							</div>
						<div
							class="col-xl-2 col-lg-2 col-md-4 col-sm-4 col-4 text-primary">
							<input id="TodaysDate" name="" type="text"
								onchange="onSelectDateChange()"
								class="form-control form-control-sm" autocomplete="off">
						</div>
						<div
							class="col-xl-1 col-lg-1 col-md-2 col-sm-4 col-4 text-primary">
							<a class="dropdown-item" href="adminLogout"><i class="fas fa-power-off mr-2"></i></a>
						</div>
					</div>
				</div>
				<div class="tab-regular">
					<ul class="nav nav-tabs nav-fill" id="myTab7" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							id="home-tab-justify" data-toggle="tab" href="#home-justify"
							role="tab" aria-controls="home" aria-selected="true">Shop
								Details</a></li>
						<li class="nav-item"><a class="nav-link"
							id="profile-tab-justify" data-toggle="tab"
							href="#profile-justify" role="tab" aria-controls="profile"
							aria-selected="false">Owner Details</a></li>
					</ul>
					<div class="tab-content" id="myTabContent7">
						<div class="tab-pane fade show active" id="home-justify"
							role="tabpanel" aria-labelledby="home-tab-justify">
							<form action="saveShopNameDetails" method="post">
								<div class="row">
									<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12">
										<label for="validationCustom01">Shop Name</label> <input
											type="text" class="form-control" id="" name="shopName"
											onkeypress="return restrictnumbers(event)" autocomplete="off"
											placeholder="Enter Shop Name" value="" required>
									</div>
									<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12">
										<label for="">Address</label> <input type="text"
											autocomplete="off" class="form-control" id=""
											name="shopAddress" maxlength=""
											placeholder="Enter Shop Address" required>
									</div>
									<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12">
										<label for="">GST No</label> <input type="text"
											class="form-control" id="" autocomplete="off"
											placeholder="Enter GST No" name="gstNo" required>
									</div>
								</div>
								<br>
								<button type="submit" name="saveBankService"
									class="btn btn-success btn-sm">Add ${ServiceName}
									Record</button>
								<button type="button" name="" class="btn btn-danger btn-sm">Cancel</button>
							</form>
							<!--  -->

							<div class="table-responsive">
								<table id="example1"
									class="table table-striped table-bordered second"
									style="width: 100%">
									<thead>
										<tr>
											<th class="">Id</th>
											<th>Shop Name</th>
											<th>Address</th>
											<th>GST No</th>
											<th class="text-center">Edit</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="v" items="${ShopNameList}">
											<tr>
												<td><c:out value="${v.shopId}"></c:out></td>
												<td><c:out value="${v.shopName}"></c:out></td>
												<td><c:out value="${v.shopAddress}"></c:out></td>
												<td><c:out value="${v.gstNo}"></c:out></td>
												<td class="text-center"><button
														class="btn btn-success text-white btn-xs"
														data-toggle="modal" data-target="#exampleModal1"
														onclick="updateCustomer('${v.shopId}','${v.shopName}','${v.shopAddress}','${v.gstNo }')">Edit</button></td>
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<th class="">Id</th>
											<th>Shop Name</th>
											<th>Address</th>
											<th>GST No</th>
											<th class="text-center">Edit</th>
										</tr>
									</tfoot>
								</table>
							</div>

						</div>
						<!--  -->
						<div class="tab-pane fade" id="profile-justify" role="tabpanel"
							aria-labelledby="profile-tab-justify">
							<form action="saveOwnerDetails" method="post">
								<div class="row">
									<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12">
										<label for="validationCustom01">Owner Name</label> <input
											type="text" class="form-control" id="" name="ownerName"
											onkeypress="return restrictnumbers(event)" autocomplete="off"
											placeholder="Enter Owner Name" value="" required>
									</div>
									<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12">
										<label for="">Contact Number</label> <input type="text"
											autocomplete="off" class="form-control" id=""
											name="ownerContact" placeholder="Enter Contact" value=""
											required>
									</div>
									<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12">
										<label for="">Email</label> <input type="text"
											autocomplete="off" class="form-control" id=""
											name="ownerEmail" placeholder="Enter Email" value="" required>
									</div>
									<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12">
										<label for="">Address</label> <input type="text"
											class="form-control" id="" autocomplete="off"
											placeholder="Enter Address" name="ownerAddress" required>
									</div>
									<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12">
										<label for="">User Name</label> <input type="text"
											class="form-control" id="" autocomplete="off"
											placeholder="Enter User Name" name="ownerUserName" required>
									</div>
									<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12">
										<label for="">Password</label> <input type="text"
											class="form-control" id="" autocomplete="off"
											placeholder="Enter Password" name="ownerPassword" required>
									</div>
									<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12">
										<label for="">Select Shop</label> <select id=""
											class="form-control form-control-sm" name="ShopNameId">
											<option id="" value="">---Select Shop---</option>
											<c:forEach items="${ShopNameList}" var="trl">
												<option value="${trl.shopId}">${trl.shopName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<br>
								<button type="submit" name="saveBankService"
									class="btn btn-success btn-sm">Add ${ServiceName}
									Record</button>
								<button type="button" name="" class="btn btn-danger btn-sm">Cancel</button>
							</form>

							<!--  -->

							<div class="table-responsive">
								<table id="example1"
									class="table table-striped table-bordered second"
									style="width: 100%">
									<thead>
										<tr>
											<th class="text-center">Id</th>
											<th>Owner Name</th>
											<th>Contact</th>
											<th>Email</th>
											<th>Address</th>
											<th>User Name</th>
											<th>Password</th>
											<th>Company Name</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="v" items="${OwnerNameList}">
											<tr>
												<td class="text-center"><c:out value="${v.ownerId}"></c:out></td>
												<td><c:out value="${v.ownerName}"></c:out></td>
												<td><c:out value="${v.ownerContact}"></c:out></td>
												<td><c:out value="${v.ownerEmail}"></c:out></td>
												<td><c:out value="${v.ownerAddress }"></c:out></td>
												<td><c:out value="${v.ownerUserName }"></c:out></td>
												<td><c:out value="${v.ownerPassword }"></c:out></td>
												<td><c:out value="${v.shopDetailsModel.shopName }"></c:out></td>
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<th class="text-center">Id</th>
											<th>Owner Name</th>
											<th>Contact</th>
											<th>Email</th>
											<th>Address</th>
											<th>User Name</th>
											<th>Password</th>
											<th>Company Name</th>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function onAmountChange() {
		document.getElementById("Paid").disabled = false;
		document.getElementById("Paid").focus();
	}
	function onPaidChange() {
		var Amount = $("#Amount").val();
		var Paid = $("#Paid").val();
		if (Amount < Paid) {
			alert("Invalid..");
			document.getElementById("Paid").value = "";
			document.getElementById("Paid").focus();
		} else {
			$("#RemainingAmt").val(Amount - Paid);
		}
		/* if(Amount >= Paid){
			$("#RemainingAmt").val(Amount - Paid);
		} */
	}
</script>