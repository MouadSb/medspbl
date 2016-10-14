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
<title>Test</title>
</head>
<style>

#ulNav{
	margin-left: 0px;
	}


@media (min-width: 1500px){
#ulNav{
	margin-left: 280px;
}

@media only screen 
and (min-device-width : 768px) 
and (max-device-width : 1024px) 
and (orientation : landscape){
  #ulNav{
	margin-left: 0px;
	}
}


div#headerRoche{
	background-color: black; 
	height: 45px; 
	width: 80px;
}

#headerLogo{
background-image: url('/MedicalGap/resources/images/medicalgaplogo.png'); 
			padding-bottom: 3%;
			height: 63px; width: 272px;
			background-size: contain;
	    	background-repeat: no-repeat; 
	    	display: block;
 			margin-left: auto;
  			margin-right: auto;
  			margin-top: 30px;
}









</style>
<body >
<%@include file="includes/link.jsp"%>
	<div class="container-fluid">
		<div  class="container-fluid" 
		style=" position: relative;
		text-align: center;
		margin-top:10px;  padding-bottom: 3%;
		height: 80px; max-width: 100%;
		">
	<div class="row">
		<div  class="container pull-right" id="headerRoche">
		</div>
	
		<div style="cursor: pointer;" class="container pull-left" id="headerLogo" onclick="gotoCat();">
		</div>
	
	</div>
	
	
	</div>
	</div>

	<%@include file="includes/script.jsp"%>
<script>


$(document).ready(function(){
	var userAgent = window.navigator.userAgent.toLowerCase(),
    ios = /iphone|ipod|ipad/.test( userAgent );
    var size = $(window).width(); 
	if(ios||size<1400){
		document.getElementById("headerRoche").style.backgroundImage = "url('/MedicalGap/resources/images/roche.png')";
		document.getElementById("headerRoche").style.width = "80px";
		document.getElementById("headerRoche").style.height = "45px";
		document.getElementById("headerRoche").style.paddingBottom  = "3%";
		document.getElementById("headerRoche").style.maxHeight  = "80px";
		document.getElementById("headerRoche").style.maxWidth  = "114px";
		document.getElementById("headerRoche").style.backgroundSize  = "contain";
		document.getElementById("headerRoche").style.backgroundRepeat  = "no-repeat";
		document.getElementById("headerRoche").style.display  = "block";
		document.getElementById("headerRoche").style.marginLeft  = "auto";
		document.getElementById("headerRoche").style.marginRight  = "auto";
		document.getElementById("headerRoche").style.marginTop  = "20px";

		document.getElementById("headerLogo").style.backgroundImage = "url('/MedicalGap/resources/images/medicalgaplogo.png')";
		document.getElementById("headerLogo").style.width = "200px";
		document.getElementById("headerLogo").style.height = "70px";
		document.getElementById("headerLogo").style.paddingBottom  = "3%";
		document.getElementById("headerLogo").style.maxHeight  = "70px";
		document.getElementById("headerLogo").style.maxWidth  = "200px";
		document.getElementById("headerLogo").style.backgroundSize  = "contain";
		document.getElementById("headerLogo").style.backgroundRepeat  = "no-repeat";
		document.getElementById("headerLogo").style.display  = "block";
		document.getElementById("headerLogo").style.marginLeft  = "auto";
		document.getElementById("headerLogo").style.marginRight  = "auto";
		document.getElementById("headerLogo").style.marginTop  = "20px";

		
		}

		
	});

</script>
</body>
</html>