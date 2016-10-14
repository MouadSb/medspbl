<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="includes/link.jsp"%>
<title>Espace utilisateur</title>
</head>
<style>

#headerRocheM{
background-image: url('/MedicalGap/resources/images/roche.png'); 
			padding-bottom: 3%;
			max-height: 57px; max-width: 114px;
			background-size: contain;
	    	background-repeat: no-repeat; 
	    	display: block;
 			margin-left: auto;
  			margin-right: auto;
}

.errorCUTPF, .errorCUEP, .errorCUPPP{
	display : none;
}

#errorC{
	color : red;
	font-weight: bold;
	margin-top : 3px;
	font-size: 12px;
}

</style>

<body>
	<div class="container-fluid">
		<%@include file="includes/navbar.jsp"%>
		
		<%@include file="forms/profilform.jsp" %>
	</div>
	<%@include file="includes/script.jsp"%>
</body>

<script>
	$(document).ready(function(){
		$('#navSearch').css('display','none');
		});

	
		function modifyProfil(){

			var xtt =  document.getElementsByClassName("telmodifyL");
			var xte =  document.getElementsByClassName("errorCUEP");
			var xtpp =  document.getElementsByClassName("errorCUPPP");


				$.post("/MedicalGap/profil/edit", {
					"usname" : document.getElementById("usname").value,
					"telephonee" : document.getElementById("telephonee").value,
					"emaile" : document.getElementById("emaile").value,
					"passworde" : document.getElementById("passworde").value,
				}, function(data) {
					if(data === "Le numero du téléphone est trop court."){
						xtt[0].innerHTML = "Le numero du téléphone est trop court.";		
						xtt[0].style.display = "block";
						}
					else if(data === "Le numero du téléphone est trop long."){
						document.getElementById("errorC").style.display = "block";
						xtt[0].innerHTML = "Le numero du téléphone est trop court.";		
						xtt[0].style.display = "block";
						}
					else if(data === "Email incorrecte."){
						xte[0].innerHTML = data;		
						xte[0].style.display = "block";
						}
					else if(data === "Email incorrecte."){
						document.getElementById("errorC").style.display = "block";
						xte[0].innerHTML = data;		
						xte[0].style.display = "block";
						}
					else if(data === "Le mot de passe saisie est trop court."){
						xtpp[0].innerHTML = data;		
						xtpp[0].style.display = "block";
						}
					else if(data === "Le mot de passe saisie est trop long."){
						document.getElementById("errorC").style.display = "block";
						xtpp[0].innerHTML = data;		
						xtpp[0].style.display = "block";
						}else if(data === "success"){
							location.reload();
						}
					});
			}
</script>
</html>
