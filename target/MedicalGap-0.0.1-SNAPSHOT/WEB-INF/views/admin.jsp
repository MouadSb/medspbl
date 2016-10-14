<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@page session="true"%>

<!DOCTYPE html>
<html lang="fr">
<head>
<title>Administration</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

.btn-maj, .btn-delete{
	color: white;
	background-color: #0394e3;
	border-color: transparent;
}


/* make sidebar nav vertical */
@media ( min-width : 768px) {
	.sidebar-nav .navbar .navbar-collapse {
		padding: 0;
		max-height: none;
	}
	.sidebar-nav .navbar ul {
		float: none;
		display: block;
	}
	.sidebar-nav .navbar li {
		float: none;
		display: block;
	}
	.sidebar-nav .navbar li a {
		padding-top: 12px;
		padding-bottom: 12px;
	}
}

.barnavboot {
	display: none;
}

.adminBar {
	background: url('/MedicalGap/resources/images/pattable.png') no-repeat
		center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	background-size: cover;
	-o-background-size: cover;
	height: 100%;
	margin-left: 2%;
}

.container-fluid.col-md-12 {
	font-size: 13px;
}

#errorC{
	color : red;
		font-weight: bold;
	margin-top : 3px;
	font-size: 12px;
}

.errorCT, .errorCM, .errorCC, .errorCR, .errorCP, .errorCG, .errorCCA, .errorCUN, .errorCUPP{
	display : none;
}


#menuAdmin{ 
	color : white;
	background-color : #0394e3;
	text-align: center;
}

#rg,#cg,#tae,#ps,#gu,#ma,#ca,#user
{ color : white;
	background-color : #0394e3; }

#rg:hover,#cg:hover,#tae:hover,#ps:hover,#gu:hover,#ma:hover,#ca:hover,#user:hover
{ background-color : #444444; }

#menuAdmin{ 
	margin-top:-1px;
}

@media only screen and (max-device-width: 767px){
	#menuAdmin{ 
		margin-top:0px;
		padding-top: 15px;
    	padding-bottom: 5px;
	}
	.sidebar-nav {
    	max-width: 100% !important;
	}
	#sidenavli>li>a, .navbar-brand {
    	height: 43px;
    	font-size: 18px;
	}
}

</style>
<title>Administration</title>
</head>
<body >

	<div class="container-fluid">
		<%@include file="includes/navbar.jsp"%>

		<div class="row"
			style=" margin-right: 17px;">
			<div class="col-sm-3"  >
				<div class="sidebar-nav" style="max-width: 200px;">
					<div class="navbar navbar-default" role="navigation">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" 
								data-toggle="collapse" data-target=".sidebar-navbar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<span class="visible-xs navbar-brand">Options</span>
						</div>
						<div class="navbar-collapse collapse sidebar-navbar-collapse" id="menuAdmin">
							<ul class="nav navbar-nav" id="sidenavli">
								<li><a href="#" id="rg">Registres des cancers</a></li>
								<li><a href="#" id="cg">Congresses</a></li>
								<li><a href="#" id="tae">TAE</a></li>
								<li><a href="#" id="ps">Presse de santé</a></li>
								<li><a href="#" id="gu">Guidelines</a></li>
								<li><a href="#" id="ma">Medical activities</a></li>
								<li><a href="#" id="ca">Categories</a></li>
								<li><a href="#" id="user">Utilisateurs</a></li>
							</ul>
						</div>
						<!--/.nav-collapse -->
					</div>
				</div>
			</div>

			<div class="col-sm-9">
				<div class="registre" id="crg" style="display : none;">
					<%@include file="admin/registretype.jsp"%>
				</div>
				<div class="congresse" id="ccg" style="display : none">
					<%@include file="admin/congressestype.jsp"%>
				</div>
				<div class="tae" id="ctae" style="display : none">
					<%@include file="admin/taetype.jsp"%>
				</div>
				<div class="presse" id="cps" style="display : none">
					<%@include file="admin/pressetype.jsp"%>
				</div>
				<div class="guidline" id="cgu" style="display : none">
					<%@include file="admin/guidlinetype.jsp"%>
				</div>
				<div class="medical" id="cma" style="display : none">
					<%@include file="admin/medicaltype.jsp"%>
				</div>

				<div class="categorie" id="cca" style="display : none">
					<%@include file="admin/categorietype.jsp"%>
				</div>
				
				<div class="user" id="cuser" style="display : none">
					<%@include file="admin/usertype.jsp"%>
				</div>


			</div>
		</div>
	</div>
	<%@include file="includes/script.jsp"%>
		
	<script>

	

	
		var ul = document.getElementById('menuAdmin');
		var rg = document.getElementById('crg');
		var cg = document.getElementById('ccg');
		var tae = document.getElementById('ctae');
		var ps = document.getElementById('cps');
		var gu = document.getElementById('cgu');
		var ma = document.getElementById('cma');
		var ca = document.getElementById('cca');
		var user = document.getElementById('cuser');

		
		ul.addEventListener('click', function(e) {
			displayT(e.target.id);
		});

		var selector = '.nav li';

		$(selector).on('click', function(){
		    $(selector).removeClass('active');
		    $(this).addClass('active');
		   
		});


		function $_GET(param) {
			var vars = {};
			window.location.href.replace( location.hash, '' ).replace( 
				/[?&]+([^=&]+)=?([^&]*)?/gi, // regexp
				function( m, key, value ) { // callback
					vars[key] = value !== undefined ? value : '';
				}
			);

			if ( param ) {
				return vars[param] ? vars[param] : null;	
			}
			return vars;
		}
		
		document.addEventListener('DOMContentLoaded', function() {
		
			
			var myParam = $_GET('navchoix'); 		
			var myer = $_GET('errorAdd');
			var myerM = $_GET('errorAddM');
			var t = myParam;
			//alert(myParam);
			$(t).trigger("click");
			displayT(myParam);	
			document.getElementById(myer).click();
			}, false);
	
		function clickBouton(t){
			document.getElementById(t).click;
			}
		
		function displayT(t){
			if (t === "rg") {		
				document.getElementById('crg').style.display = "block";
				document.getElementById('rg').style.backgroundColor = "#444444";
				document.getElementById('ca').style.backgroundColor = "#0394e3";
				document.getElementById('ma').style.backgroundColor = "#0394e3";
				document.getElementById('gu').style.backgroundColor = "#0394e3";
				document.getElementById('ps').style.backgroundColor = "#0394e3";
				document.getElementById('tae').style.backgroundColor = "#0394e3";
				document.getElementById('cg').style.backgroundColor = "#0394e3";
				document.getElementById('user').style.backgroundColor = "#0394e3";
				cg.style.display = "none";
				tae.style.display = "none";
				ps.style.display = "none";
				gu.style.display = "none";
				ma.style.display = "none";
				ca.style.display = "none";
				user.style.display = "none";
			} else if (t === "cg") {
				cg.style.display = "block";
				document.getElementById('cg').style.backgroundColor = "#444444";
				document.getElementById('ca').style.backgroundColor = "#0394e3";
				document.getElementById('ma').style.backgroundColor = "#0394e3";
				document.getElementById('gu').style.backgroundColor = "#0394e3";
				document.getElementById('ps').style.backgroundColor = "#0394e3";
				document.getElementById('tae').style.backgroundColor = "#0394e3";
				document.getElementById('user').style.backgroundColor = "#0394e3";
				document.getElementById('rg').style.backgroundColor = "#0394e3";
				rg.style.display = "none";
				tae.style.display = "none";
				ps.style.display = "none";
				gu.style.display = "none";
				ma.style.display = "none";
				ca.style.display = "none";
				user.style.display = "none";
			} else if (t === "tae") {
				tae.style.display = "block";
				document.getElementById('tae').style.backgroundColor = "#444444";
				document.getElementById('ca').style.backgroundColor = "#0394e3";
				document.getElementById('ma').style.backgroundColor = "#0394e3";
				document.getElementById('gu').style.backgroundColor = "#0394e3";
				document.getElementById('ps').style.backgroundColor = "#0394e3";
				document.getElementById('user').style.backgroundColor = "#0394e3";
				document.getElementById('cg').style.backgroundColor = "#0394e3";
				document.getElementById('rg').style.backgroundColor = "#0394e3";
				cg.style.display = "none";
				rg.style.display = "none";
				ps.style.display = "none";
				gu.style.display = "none";
				ma.style.display = "none";
				ca.style.display = "none";
				user.style.display = "none";
			} else if (t === "ps") {
				ps.style.display = "block";
				document.getElementById('ps').style.backgroundColor = "#444444";
				document.getElementById('ca').style.backgroundColor = "#0394e3";
				document.getElementById('ma').style.backgroundColor = "#0394e3";
				document.getElementById('gu').style.backgroundColor = "#0394e3";
				document.getElementById('user').style.backgroundColor = "#0394e3";
				document.getElementById('tae').style.backgroundColor = "#0394e3";
				document.getElementById('cg').style.backgroundColor = "#0394e3";
				document.getElementById('rg').style.backgroundColor = "#0394e3";
				cg.style.display = "none";
				tae.style.display = "none";
				rg.style.display = "none";
				gu.style.display = "none";
				ma.style.display = "none";
				ca.style.display = "none";
				user.style.display = "none";
			} else if (t === "gu") {
				document.getElementById('gu').style.backgroundColor = "#444444";
				document.getElementById('ca').style.backgroundColor = "#0394e3";
				document.getElementById('ma').style.backgroundColor = "#0394e3";
				document.getElementById('user').style.backgroundColor = "#0394e3";
				document.getElementById('ps').style.backgroundColor = "#0394e3";
				document.getElementById('tae').style.backgroundColor = "#0394e3";
				document.getElementById('cg').style.backgroundColor = "#0394e3";
				document.getElementById('rg').style.backgroundColor = "#0394e3";
				gu.style.display = "block";
				cg.style.display = "none";
				tae.style.display = "none";
				ps.style.display = "none";
				rg.style.display = "none";
				ma.style.display = "none";
				ca.style.display = "none";
				user.style.display = "none";
			} else if (t === "ma") {
				document.getElementById('ma').style.backgroundColor = "#444444";
				document.getElementById('ca').style.backgroundColor = "#0394e3";
				document.getElementById('user').style.backgroundColor = "#0394e3";
				document.getElementById('gu').style.backgroundColor = "#0394e3";
				document.getElementById('ps').style.backgroundColor = "#0394e3";
				document.getElementById('tae').style.backgroundColor = "#0394e3";
				document.getElementById('cg').style.backgroundColor = "#0394e3";
				document.getElementById('rg').style.backgroundColor = "#0394e3";
				ma.style.display = "block";
				cg.style.display = "none";
				tae.style.display = "none";
				ps.style.display = "none";
				gu.style.display = "none";
				rg.style.display = "none";
				ca.style.display = "none";
				user.style.display = "none";
			} else if (t === "ca") {
				document.getElementById('ca').style.backgroundColor = "#444444";
				document.getElementById('user').style.backgroundColor = "#0394e3";
				document.getElementById('ma').style.backgroundColor = "#0394e3";
				document.getElementById('gu').style.backgroundColor = "#0394e3";
				document.getElementById('ps').style.backgroundColor = "#0394e3";
				document.getElementById('tae').style.backgroundColor = "#0394e3";
				document.getElementById('cg').style.backgroundColor = "#0394e3";
				document.getElementById('rg').style.backgroundColor = "#0394e3";
				ca.style.display = "block";
				cg.style.display = "none";
				tae.style.display = "none";
				ps.style.display = "none";
				gu.style.display = "none";
				ma.style.display = "none";
				rg.style.display = "none";
				user.style.display = "none";
			} else if (t === "user") {
				document.getElementById('user').style.backgroundColor = "#444444";
				document.getElementById('ca').style.backgroundColor = "#0394e3";
				document.getElementById('ma').style.backgroundColor = "#0394e3";
				document.getElementById('gu').style.backgroundColor = "#0394e3";
				document.getElementById('ps').style.backgroundColor = "#0394e3";
				document.getElementById('tae').style.backgroundColor = "#0394e3";
				document.getElementById('cg').style.backgroundColor = "#0394e3";
				document.getElementById('rg').style.backgroundColor = "#0394e3";
				
				user.style.display = "block";
				cg.style.display = "none";
				tae.style.display = "none";
				ps.style.display = "none";
				gu.style.display = "none";
				ma.style.display = "none";
				rg.style.display = "none";
				ca.style.display = "none";
			}

			}


				
			
	</script>

</body>
</html>