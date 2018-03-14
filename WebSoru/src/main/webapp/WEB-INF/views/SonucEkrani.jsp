<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<br>
<br>

<form action='<s:url value="/sonucGetir"></s:url>' method="post">

<div class="container">
<div class="row">
<div class="col-sm-2">
</div>
<div class="col-sm-8">
  <div class="col-sm-8">
  
  <input id="ad" name="ad" type="text" class="form-control "
					placeholder="Adınız">
  
  </div>
  <label></label>
  <div class="col-sm-8">
  <input id="soyad" name="soyad" type="text" class="form-control "
					placeholder="Soyadınız">
  </div>
  <label></label>
  <div class="col-sm-4">
  <button type="submit" class="btn btn-info">SONUÇ</button>
  </div>

</div>
<div class="col-sm-2">
</div>
</div>
</div>
</form>

<br>

<center><h3>Sonuçlarınız!!!</h3></center>
<div class="container">
<div class="row">
<div class="col-sm-2"></div>
<div class="col-sm-8">

<c:if test="${not empty sg }">	
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">No</th>
								<th scope="col">soru</th>
								<th scope="col">seçenek</th>
								<th scope="col">cevap</th>
							</tr>
						</thead>
						<tbody>
					

							<c:forEach var="item" items="${ sg }">
								<tr>
									<td>${ item.getSid() }</td>
									<td>${ item.getSoruAdi() }</td>
                                    <td>${ item.getSecenek() }</td>
                                    <td>${ item.getSdurum() }</td>
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