<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


     



	<form name="form" onsubmit="return kontrol();" action='<s:url value="/SecenekEkle"></s:url>'>

		<div class="container">
			<br>
			<h3>Seçenek İşlemleri</h3>
			<br> <br>

			<div action="/SecenekEkle/{sid}/"
				class="p-3 mb-2 bg-warning text-dark">${s.getSoruAdi()}</div>
		</div>
	</form>
	<br>
	
	   <div class="container">
		<div class="row">
			<div class="col-sm-6">
			<form action='<s:url value="/dataAl/${s.getSid() }"></s:url>' method="post">
				<input id="soruid" name="cvp" type="text" class="form-control "
					placeholder="Cevap Oluştur"> <label for=""></label>
			</div>
			<div class="col-sm-3">
				<div class="form-inline">
					<label class="col-sm-3">Cevap</label> <select name="cevap"
						class="form-control col-sm-9">
						<option value="">Seçiniz</option>
						<option value="yanlis">Yanlış</option>
						<option value="dogru">Doğru</option>
					</select>
				</div>
			</div>
			<div class="col-sm-3">
			<button type="submit" class="btn btn-danger">Ekle</button>
				</form>
			</div>
		</div>
	</div>
	
	
	
	<div class="container">
	<div class="row">
	<div class="col-sm-2"></div>
	<div class="col-sm-8">
	
	    <c:if test="${not empty lp }">	
					<table class="table table-hover">
						<thead>
							<tr>
								
								<th scope="col">secenek</th>
								<th scope="col">durum</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
					

							<c:forEach var="item" items="${ lp }">
								<tr>
									
									<td>${ item.getSecenek() }</td>
									  <td>${ item.getSdurum() }</td>
                                       <td><a role="button" class="btn btn-danger" href='<s:url value="/secenekSil/${ item.getSoruid()}/${ item.getSecenekid()}"></s:url>' >Sil</a></td>
                                   
								</tr>
							</c:forEach>

						</tbody>
					</table>
				
</c:if>
	
	
	</div>
	<div class="col-sm-2"></div>
	</div>
	</div>
	
	
	
	
	
	
	
	
</body>
</html>