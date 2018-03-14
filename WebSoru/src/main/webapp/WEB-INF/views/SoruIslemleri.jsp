<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
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




   
	

  <br>
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<h3>Yeni Soru Oluşturma</h3>
				<br>
				
                	<c:if test="${not empty hata }">
				  <div class="alert alert-danger alert-dismissible fade show" role="alert">
                   <strong>Hata!</strong> ${ hata }
                   <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                   <span aria-hidden="true">&times;</span>
                   </button>
                  </div>
				</c:if>


				<form action='<s:url value="/SoruIslemleri/1/soruAl"></s:url>' method="post">
					<input id="soru" name="soru"  type="text"
						class="form-control " placeholder="Soru"> <label
						class="col-sm-8" for=""></label>

					<button type="submit" class="btn btn-success col-sm-4">Ekle</button>


				</form>
			</div>
			<div class="col-sm-6">
				<h3>Soru Düzenle-Sil</h3>

				<c:if test="${not empty ls }">	
					<table class="table table-hover">
						<thead>
							<tr>
								
								<th scope="col">soruAdi</th>
								<th scope="col"></th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
					

							<c:forEach var="item" items="${ ls }">
								<tr>
									
									<td>${ item.getSoruAdi() }</td>
									  <td><a role="button" class="btn btn-primary" href='<s:url value="/SecenekEkle/${ item.getSid() }"></s:url>' >Secenek Ekle</a></td>
                                       <td><a role="button" class="btn btn-danger" href='<s:url value="/SoruSil/${ item.getSid()}"></s:url>' >Sil</a></td>
                                   
								</tr>
							</c:forEach>

						</tbody>
					</table>
				
</c:if>






			</div>



		</div>
	</div>








</body>
</html>