
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page session="true"%>
<script type="text/javascript" charset="utf8"
	src="/MedicalGap/resources/js/jquery.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="/MedicalGap/resources/js/bootstrap.min.js"></script>
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


#headerRoche{
background-image: url('/MedicalGap/resources/images/roche.png'); 
			padding-bottom: 3%;
			max-height: 57px; max-width: 114px;
			background-size: contain;
	    	background-repeat: no-repeat; 
	    	display: block;
 			margin-left: auto;
  			margin-right: auto;
  			margin-top: 30px;
}

#headerLogo{
background-image: url('/MedicalGap/resources/images/medicalgaplogo.png'); 
			padding-bottom: 3%;
			max-height: 63px; max-width: 272px;
			background-size: contain;
	    	background-repeat: no-repeat; 
	    	display: block;
 			margin-left: auto;
  			margin-right: auto;
  			margin-top: 30px;
}

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

#headerLogoM{
background-image: url('/MedicalGap/resources/images/medicalgaplogo.png'); 
			padding-bottom: 3%;
			max-height: 63px; max-width: 272px;
			background-size: contain;
	    	background-repeat: no-repeat; 
	    	display: block;
 			margin-left: 60px;
  			margin-right: auto;
  			
}









</style>
<%@include file="link.jsp"%>
<div  class="container-fluid" 
		style=" position: relative;
		padding: 14px 0;
		">
	
		<div class="pull-right" style="position: absolute;right: 0;top: 45px;margin-top: -22.75px;">
			<img src="/MedicalGap/resources/images/roche.png" style="
    width: 80%;" class="pull-right">
		</div>
	
		<div style="cursor: pointer;" class=" pull-left" onclick="gotoCat();">
			<img src="/MedicalGap/resources/images/medicalgaplogo.png" style="
    height: 100%;">
		</div>
	
	</div>




<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<p>Aucune ligne sélectionnée.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<nav class="navbar navbar-inverse navbar-static-top">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="visible-xs navbar-brand">Menu</span>
			</button>

		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav" id="ulNav" >

				<li><a href="/MedicalGap/registres/registre">Registres des
						cancers</a></li>
				<li><a href="/MedicalGap/congresses/congresses">Congresses</a></li>
				<li><a href="/MedicalGap/tae/tae">TAE</a></li>
				<li><a href="/MedicalGap/pressesantes/pressesantes">Presse sante</a></li>
				<li><a href="/MedicalGap/guidelines/guidelines">Guidelines</a></li>
				<li><a href="/MedicalGap/medicaleactivities/medicaleactivities">Medical activities</a></li>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li><a href="/MedicalGap/admin/admin">Administration</a></li>
				</sec:authorize>
			</ul>
			
			<ul class="nav navbar-nav navbar-right" style="margin: 0;">
				<li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
					<img
			src="/MedicalGap/resources/images/icone_profil.png"
			style="max-height: 26px; max-width: 26px; padding-bottom: 3px;" alt="image">
					 </a>
		          	<ul class="dropdown-menu">
		            <li><a href="/MedicalGap/profil">Profil</a></li>
		            <li><a href="<c:url value="/logout" />">Deconnexion</a></li>
		          </ul>
		        </li>
				<li><a href="<c:url value="/index" />" > <img
			src="/MedicalGap/resources/images/Categorie.png"
			style="max-height: 26px; max-width: 26px; padding-bottom: 3px;" alt="image"></a></li>
			</ul>
		</div>
		</div>
		
	
	<!-- /.container-fluid -->
</nav>
<div class="row">
	<div class="pull-right">
		<a href="/MedicalGap/index"> 
		</a>
	</div>
</div>
<div class="container barnavboot" id="navSearch"
	style="background-image: url('/MedicalGap/resources/images/pattable.png'); background: url('/MedicalGap/resources/images/pattable.png') no-repeat
		center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	background-size: cover;
	-o-background-size: cover;
	height: 100%;
	width : 100%;
	">
	<div class="pull-right">
		<form action="#" method="get">
			<div class="input-group ">
				<input class="form-control" id="system-search" name="q"
					placeholder="Rechercher" required >
			</div>
		</form>
	</div>
</div>
<style>
.navbar-nav>li>a,.navbar-brand {
	padding-top: 8px !important;
	padding-bottom: 0 !important;
	height: 35px;
}

.navbar {
	min-height: 28px !important;
}

.navbar {
	margin-bottom: 0%;
}

img {
	width: 100%;
	height: auto;
}
</style>

<script>

	function gotoCat(){
		window.location.replace("/MedicalGap/index");
	}


</script>