<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />

<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />

<script type="text/javascript">
		function getCurrDate() {
			var d = new Date();
			var month = d.getMonth() + 1;
			var day = d.getDate();
			var output = (day < 10 ? '0' : '') + day + '-'
					+ (month < 10 ? '0' : '') + month + '-' + d.getFullYear();
			document.getElementById("TodaysDate").value = output;
			document.getElementById("TodaysDate1").value = output;
		}
	</script>
</head>
<body onload="getCurrDate()">
	<script type="text/javascript">
	$(function() {
		$("#TodaysDate").datepicker({
			dateFormat : "dd-mm-yy",
			changeMonth : true,
			changeYear : true
		}).val()
	});
	</script>

	<div class="row">
		<div class="col-md-12">
			<h3><strong>Cow Base Rate Master Page</strong></h3>
		</div>
	</div>
	<!-- justified -->
	<div class="row">
		<div class="col-md-12">
			<div class="tabs">
				<ul class="nav nav-tabs nav-justified">
					<li class="active"><a href="#popular10" data-toggle="tab"
						class="text-center"><i class="fa fa-star"></i> Basic Rate Master</a></li>
					<li><a href="#recent10" data-toggle="tab" class="text-center">Change Rate Increase or Decrease</a>
					</li>
				</ul>
				<div class="tab-content">
					<div id="popular10" class="tab-pane active">
						<div class="row">
							<div class="col-md-12 col-lg-12 col-xl-4">
								<div class="row">
									<c:forEach var="v" items="${BaseRates}">
										<!-- <div class="col-md-6 col-xl-12">
										<section class="panel">
											<div class="panel-body bg-primary">
												<div class="widget-summary">
													<div class="widget-summary-col widget-summary-col-icon">
														<div class="summary-icon">
															<i class="fa fa-life-ring xs"></i>
														</div>
													</div>
													<div class="widget-summary-col">
														<div class="summary">
															<h4 class="title">Support Questions</h4>
															<div class="info">
																<strong class="amount">1281</strong>
															</div>
														</div>
													</div>
												</div>
											</div>
										</section>
									</div> -->

										<div class="col-md-6 col-xl-12">
											<section class="panel">
												<div class="panel-body bg-primary">
													<div class="widget-summary">
														<div class="widget-summary-col">
															<div class="summary">
																<h4 class="title">Current Base Fat</h4>
																<div class="info">
																	<strong class="amount">${v.fat}</strong>
																</div>
															</div>
															<!-- <div class="summary-footer">
															<a class="text-uppercase">(view all)</a>
														</div> -->
														</div>
													</div>
												</div>
											</section>
										</div>
										<div class="col-md-6 col-xl-12">
											<section class="panel">
												<div class="panel-body bg-secondary">
													<div class="widget-summary">
														<div class="widget-summary-col">
															<div class="summary">
																<h4 class="title">Current Base SNF</h4>
																<div class="info">
																	<strong class="amount">${v.snf}</strong>
																</div>
															</div>
														</div>
													</div>
												</div>
											</section>
										</div>

										<div class="col-md-6 col-xl-12">
											<section class="panel">
												<div class="panel-body bg-tertiary">
													<div class="widget-summary">
														<div class="widget-summary-col">
															<div class="summary">
																<h4 class="title">Current Base Rate</h4>
																<div class="info">
																	<strong class="amount">${v.milkrate}</strong>
																</div>
															</div>
														</div>
													</div>
												</div>
											</section>
										</div>
										<div class="col-md-6 col-xl-12">
											<section class="panel">
												<div class="panel-body bg-quartenary">
													<div class="widget-summary">
														<div class="widget-summary-col">
															<div class="summary">
																<h4 class="title">Date of Last Changed</h4>
																<div class="info">
																	<strong class="amount">${v.dateofchange}</strong>
																</div>
															</div>
														</div>
													</div>
												</div>
											</section>
										</div>
										<div class="col-md-6 col-xl-12">
											<button class="btn btn-success text-white btn-xl"
												data-toggle="modal" data-target="#modalBootstrapUpdate"
												onclick="updateFarmer('${v.id }','${v.fat}','${v.snf}','${v.milkrate}')">Change
												/ Update Base Rate</button>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<!--  -->
						<div class="row">
							<div class="col-md-12">
								<div class="panel-group" id="accordion">
									<div class="panel panel-accordion">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse"
													data-parent="#accordion" href="#collapse1Three"> See
													All Basic Rate Changed Details Records </a>
											</h4>
										</div>
										<div id="collapse1Three" class="accordion-body collapse">
											<div class="panel-body">

												<table class="table table-bordered table-striped mb-none"
													id="datatable-tabletools">
													<thead>
														<tr>
															<th class="text-center">Id</th>
															<th class="text-center">Date of Rate Changes</th>
															<th class="text-center">Fat</th>
															<th class="text-center">SNF</th>
															<th class="text-center">Rate</th>
															<th class="text-center">Status</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="v" items="${AllBaseRates}">
															<tr class="">
																<td class="text-center"><c:out value="${v.id}"></c:out></td>
																<td class="text-center"><c:out
																		value="${v.dateofchange}"></c:out></td>
																<td class="text-center"><c:out value="${v.fat}"></c:out></td>
																<td class="text-center"><c:out value="${v.snf}"></c:out></td>
																<td class="text-center"><c:out
																		value="${v.milkrate}"></c:out></td>
																<td class="text-center"><c:out value="${v.flag}"></c:out></td>
															</tr>
														</c:forEach>
													</tbody>
												</table>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>


						<!--  -->
					</div>
					<div id="recent10" class="tab-pane">
						<div id="popular10" class="tab-pane active">
						<div class="row">
							<div class="col-md-12 col-lg-12 col-xl-4">
								<div class="row">
									<c:forEach var="v" items="${BaseRates}">
										<div class="col-md-3 col-xl-12">
											<section class="panel">
												<div class="panel-body bg-primary">
													<div class="widget-summary">
														<div class="widget-summary-col">
															<div class="summary">
																<h4 class="title">Current Base Fat</h4>
																<div class="info">
																	<strong class="amount">${v.fat}</strong>
																</div>
															</div>
															<!-- <div class="summary-footer">
															<a class="text-uppercase">(view all)</a>
														</div> -->
														</div>
													</div>
												</div>
											</section>
										</div>
										<div class="col-md-3 col-xl-12">
											<section class="panel">
												<div class="panel-body bg-secondary">
													<div class="widget-summary">
														<div class="widget-summary-col">
															<div class="summary">
																<h4 class="title">Current Base SNF</h4>
																<div class="info">
																	<strong class="amount">${v.snf}</strong>
																</div>
															</div>
														</div>
													</div>
												</div>
											</section>
										</div>

										<div class="col-md-3 col-xl-12">
											<section class="panel">
												<div class="panel-body bg-tertiary">
													<div class="widget-summary">
														<div class="widget-summary-col">
															<div class="summary">
																<h4 class="title">Current Base Rate</h4>
																<div class="info">
																	<strong class="amount">${v.milkrate}</strong>
																</div>
															</div>
														</div>
													</div>
												</div>
											</section>
										</div>
										<div class="col-md-3 col-xl-12">
											<section class="panel">
												<div class="panel-body bg-quartenary">
													<div class="widget-summary">
														<div class="widget-summary-col">
															<div class="summary">
																<h4 class="title">Date of Last Changed</h4>
																<div class="info">
																	<strong class="amount">${v.dateofchange}</strong>
																</div>
															</div>
														</div>
													</div>
												</div>
											</section>
										</div>
										<%-- <div class="col-md-6 col-xl-12">
											<button class="btn btn-success text-white btn-xl"
												data-toggle="modal" data-target="#modalBootstrapUpdate"
												onclick="updateFarmer('${v.id }','${v.fat}','${v.snf}','${v.milkrate}')">Change
												/ Update Base Rate</button>
										</div> --%>
									</c:forEach>
									<c:forEach var="v" items="${ChangedRateCow}">
										<div class="col-md-6 col-xl-12">
											<section class="panel">
												<div class="panel-body bg-quartenary">
													<div class="widget-summary">
														<div class="widget-summary-col">
															<div class="summary">
																<h4 class="title">Increase Fat By one Point</h4>
																<div class="info">
																	Rate >> by : <strong class="amount"> ${v.fatincreaserate}</strong>
																</div>
															</div>
														</div>
													</div>
												</div>
											</section>
										</div>
										<div class="col-md-6 col-xl-12">
											<section class="panel">
												<div class="panel-body bg-secondary">
													<div class="widget-summary">
														<div class="widget-summary-col">
															<div class="summary">
																<h4 class="title">Decrease Fat By Per Point</h4>
																<div class="info">
																	Rate << by :<strong class="amount"> ${v.fatdecreaserate}</strong>
																</div>
															</div>
														</div>
													</div>
												</div>
											</section>
										</div>
										<div class="col-md-6 col-xl-12">
											<section class="panel">
												<div class="panel-body bg-quartenary">
													<div class="widget-summary">
														<div class="widget-summary-col">
															<div class="summary">
																<h4 class="title">Increase SNF By one Point</h4>
																<div class="info">
																	Rate >> By :<strong class="amount"> ${v.snfincreaserate}</strong>
																</div>
															</div>
														</div>
													</div>
												</div>
											</section>
										</div>
										<div class="col-md-6 col-xl-12">
											<section class="panel">
												<div class="panel-body bg-secondary">
													<div class="widget-summary">
														<div class="widget-summary-col">
															<div class="summary">
																<h4 class="title">Decrease SNF By Per Point</h4>
																<div class="info">
																	Rate << By :<strong class="amount"> ${v.snfdecreaserate}</strong>
																</div>
															</div>
														</div>
													</div>
												</div>
											</section>
										</div>
										<div class="col-md-6 col-xl-12">
											<section class="panel">
												<div class="panel-body bg-secondary">
													<div class="widget-summary">
														<div class="widget-summary-col">
															<div class="summary">
																<h4 class="title">Decrease SNF By Per Point</h4>
																<div class="info">
																	<strong class="amount">${v.dateofchange}</strong>
																</div>
															</div>
														</div>
													</div>
												</div>
											</section>
										</div>
											<div class="col-md-6 col-xl-12">
												<section class="panel">
													<div class="panel-body bg-success" style="cursor: pointer;" data-toggle="modal"
														data-target="#modalBootstrapUpdate1"
														onclick="updateChangedRate('${v.id}','${v.fatincreaserate}','${v.fatdecreaserate}','${v.snfincreaserate}','${v.snfdecreaserate}','${v.dateofchange}')">
														<div class="widget-summary">
															<div class="widget-summary-col">
																<div class="summary">
																	<h4 class="title">Update Rates</h4>
																	<div class="info">
																		<button class="btn btn-success text-white btn-xl">Click Here to Update Rates</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</section>
											</div>
										</c:forEach>
									</div>
							</div>
						</div>
						<!--  -->
					    <div class="row">
							<div class="col-md-12">
								<div class="panel-group" id="accordion">
									<div class="panel panel-accordion">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse"
													data-parent="#accordion" href="#collapse1Three1"> See
													All Increment Decrement Record Details </a>
											</h4>
										</div>
										<div id="collapse1Three1" class="accordion-body collapse">
											<div class="panel-body">

												<table class="table table-bordered table-striped mb-none"
													id="datatable-tabletools">
													<thead>
														<tr>
															<th class="text-center">Id</th>
															<th class="text-center">Date of Rate Changes</th>
															<th class="text-center">Fat >>> </th>
															<th class="text-center">Fat <<< </th>
															<th class="text-center">SNF >>> </th>
															<th class="text-center">SNF <<< </th>
															<th class="text-center">Status</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="v" items="${AllChangedRateCow}">
															<tr class="">
																<td class="text-center"><c:out value="${v.id}"></c:out></td>
																<td class="text-center"><c:out value="${v.dateofchange}"></c:out></td>
																<td class="text-center"><c:out value="${v.fatincreaserate}"></c:out></td>
																<td class="text-center"><c:out value="${v.fatdecreaserate}"></c:out></td>
																<td class="text-center"><c:out value="${v.snfincreaserate}"></c:out></td>
																<td class="text-center"><c:out value="${v.snfdecreaserate}"></c:out></td>
																<td class="text-center"><c:out value="${v.flag}"></c:out></td>
															</tr>
														</c:forEach>
													</tbody>
												</table>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div> 
						<!--  -->
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">
		function updateFarmer(a, b, c, d) {
			$("#RateID").val(a);
			$("#Fat").val(b);
			$("#Snf").val(c);
			$("#MilkRate").val(d);
		}
	</script>

	<!-- Update/Edit -->
	<div class="modal fade" id="modalBootstrapUpdate" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Update Base Rate</h4>
				</div>
				<form action="UpdateBaseRate" method="post" id="demo-form"
					class="form-horizontal mb-lg" novalidate="novalidate">
					<div class="modal-body">
						<div class="form-group mt-lg">
							<label class="col-sm-3 control-label">Enter Fat</label>
							<div class="col-sm-9">
								<input type="hidden" id="RateID" name="rateId"
									class="form-control" readonly required /> <input type="text"
									id="Fat" name="fat" class="form-control"
									placeholder="Type Fat..." required />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Enter SNF</label>
							<div class="col-sm-9">
								<input type="text" id="Snf" name="snf" class="form-control"
									placeholder="Type SNF..." required />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Enter Milk Rate</label>
							<div class="col-sm-9">
								<input type="text" id="MilkRate" name="milkrate"
									class="form-control" placeholder="Type Milk Rate..." required />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Select Date</label>
							<div class="col-sm-9">
								<input type="text" id="TodaysDate" name="dateofchange"
									class="form-control" placeholder="Select Date..." />
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success">Update Base
							Rate</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function updateChangedRate(a, b, c, d, e, f) {
			$("#ID").val(a);
			$("#Fatp").val(b);
			$("#Fatm").val(c);
			$("#Snfp").val(d);
			$("#Snfm").val(e);
		}
	</script>
	<div class="modal fade" id="modalBootstrapUpdate1" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Update Cow Increment Decrement Rate</h4>
				</div>
				<form action="UpdateChangedRate" method="post" id="demo-form"
					class="form-horizontal mb-lg" novalidate="novalidate">
					<div class="modal-body">
						<div class="form-group mt-lg">
							<label class="col-sm-3 control-label">Fat >></label>
							<div class="col-sm-9">
								<input type="hidden" id="ID" name="changeRateIdCow"
									class="form-control" readonly required /> <input type="text"
									id="Fatp" name="fatincreaserate" class="form-control"
									placeholder="Type For Increase Fat..." required />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Fat << </label>
							<div class="col-sm-9">
								<input type="text" id="Fatm" name="fatdecreaserate" class="form-control"
									placeholder="Type For Decrease Fat..." required />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">SNF >></label>
							<div class="col-sm-9">
								<input type="text" id="Snfp" name="snfincreaserate"
									class="form-control" placeholder="Type For Increase SNF..." required />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">SNF <<</label>
							<div class="col-sm-9">
								<input type="text" id="Snfm" name="snfdecreaserate"
									class="form-control" placeholder="Type For Decraese SNF" required />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Select Date</label>
							<div class="col-sm-9">
								<input type="text" id="TodaysDate1" name="dateofchange"
									class="form-control" placeholder="Select Date..." />
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success">Update Changed
							Rate</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>