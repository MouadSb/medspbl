<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<head>
<title>Medicalgap - Bienvenue</title>

<link rel="stylesheet" type="text/css"
	href="/MedicalGap/resources/css/bootstrap.min.css">
</head>
<link rel="stylesheet" href="resources/css/costum_stylel.css">

<body onload='document.loginForm.username.focus();'>

	<img  alt="welcome"
		style="width: 100%; height: 100%; opacity: 1;" id="imageID">


	<div id="divlogin" style="display: none;">

		<img src="/MedicalGap/resources/images/HeaderWelcome.png"
			alt="Medical Gap" style="max-height: 100%; max-width: 100%;">
		<div id="backgroundLogin"
			style="width: 100%; height: 100%;  background-repeat: no-repeat; background-size: cover; background-position: center;">


			<div class="container-fluid pull-right" id="bodyCat">
				<div class="container-fluid" id="idDivContainer">

					<form name='loginForm'
						action="<c:url value='/j_spring_security_check' />" method='POST'>

						<table>
							<tr>
								<td><input type='text' name='username'
									placeholder="Nom d'utilisateur"
									class="form-control input_s col-xs-3"
									style="margin-bottom: 12%"></td>
							</tr>
							<tr>
								<td><input type='password' name='password'
									placeholder="Mot de passe"
									class="form-control input_s col-xs-3 "
									style="margin-bottom: 8%" /></td>
							</tr>
							<tr>
								<td colspan='2'><input name="submit" type="submit"
									id="btn_valid" class="btn  btn-add btn-lg pull-right"
									value="Connexion" /></td>
							</tr>
							
						</table>
						<a href="#" id="hrf_forgot">Mot de passe oublié?</a>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<c:if test="${not empty error}">
							<div class="error">${error}</div>
						</c:if>
						<c:if test="${not empty msg}">
							<div class="msg">${msg}</div>
						</c:if>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="forms/passwordform.jsp"%>
	<script type="text/javascript" charset="utf8"
		src="/MedicalGap/resources/js/jquery.min.js"></script>
	<script type="text/javascript" charset="utf8"
		src="/MedicalGap/resources/js/bootstrap.min.js"></script>
		
	<script>
	 	setTimeout(function() {
			document.getElementById('imageID').style.display = 'none';
			document.getElementById('divlogin').style.display = 'block';
			document.body.style.overflow = 'hidden';
		}, 10 * 200); 
	</script>
	<script>
	
	$("#hrf_forgot").click(function(e) {
		
			$('#modalForgotten').modal('show');

	});


	$("#btn_reg").click(function(){

		$.post("/MedicalGap/passwordforget", {
			"usname" : document.getElementById("usernamef").value,
			"emaile" : document.getElementById("emailf").value,
		}, function(data) {
			
		});
		});

	</script>
</body>
</html>