<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="/MedicalGap/resources/css/bootstrap.min.css">
	
<link rel="stylesheet" href="resources/css/costum_styleI.css">
<title>Categories</title>

</head>
<body>
<div class="container-fluid" id="bodyCaI">
	<div  class="container-fluid pull-right" id="bodyCat">
		<div class="container-fluid" id="idDivContain" >
		

				<div class="form-group">
					<div class="dropdown">
						<button id="selectCategorie"
							class="btn btn-primary dropdown-toggle" type="button" onclick="clickC();"
							data-toggle="dropdown">Selectionnez une catégorie  &nbsp;&nbsp;<span class="caret" ></span>
						</button>

						<ul class="dropdown-menu" id="listCat" >

							<c:forEach var="cat" items="${listCategories}">
								<c:set var="categorie"
									value="${fn:replace(cat.name , 
                                ' ', '')}" />
								<li><a id=${categorie} href="#" onclick="clickSC();">${cat.name}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="form-group" id="sousC" onclick="chooseCat();">
					<div class="dropdown">
						<button id="selectSCategorie"
							class="btn btn-primary dropdown-toggle" type="button" onclick="clickSSC();"
							data-toggle="dropdown">
							Selectionnez une sous-catégorie   <span class="caret"></span>
						</button>

						<ul class="dropdown-menu" id="listSCat">
							<li><a id="/MedicalGap/registres/registre" href="#" onclick="clickSC();">Registres des cancers</a></li>
							<li><a id="/MedicalGap/congresses/congresses" href="#" onclick="clickSC();">Congresses</a></li>
							<li><a id="/MedicalGap/tae/tae" href="#" onclick="clickSC();">TAE</a></li>
							<li><a id="/MedicalGap/pressesantes/pressesantes" href="#" onclick="clickSC();">Presse sante</a></li>
							<li><a id="/MedicalGap/guidelines/guidelines" href="#" onclick="clickSC();">Guidelines</a></li>
							<li><a id="/MedicalGap/medicaleactivities/medicaleactivities" href="#" onclick="clickSC();">Medical activities</a></li>
						</ul>
					</div>
				</div>

				<div id="Cbtn_choix" class="form-group col-ms-5 pull-right">
					<button type="button" class="btn btn-primary" id="btn_choix"
						onclick="submit();" disabled>Accéder</button>
				</div>
			</div>
		</div>
	

	<div class="modal fade bs-example-modal-sm" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content ">
				<h4 class="modal-body" style="text-align: center;">
					Selectionnez une catégorie
					</h4>
			</div>
		</div>
	</div>
	</div>
	<script type="text/javascript" charset="utf8"
	src="/MedicalGap/resources/js/jquery.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="/MedicalGap/resources/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.combobox').combobox();
			$('form').submit(function(e) {
				e.preventDefault();
			});
		});

		var bodyCat = document.getElementById('bodyCat');
		
		
		function clickC(){
				img = '/MedicalGap/resources/images/435.png';
				$("#bodyCat").css({ 'height': '435px' });
				$("#bodyCat").css({ 'background-image': 'url('+img+')' });  
				$("#Cbtn_choix").css({ 'margin-top': '114px' });
			};

		function clickSC(){
				img = '/MedicalGap/resources/images/311.png';
				$("#bodyCat").css({ 'height': '320px' });
				$("#bodyCat").css({ 'background-image': 'url('+img+')' });  
				$("#Cbtn_choix").css({ 'margin-top': '10px' });
			}
		function clickSSC(){
				img = '/MedicalGap/resources/images/509.png';
				$("#bodyCat").css({ 'height': '509px' });
				$("#bodyCat").css({ 'background-image': 'url('+img+')' });  
				$("#Cbtn_choix").css({ 'margin-top': '175px' });
			}
	</script>

	<script>
		var testC = "";
		var CC = "";
		var CS = "";
		function getEventTarget(e) {
			e = e || window.event;
			return e.target || e.srcElement;
		}

		var li = document.getElementById('listCat');
		li.onclick = function(event) {
			var target = getEventTarget(event);
			var t = target.innerHTML;
			//document.getElementById('selectCat').innerHTML = target.innerHTML.Text;
			document.getElementById("selectCategorie").innerHTML = t;
			document.getElementById("selectSCategorie").innerHTML = 'Selectionnez une sous-catégorie &nbsp;&nbsp;<span class="caret"></span>';
			document.getElementById("listSCat").style.visibility = 'visible';
			testC = "ok";
			CC = t;
		};

		var lt = document.getElementById('listSCat');
		lt.onclick = function(event) {
			var target = getEventTarget(event);
			var t = target.innerHTML;
			//document.getElementById('selectCat').innerHTML = target.innerHTML.Text;
			document.getElementById("selectSCategorie").innerHTML = t;
			document.getElementById("btn_choix").disabled = false;
			CS = t;
		};

		function chooseCat() {
			if (testC != "ok") {
				$('#myModal').modal('show');
			}
		};
		function submit() {

			$.post("/MedicalGap/redirectCat", {
				"categorie" : CC,
			}, function(data) {
				if (data === "200") {
					if (CS === "Registres des cancers") {
						window.location.replace("/MedicalGap/registres/registre");
					} else if (CS === "Congresses") {
						window.location.replace("/MedicalGap/congresses/congresses");
					} else if (CS === "TAE") {
						window.location.replace("/MedicalGap/tae/tae");
					} else if (CS === "Presse sante") {
						window.location.replace("/MedicalGap/pressesantes/pressesantes");
					} else if (CS === "Guidelines") {
						window.location.replace("/MedicalGap/guidelines/guidelines");
					} else if (CS === "Medical activities") {
						window.location.replace("/MedicalGap/medicaleactivities/medicaleactivities");
					}
				}
			});
		};
	</script>
	<%@include file="includes/script.jsp"%>
</body>
</html>