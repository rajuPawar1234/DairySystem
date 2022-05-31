<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Basic -->
		<meta charset="UTF-8">

		<title>Advanced Tables | Okler Themes | Porto-Admin</title>
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
		<link rel="stylesheet" href="assets/vendor/select2/select2.css" />
		<link rel="stylesheet" href="assets/vendor/jquery-datatables-bs3/assets/css/datatables.css" />

		<!-- Theme CSS -->
		<link rel="stylesheet" href="assets/stylesheets/theme.css" />

		<!-- Skin CSS -->
		<link rel="stylesheet" href="assets/stylesheets/skins/default.css" />

		<!-- Theme Custom CSS -->
		<link rel="stylesheet" href="assets/stylesheets/theme-custom.css">

		<!-- Head Libs -->
		<script src="assets/vendor/modernizr/modernizr.js"></script>
</head>
<body>
	<section class="panel panel-heading">
		<header class="panel-heading">
								 <div class="panel-actions">
									<a href="#" class="fa fa-caret-down"></a>
									<a href="#" class="fa fa-times"></a>
								</div> 
						
								<a class="btn btn-success btn-xs" data-toggle="modal" data-target="#modalBootstrap">Add New Farmer</a>
							</header>
		

	<div class="panel-body">
		<table class="table table-bordered table-striped mb-none" id="datatable-tabletools">
			<thead>
				<tr>
					<th class="text-center">Id</th>
					<th class="text-center">Farmer Name</th>
					<th class="text-center">Mobile</th>
					<th class="text-center">Email</th>
					<th class="text-center">Birth Date</th>
					<th class="text-center">Address</th>
					<th class="text-center">Edit</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="v" items="${AllFarmers}">
					<tr class="">
						<td class="text-center"><c:out value="${v.fid}"></c:out></td>
						<td class="text-center"><c:out value="${v.fname}"></c:out></td>
						<td class="text-center"><c:out value="${v.fmobile}"></c:out></td>
						<td class="text-center"><c:out value="${v.femail}"></c:out></td>
						<td class="text-center"><c:out value="${v.fdob}"></c:out></td>
						<td class="text-center"><c:out value="${v.faddress}"></c:out></td>
						<!-- <td><a class="btn btn-success col-6" data-toggle="modal" data-target="#modalBootstrapUpdate">Edit</a></td> -->
						<td class="text-center"><button
								class="btn btn-success text-white btn-xs" data-toggle="modal"
								data-target="#modalBootstrapUpdate"
								onclick="updateFarmer('${v.fid}','${v.fname}','${v.fmobile}','${v.femail }','${v.fdob}','${v.faddress}')">Edit</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<!-- Modal Bootstrap -->
		
									<div class="modal fade" id="modalBootstrap" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
													<h4 class="modal-title" id="myModalLabel">Add New Farmer</h4>
												</div>
												 <form action="AddNewFarmer" method="post" id="demo-form" class="form-horizontal mb-lg" novalidate="novalidate">
												<div class="modal-body">
													<div class="form-group mt-lg">
														<label class="col-sm-3 control-label">Name</label>
														<div class="col-sm-9">
															<input type="text" name="fname" class="form-control" placeholder="Type Farmer name..." required/>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label">Mobile No</label>
														<div class="col-sm-9">
															<input type="text" name="fmobile" class="form-control" placeholder="Type Farmer Mobile..." required/>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label">Email</label>
														<div class="col-sm-9">
															<input type="text" name="femail" class="form-control" placeholder="Type Farmer Email..." />
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label">Address</label>
														<div class="col-sm-9">
															<input type="text" name="faddress" class="form-control" placeholder="Type Farmer Address..." />
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label">Birth Date</label>
														<div class="col-sm-9">
															<input type="text" name="fdob" class="form-control" placeholder="Select Farmer Birth Date..." />
														</div>
													</div>
													
													<!-- <div class="form-group">
														<label class="col-sm-3 control-label">Comment</label>
														<div class="col-sm-9">
															<textarea rows="5" class="form-control" placeholder="Type your comment..." required></textarea>
														</div>
													</div> -->
												
												</div>
												<div class="modal-footer">
													<button type="submit" class="btn btn-success">Add New Farmer</button>
													<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
												</div>
												</form>
											</div>
										</div>
									</div>

	<script type="text/javascript">
		function updateFarmer(a, b, c, d, e, f) {
			$("#Fid").val(a);
			$("#Fname").val(b);
			$("#Fmobile").val(c);
			$("#Femail").val(d);
			$("#Fdob").val(e);
			$("#Faddress").val(f);
		}
	</script>

									<!-- Update/Edit -->
									<div class="modal fade" id="modalBootstrapUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
													<h4 class="modal-title" id="myModalLabel">Update Farmer</h4>
												</div>
												 <form action="UpdateFarmer" method="post" id="demo-form" class="form-horizontal mb-lg" novalidate="novalidate">
												<div class="modal-body">
													<div class="form-group mt-lg">
														<label class="col-sm-3 control-label">Id</label>
														<div class="col-sm-9">
															<input type="text" id="Fid" name="fid" class="form-control" readonly required/>
														</div>
													</div>
													<div class="form-group mt-lg">
														<label class="col-sm-3 control-label">Name</label>
														<div class="col-sm-9">
															<input type="text" id="Fname" name="fname" class="form-control" placeholder="Type Farmer name..." required/>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label">Mobile No</label>
														<div class="col-sm-9">
															<input type="text" id="Fmobile" name="fmobile" class="form-control" placeholder="Type Farmer Mobile..." required/>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label">Email</label>
														<div class="col-sm-9">
															<input type="text" id="Femail" name="femail" class="form-control" placeholder="Type Farmer Email..." />
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label">Address</label>
														<div class="col-sm-9">
															<input type="text" id="Faddress" name="faddress" class="form-control" placeholder="Type Farmer Address..." />
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label">Birth Date</label>
														<div class="col-sm-9">
															<input type="text" id="Fdob" name="fdob" class="form-control" placeholder="Select Farmer Birth Date..." />
														</div>
													</div>
													
													<!-- <div class="form-group">
														<label class="col-sm-3 control-label">Comment</label>
														<div class="col-sm-9">
															<textarea rows="5" class="form-control" placeholder="Type your comment..." required></textarea>
														</div>
													</div> -->
												
												</div>
												<div class="modal-footer">
													<button type="submit" class="btn btn-success">Update Farmer</button>
													<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
												</div>
												</form>
											</div>
										</div>
									</div>
		
		
	</section>

<!-- Vendor -->
		 <!-- <script src="assets/vendor/jquery/jquery.js"></script> --> 
		<script src="assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
		<!-- <script src="assets/vendor/bootstrap/js/bootstrap.js"></script> -->
		<script src="assets/vendor/nanoscroller/nanoscroller.js"></script>
		<script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="assets/vendor/magnific-popup/magnific-popup.js"></script>
		<script src="assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>
		
		<!-- Specific Page Vendor -->
		<script src="assets/vendor/select2/select2.js"></script>
		<script src="assets/vendor/jquery-datatables/media/js/jquery.dataTables.js"></script>
		<script src="assets/vendor/jquery-datatables/extras/TableTools/js/dataTables.tableTools.min.js"></script>
		<script src="assets/vendor/jquery-datatables-bs3/assets/js/datatables.js"></script>
		
		<!-- Theme Base, Components and Settings -->
		<script src="assets/javascripts/theme.js"></script>
		
		<!-- Theme Custom -->
		<script src="assets/javascripts/theme.custom.js"></script>
		
		<!-- Theme Initialization Files -->
		<script src="assets/javascripts/theme.init.js"></script>


		<!-- Examples -->
		<script src="assets/javascripts/tables/examples.datatables.default.js"></script>
		<script src="assets/javascripts/tables/examples.datatables.row.with.details.js"></script>
		<script src="assets/javascripts/tables/examples.datatables.tabletools.js"></script>
</body>
</html>