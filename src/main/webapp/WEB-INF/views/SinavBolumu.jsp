<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>



	<form action='<s:url value="/sinavBasla"></s:url>' method="post">
		<div class="container">
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<br> <input id="adi" name="adi" type="text"
						class="form-control " placeholder="Adınız"> <label></label>
					<input id="soyadi" name="soyadi" type="text" class="form-control "
						placeholder="Soyadınız"> <label></label> <br>

					<center>
						<button type="submit" class="btn btn-success">SINAV KAYIT</button>
					</center>
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>

	</form>

	<br>

	<c:if test="${ empty sinavBitti }">
		<div class="container">
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<c:if test="${ empty sinavBasla }">
						<a href='<s:url value="/sinavBasladi"></s:url>'>
							<button type="button" class="btn btn-primary btn-lg btn-block">
								BAŞLA</button>
						</a>
					</c:if>
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>











		<div class="row container-fluid">
			<div class="col-sm-12" align="center">
				<div class="card" style="width: 50rem;">
					<div class="card-body">
						<div class="form-group">
							<form action='<s:url value="/sinavBasladi"></s:url>'
								method="POST">
								<h3>${ i }-${ soru}</h3>
								<c:if test="${ not empty secenekLs }">
									<c:forEach var="item" items="${ secenekLs }">
										<div class="form-group row container-fluid ">
											<div class="custom-control custom-radio">
												<input type="radio" id="${ item.getSecenekid() }"
													name="exampleRadios" value="${ item.getSecenekid() }"
													class="custom-control-input"> <label
													class="custom-control-label" for="${ item.getSecenekid() }">${ item.getSecenek() }</label>
											</div>
										</div>
									</c:forEach>
									<div class=row>
										<div class=col-sm-12 align="right">
											<input type="submit" value="ILERI"
												class="btn btn-outline-danger btn-sm">
										</div>
									</div>
								</c:if>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>




	</c:if>
	<c:if test="${not empty sinavBitti }">
<center><h1>Sınavınız Bitmiştir</h1></center>
		
	</c:if>













</body>
</html>