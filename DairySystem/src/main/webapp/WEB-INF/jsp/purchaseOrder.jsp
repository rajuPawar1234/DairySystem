<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta name="keywords" content="HTML5 Admin Template" />
		<meta name="description" content="Porto Admin - Responsive HTML5 Template">
		<meta name="author" content="okler.net">

		<!-- Mobile Metas -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

		<!-- Web Fonts  -->
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">

		<!-- Vendor CSS -->
		<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" href="assets/vendor/magnific-popup/magnific-popup.css" />
		<link rel="stylesheet" href="assets/vendor/bootstrap-datepicker/css/datepicker3.css" />

		<!-- Specific Page Vendor CSS -->
		<link rel="stylesheet" href="assets/vendor/pnotify/pnotify.custom.css" />

		<!-- Theme CSS -->
		<link rel="stylesheet" href="assets/stylesheets/theme.css" />

		<!-- Skin CSS -->
		<link rel="stylesheet" href="assets/stylesheets/skins/default.css" />

		<!-- Theme Custom CSS -->
		<link rel="stylesheet" href="assets/stylesheets/theme-custom.css">

		<!-- Head Libs -->
		<script src="assets/vendor/modernizr/modernizr.js"></script>
		<style type="text/css">
		.myScroll {
			height: 450px;
			overflow-y: scroll;
		}
		input[type=text]{
			autocomplete : off;
		}
		</style>
</head>
<body onload="getDate()">
	<!-- <center>
		<h3>Purchase Order</h3>
	</center> -->
	<div class="row myScroll">
		<!-- <div class="col-lg-1"></div> -->
		<div class="col-lg-12">
			<section class="panel form-wizard" id="w2">
			 			
	 			<div class="tabs" style="background-color: #f9f1f1">
					<ul class="nav nav-tabs nav-justify" style="background-color: #fff">
						<li class="active"><a href="#w2-account" data-toggle="tab" style="background-color: #f9f1f1"
							class="text-center"> <span class="badge hidden-xs">1</span>
								<b>Supplier Details</b>
						</a></li>
					</ul>
					<form class="form-horizontal" novalidate="novalidate">
						<div class="tab-content">
							<div id="w2-account" class="tab-pane active">
								<div class="form-group">
									<div class="col-sm-3">Supplier Name
										<input type="text" class="form-control input-sm"
											id="sName" name="sName" required>
									</div>
									<div class="col-sm-3">Supplier Contact
										<input type="text" class="form-control input-sm"
											id="sContact" name="sContact" required>
									</div>
									<div class="col-sm-3">Supplier Email
										<input type="text" class="form-control input-sm"
											id="sEmail" name="sEmail" required>
									</div>
									<div class="col-sm-3">Supplier Address
										<input type="text" class="form-control input-sm"
											id="sAddress" name="sAddress" required>
									</div>
								</div>
								<!-- <div class="form-group">
									<div class="col-sm-3">Pin Code
										<input type="text" class="form-control input-sm"
											id="w2-username" name="username" required>
									</div>
									<div class="col-sm-3">State
										<input type="text" class="form-control input-sm"
											id="w2-username" name="username" required>
									</div>
									<div class="col-sm-3">Supplier GSTIN
										<input type="text" class="form-control input-sm"
											id="w2-username" name="username" required>
									</div>
									<div class="col-sm-3">Supplier PAN No
										<input type="text" class="form-control input-sm"
											id="w2-username" name="username" required>
									</div>
								</div> -->
							</div>
						</div>
					</form>
				</div>
				<br> 
				
			<div class="tabs" style="background-color: #f9f1f1">
				<ul class="nav nav-tabs nav-justify" style="background-color: #fff">
					<li class="active">
					<a href="#w2-account" data-toggle="tab" style="background-color: #f9f1f1"
						class="text-center"> <span class="badge hidden-xs">2</span>
							<b>Add Order</b>
					</a></li>
				</ul>
				<form class="form-horizontal" novalidate="novalidate">
					<div class="tab-content">
						<div id="w2-account" class="tab-pane active">
						  <div class="form-group">
								<div class="col-sm-2">Item Name
									<input type="text" class="form-control input-sm" onchange="onItemNameChange()"
										id="itemName" name="itemName" required onclick="onItemNameClick()">
								</div>
								<div class="col-sm-2"><!-- HSN/SAC --> Item Code
									<input type="text" class="form-control input-sm" onchange="onItemCodeChange()"
										id="HSNSACcode" name="HSNSACcode" disabled required>
								</div>
								<div class="col-sm-1">Quantity
									<input type="text" class="form-control input-sm" onchange="onQuantityChange()"
										id="itemQuantity" name="itemQuantity"disabled required>
								</div>
								<div class="col-sm-1">Rate
									<input type="text" class="form-control input-sm" onchange="onRateChange()"
										id="itemRate" name="itemRate" disabled required>
								</div>
								<!-- <div class="col-sm-1">UOM
									<input type="text" class="form-control input-sm"
										id="uom" name="uom" required>
								</div> -->
								<div class="col-sm-1">Discount
									<input type="text" class="form-control input-sm" onchange="onDiscountChange()"
										id="discount" name="discount" disabled required value="0">
								</div>
								<div class="col-sm-1">GST%
									<input type="text" class="form-control input-sm" onchange="onItemTaxChange()"
										id="itemTax" name="itemTax" disabled required value="0">
								</div>
								<div class="col-sm-2">Amount
									<input type="text" class="form-control input-sm" onchange="onAmountChange()"
										id="itemAmount" name="itemAmount" disabled required>
								</div>
								<div class="col-sm-2">
									<!-- <input type="submit" class="form-control input-sm"
										style="background-color: green; color: white;" onclick="onAddOrderClick()"
										id="btnAddOrder" value="Add" name="btnAddOrder" required> -->

									<button type="button" class="btn" id="btnAddOrder"
										onclick="onAddOrderClick()" disabled
										style="background-color: green; color: white; margin-top: 20px; 
										padding-right: 50px; padding-left: 50px;">Add</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<br>
			<div class="tabs" style="background-color: #f9f1f1">
				<ul class="nav nav-tabs nav-justify" style="background-color: #fff">
					<li class="active">
					<a href="#w2-account" data-toggle="tab" style="background-color: #f9f1f1"
						class="text-center"> <span class="badge hidden-xs">3</span>
							<b>Order Details</b>
					</a></li>
				</ul>
				<form class="form-horizontal" novalidate="novalidate">
					<div class="tab-content">
						<div id="w2-account" class="tab-pane active">
						
						<div class="panel-body">
										<div class="table-responsive">
											<table class="table table-bordered table-hover mb-none">
												<thead>
													<tr>
														<!-- <th>Sr.No</th> -->
														<th>Item Name</th>
														<th><!-- HSN/SAC -->Item Code</th>
														<th>Quantity</th>
														<th>Rate</th>
														<!-- <th>UOM</th> -->
														<th>Discount</th>
														<th>GST %</th>
														<th>Amount</th>
														<th>Cancel</th>
													</tr>
												</thead>
												<tbody id="addOrderToTableBody">

												</tbody>
											</table>
										</div>
									</div> 
						 
						   <div class="form-group">
								<div class="col-sm-2">
									<input type="text" id="randomNO" name="oId">
									 <input type="text" id="dd">
								</div>
								<div class="col-sm-2">Total Quantity
									<input type="text" class="form-control input-sm" disabled value="0"
										id="totalQuantity" name="totalQuantity" autocomplete="off" required>
								</div>
								<div class="col-sm-2">Total Amount
									<input type="text" class="form-control input-sm" disabled value="0"
										id="totalAmount" name="totalAmount" autocomplete="off" required>
								</div>
								<div class="col-sm-2">Received
									<input type="text" class="form-control input-sm" disabled value="0" onchange="calculateAmount()"
										id="amountReceived" name="amountReceived" autocomplete="off" required>
								</div>
								<div class="col-sm-2">Balance
									<input type="text" class="form-control input-sm" disabled value="0"
										id="balanceRemaining" name="balanceRemaining" autocomplete="off" required>
								</div>
								<div class="col-sm-2">
									<button type="button" class="btn" id="btnSubmitOrder"
										onclick="onSubmitClick()"
										style="background-color: green; color: white; margin-top: 20px; 
										padding-right: 40px; padding-left: 40px;">Submit</button>
								</div>
							</div>
						</div> 
					</div>
				</form>
			</div>
			</section>
		</div>
		<!-- <div class="col-lg-1"></div> -->
	</div>

<!-- //////////////////////////// Scripts //////////////////////////////////// -->
	<script type="text/javascript"> 
	   function onAddOrderClick() { 
		   /* alert("OK"); */
		   var itemQuantity =parseInt($("#itemQuantity").val());
		   var itemRate =parseInt($("#itemRate").val());
		   var discount =parseInt($("#discount").val());
		   var itemTax =parseInt($("#itemTax").val());
		   var itemAmount =parseInt($("#itemAmount").val());
		   var HSNSACcode = $("#HSNSACcode").val();  
		   var itemName = $("#itemName").val();
		   var orderId = $("#randomNO").val();  
		   var orderDate = $("#dd").val();
		   alert(orderId+" & "+orderDate);
		   var totalQuantity =parseInt($("#totalQuantity").val());
		   var totalAmount =parseInt($("#totalAmount").val());
		   var amountReceived =parseInt($("#amountReceived").val());
		   var balanceRemaining =parseInt($("#balanceRemaining").val());
		   var x = document.getElementById("addOrderToTableBody").rows.length;
		   
		   $.getJSON('saveItemOrder.html', {
			   itemQuantity : itemQuantity,
			   itemRate : itemRate,
			   discount : discount,
			   itemTax : itemTax,
			   itemAmount : itemAmount,
			   HSNSACcode : HSNSACcode,
			   itemName : itemName,
			   orderDate : orderDate,
			   orderId : orderId
			});
		    
		   //alert(x);
		   var tBody = document.getElementById("addOrderToTableBody");
		   var row = tBody.insertRow(0);
		   
		   var cell1 = row.insertCell(0); 
		   var cell2 = row.insertCell(1); 
		   var cell3 = row.insertCell(2);
		   var cell4 = row.insertCell(3); 
		   var cell5 = row.insertCell(4); 
		   var cell6 = row.insertCell(5);
		   var cell7 = row.insertCell(6);
		   var cell8 = row.insertCell(7);
		  // var cell9 = row.insertCell(8);
		   
		   cell1.textContent = itemName;
		   cell2.textContent = HSNSACcode;  
		   cell3.textContent = itemQuantity;
		   cell4.textContent = itemRate;  
		   cell5.textContent = discount;
		   cell6.textContent = itemTax;
		   cell7.textContent = itemAmount;
		   
		   cell8.innerHTML = '<i class="fa fa-times" style="color:red;" aria-hidden="true" onclick="deleteClothOrder(this.parentNode.parentNode)"></i>'; 
		 
		   totalQuantity = (totalQuantity + itemQuantity);
		   totalAmount = (totalAmount + itemAmount);
		   
		   $("#totalQuantity").val(totalQuantity); 
		   $("#totalAmount").val(totalAmount);
		   $("#balanceRemaining").val(totalAmount);
		   document.getElementById("amountReceived").disabled = false;
		  
		   onItemNameClick(); //sortTable();
	   }
	</script>
<script type="text/javascript">
			function deleteClothOrder(a){
				var itemQuantity = a.children[3].textContent;
				var itemRate = a.children[4].textContent;
				var itemAmount = a.children[7].textContent;
				//alert("itemQuantity "+itemQuantity+" itemRate "+itemRate+" itemAmount "+itemAmount);
				
				var totalQuantity =parseInt($("#totalQuantity").val());
				var totalAmount =parseInt($("#totalAmount").val());
				var amountReceived =parseInt($("#amountReceived").val());
				var balanceRemaining =parseInt($("#balanceRemaining").val());
				//alert("totalQuantity "+totalQuantity+" totalAmount "+totalAmount+" balanceRemaining "+balanceRemaining);
				/* 
				   $.getJSON('deleteCurrentOrder.html', {	
						cId : cId,
						orderId : orderId,
						ClothTypeID : ClothTypeID,
						ServiceTypeID : ServiceTypeID
					});
				 */
				   totalAmount = (totalAmount - itemAmount);
				   totalQuantity = (totalQuantity - itemQuantity);
				   
				   $("#totalQuantity").val(totalQuantity); 
				   $("#totalAmount").val(totalAmount);
				   $("#balanceRemaining").val(totalAmount);
				    
				   for(let i=8; i>=0; i--){
					   a.removeChild(a.childNodes[i]);
				   }
			}
	</script>
	<script type="text/javascript"> 
		function onNowRateChange() { 
			   var nowRate = $("#nowRate").val();
			   var quantity = $("#Quantity").val(); 
			   $("#Amount").val(nowRate*quantity);
			   document.getElementById("btnAddCloth").disabled = false;
			   }
	</script> <!-- nowRate -->
	<script type="text/javascript">
		function onItemNameChange(){
			document.getElementById("HSNSACcode").disabled = false;
		}
	</script>
	<script type="text/javascript">
		function onItemCodeChange(){
			document.getElementById("itemQuantity").disabled = false;
		}
	</script>
	<script type="text/javascript">
		function onQuantityChange(){
			document.getElementById("itemRate").disabled = false;
		}
	</script>
	<script type="text/javascript">
		function onRateChange(){
			   var itemQuantity =parseInt($("#itemQuantity").val());
			   var itemRate =parseInt($("#itemRate").val());
			   var itemAmount = itemQuantity * itemRate;
			   document.getElementById("itemAmount").value = itemAmount;
			   document.getElementById("btnAddOrder").disabled = false;
		}
	</script>
	<script type="text/javascript"> 
	   function onItemNameClick() { 
		   document.getElementById("itemName").value = "";
		   document.getElementById("HSNSACcode").value = "";
		   document.getElementById("itemQuantity").value = "";
		   document.getElementById("itemRate").value = "";
		   document.getElementById("itemAmount").value = "";
		   
		   document.getElementById("HSNSACcode").disabled = true;
		   document.getElementById("itemQuantity").disabled = true;
		   document.getElementById("itemRate").disabled = true;
		   document.getElementById("btnAddOrder").disabled = true;
		   
		   document.getElementById("itemName").focus();
	   }
	</script>
	<script type="text/javascript">
		function calculateAmount() {
			var totalAmount =parseInt($("#totalAmount").val());
			var amountReceived =parseInt($("#amountReceived").val());
			var balanceRemaining =parseInt($("#balanceRemaining").val());
			//alert("amountReceived "+amountReceived+" totalAmount "+totalAmount+" balanceRemaining "+balanceRemaining);
			
			//var a = PreaviousRemaining + TotalAmount;
			if((amountReceived<=totalAmount) && (amountReceived>=0)){
				var	AmountRemaining = totalAmount - amountReceived;
				document.getElementById("balanceRemaining").value = AmountRemaining;
			}else
				{
				alert("plz enter Amount Paid is less than Total Amount ");
				document.getElementById("amountReceived").value = "";	
				}
		}</script>

		<script>
		function sortTable() {
		  var table, rows, switching, i, x, y, shouldSwitch;
		  table = document.getElementById("addOrderToTableBody");
		  switching = true;
		  /*Make a loop that will continue until
		  no switching has been done:*/
		  while (switching) {
		    //start by saying: no switching is done:
		    switching = false;
		    rows = table.rows;
		    /*Loop through all table rows (except the
		    first, which contains table headers):*/
		    for (i = 1; i < (rows.length - 1); i++) {
		      //start by saying there should be no switching:
		      shouldSwitch = false;
		      /*Get the two elements you want to compare,
		      one from current row and one from the next:*/
		      x = rows[i].getElementsByTagName("TD")[0];
		      y = rows[i + 1].getElementsByTagName("TD")[0];
		      //check if the two rows should switch place:
		      if (Number(x.innerHTML) > Number(y.innerHTML)) {
		        //if so, mark as a switch and break the loop:
		        shouldSwitch = true;
		        break;
		      }
		    }
		    if (shouldSwitch) {
		      /*If a switch has been marked, make the switch
		      and mark that a switch has been done:*/
		      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
		      switching = true;
		    }
		  }
		}
		</script>
<script>
 function getDate(){
	var d = new Date();
	//document.getElementById("ddd").innerHTML = d.toDateString();
	/*  $("#dd").val(d); */
	 
	 var n =  new Date();
	 var y = n.getFullYear();
	 var m = n.getMonth() + 1;
	 var d = n.getDate(); 
	 
	 document.getElementById("dd").value = d + "/" + m + "/" + y;
/* 	 document.getElementById("mdd").value = d + "/" + m + "/" + y; */
	 generateRandom();
 }
</script>
<script type="text/javascript"> 
		   function generateRandom() { 
			   var num1 = Math.floor(Math.random() * (999 - 100 + 1) ) + (100);
			   var num2 = Math.floor(Math.random() * (999 - 100 + 1) ) + (100);
			   var r=num1;
			   r = r + "";
			   var x = r.split("").reverse().join("");
			   /* alert("ORDS"+(num)+(x)); */
			   $("#randomNO").val("ORDS"+(num1)+(num2));
			   //$("#orderIdForBarcode").val("ORDS"+(num1)+(num2));
			   //$("#slipOrderId").val("ORDS"+(num1)+(num2));
		}
	</script>
	<!-- Vendor -->
	<!-- <script src="assets/vendor/jquery/jquery.js"></script> -->
	<script
		src="assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.js"></script>
	<script src="assets/vendor/nanoscroller/nanoscroller.js"></script>
	<script
		src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script src="assets/vendor/magnific-popup/magnific-popup.js"></script>
	<script src="assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>

	<!-- Specific Page Vendor -->
	<script src="assets/vendor/jquery-validation/jquery.validate.js"></script>
	<script src="assets/vendor/bootstrap-wizard/jquery.bootstrap.wizard.js"></script>
	<script src="assets/vendor/pnotify/pnotify.custom.js"></script>

	<!-- Theme Base, Components and Settings -->
	<script src="assets/javascripts/theme.js"></script>

	<!-- Theme Custom -->
	<script src="assets/javascripts/theme.custom.js"></script>

	<!-- Theme Initialization Files -->
	<script src="assets/javascripts/theme.init.js"></script>


	<!-- Examples -->
	<script src="assets/javascripts/forms/examples.wizard.js"></script>
</body>
</html>