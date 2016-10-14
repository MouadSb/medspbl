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
<title>Presse Santé</title>
<link rel="stylesheet" href="../resources/css/costum_styleR.css">

</head>
<body>
	<div class="container-fluid">
		<%@include file="includes/navbar.jsp"%>


		<div class="table-responsive">
			<table class="table table-list-search table-bordered" data-click-to-select="true"
				data-toggle="table" id="table">
				<thead>
					<tr>
						<th class="hidden-sm hidden-md hidden-lg hidden-xs">ID</th>
						<th>Date</th>
						<th>Type</th>
						<th>Société</th>
						<th>Auteur</th>
						<th>Titre</th>
						<th>Produit</th>
						<th>Impact</th>
						<th>Référence</th>
						<th class="hidden-sm hidden-md hidden-lg hidden-xs">Conclusion</th>
						<th class="hidden-sm hidden-md hidden-lg hidden-xs">Gaps/Insight/Recommendation</th>
						<th>Personne responsable</th>

					</tr>
				</thead>
				<tbody id="myTable">

					<c:forEach var="presseSante" items="${listpresseSantes}">
						<tr class="clickable-row">
							<td class="hidden-sm hidden-md hidden-lg hidden-xs">${presseSante.idPresse}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${presseSante.date}" /></td>
							<td>${presseSante.type}</td>
							<td>${presseSante.compagny}</td>
							<td>${presseSante.auteur}</td>
							<td>${presseSante.titre}</td>
							<td>${presseSante.produit}</td>
							<td>${presseSante.impact}</td>
							<td>${presseSante.reference}</td>
							<td class="hidden-sm hidden-md hidden-lg hidden-xs">${presseSante.conclusion}</td>
							<td class="hidden-sm hidden-md hidden-lg hidden-xs">${presseSante.gapsInsightReco}</td>
							<td>${presseSante.responsable}</td>
							
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="container-fluid"
			style="background-image: url('/MedicalGap/resources/images/pat.png');margin-top:-20px; background-size: 100%; background-position: center; background-repeat: no-repeat; width: 100%; padding: 0.6%;">
			<ul></ul>
		</div>
		<div class="row">
			<div class=" col-md-3 col-xs-12 pull-right">
				<ul class="pagination pagination-sm " id="myPager"></ul>
			</div>
			<div class=" col-md-10 col-xs-12" >
				<div class="row">
					<div class="col-md-2 col-xs-12" style="text-align: center;" >
						 <button id="btn_add" onclick="toggle();toBottom()" type="button"
							class="btn  btn-add btn-lg" style="margin-top: 2px;">
							<img alt="add" src="/MedicalGap/resources/images/icone_add.png"
								style="max-height: 14px; max-width: 14px;"> Nouvelle insertion
						</button>
					</div>
					
					<div class="col-md-10 col-xs-12" style="text-align: center;">
						<button id="btn_showP" type="button" class="btn  btn-info btn-lg" style="margin-top: 2px;">
							<img alt="delete" src="/MedicalGap/resources/images/icone_show.png"
								style="max-height: 18px; max-width: 18px;"> Afficher
						</button>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
						<button id="btn_modify" type="button" class="btn btn-warning btn-lg"
							onclick="toggle();toBottom()" style="margin-top: 2px;">
							<img alt="edit" src="/MedicalGap/resources/images/icone_edit.png"
								style="max-height: 14px; max-width: 14px;"> Modifier
						</button>
						<button id="btn_delete" type="button" class="btn btn-danger btn-lg" style="margin-top: 2px;">
							<img alt="delete"
								src="/MedicalGap/resources/images/icone_delete.png"
								style="max-height: 12px; max-width: 12px;"> Supprimer
						</button>
						</sec:authorize>
					</div>
				
				</div>
			</div>



		</div>
	</div>
	<div id="divadd" class="container-fluid"
		style="background-color: #f7f7f7; margin-top: 3%; margin-bottom: 4%; padding-top: 3%; padding-bottom: 3%; display: none; margin-left:1%; margin-right:1%">
		<%@include file="forms/pressesanteform.jsp"%>
	</div>
		<%@include file="forms/pressesantemodel.jsp"%>

	<%@include file="includes/script.jsp"%>
	<script>
		$('#table').on('click', '.clickable-row', function(event) {
			$(this).addClass('active').siblings().removeClass('active');
		});

		var toggle = function() {
			var mydiv = document.getElementById('divadd');
			mydiv.style.display = 'block';

		};
		$("#btn_add").click(function() {
			var btn_add = document.getElementById('div_add');
			var btn_modify = document.getElementById('div_modify');
			btn_add.style.display = 'block';
			btn_modify.style.display = 'none';
			$('html, body').animate({
				scrollTop : $("#divadd").offset().top
			}, 2000);
			var idPresse = $('#idPresse');
			var date = $('#date');
			var auteur = $('#auteur');
			var titre = $('#titre');
			var produit = $('#produit');
			var impact = $('#impact');
			var reference = $('#reference');
			var conclusion = $('#conclusion');
			var gapsInsightReco = $('#gapsInsightReco');
			var responsable = $('#responsable');

			compagny.val("");
			//date
			auteur.val("");
			titre.val("");
			produit.val("");
			impact.val("");
			reference.val("");
			nbreTotalBc.val("");
			nbreTotal.val("");
			conclusion.val("");
			gapsInsightReco.val("");
			responsable.val("");
		});

		$("#table tr").click(function() {
			$(this).addClass('selected').siblings().removeClass('selected');
			var value = $(this).find('td:first').html();

		});

		$("#btn_delete").click(function(e) {
			e.preventDefault();
			var t = $("#table tr.selected td:first").html();
			if (t == null) {
				$('#myModal').modal('show');
			} else {
				$.ajax({
					type : 'DELETE',
					url : "/MedicalGap/pressesantes/remove/" + t,
					dataType : 'json',
					async : true,
					success : function(result) {
						window.open("pressesantes", "_self");
					},
					error : function(jqXHR, textStatus, errorThrown) {
						window.open("pressesantes", "_self");
					}
				});
			}

		});

		$("#btn_modify").click(
				function() {
					var id = $("#table tr.selected td:first-child").html();
					if (id == null) {
						var btn_add = document.getElementById('div_add');
						var btn_modify = document.getElementById('div_modify');
						btn_add.style.display = 'none';
						btn_modify.style.display = 'none';
						$('#myModal').modal('show');

					}
					if (id != null) {
						var btn_add = document.getElementById('div_add');
						var btn_modify = document.getElementById('div_modify');

						btn_add.style.display = 'none';
						btn_modify.style.display = 'block';

						$('html, body').animate({
							scrollTop : $("#divadd").offset().top
						}, 2000);

						var id = $("#table tr.selected td:first-child").html();

						var idPresse = $('#idPresse_m');
						var date_m = $('#date_m');
						var auteur_m = $('#auteur_m');
						var titre_m = $('#titre_m');
						var produit_m = $('#produit_m');
						var impact_m = $('#impact_m');
						var reference_m = $('#reference_m');
						var conclusion_m = $('#conclusion_m');
						var gapsInsightReco_m = $('#gapsInsightReco_m');
						var responsable_m = $('#responsable_m');
						var compagny_m = $('#compagny_m');
						idPresse.val(id);
						document.getElementById("date_m").value = $(
								"table tr.selected td:nth-child(2)").html();
						compagny_m.val($("table tr.selected td:nth-child(4)")
								.html());
						auteur_m.val($("table tr.selected td:nth-child(5)")
								.html());
						conclusion_m.val($("table tr.selected td:nth-child(10)")
								.html());
						produit_m.val($("table tr.selected td:nth-child(7)")
								.html());
						impact_m.val($("table tr.selected td:nth-child(8)")
								.html());
						reference_m.val($("table tr.selected td:nth-child(9)")
								.html());
						titre_m.val($("table tr.selected td:nth-child(6)")
								.html());
						gapsInsightReco_m.val($(
								"table tr.selected td:nth-child(11)").html());
						responsable_m.val($(
								"table tr.selected td:nth-child(12)").html());
					}
				});

		$("#btn_form_mod").click(function() {
			 var selectBox = document.getElementById("typePresse_m");
			 var selectedValue = selectBox.options[selectBox.selectedIndex].value;

			var json = {
				"idPresse" : $("#table tr.selected td:first-child").html(),
				"date" : date_m.value,
				"auteur" : auteur_m.value,
				"titre" : titre_m.value,
				"produit" : produit_m.value,
				"impact" : impact_m.value,
				"reference" : reference_m.value,
				"conclusion" : conclusion_m.value,
				"gapsInsightReco" : gapsInsightReco_m.value,
				"responsable" : responsable_m.value,
				"compagny" : compagny_m.value,
				"type" : selectedValue
			};


			$.ajax({
				type : "POST",
				dataType : 'json',
				url : "/MedicalGap/pressesantes/edit",
				data : json, // Note it is important
				success : function(result) {
					window.open("pressesantes", "_self");
				},
				error : function(jqXHR, textStatus, errorThrown) {
					window.open("pressesantes", "_self");
				}
			});
		});

		$("#btn_showP").click(
				function() {
					var id = $("#table tr.selected td:first-child").html();
					if (id == null) {
						var btn_add = document.getElementById('div_add');
						var btn_modify = document.getElementById('div_modify');
						btn_add.style.display = 'none';
						btn_modify.style.display = 'none';
						$('#myModal').modal('show');
					}
					if (id != null) {
						
						var date_m = $('#dateMdl');
						var auteur_m = $('#auteurMdl');
						var titre_m = $('#titreMdl');
						var produit_m = $('#produitMdl');
						var impact_m = $('#impactMdl');
						var reference_m = $('#referenceMdl');
						var conclusion_m = $('#conclusionMdl');
						var gapsInsightReco_m = $('#gapsInsightRecoMdl');
						var responsable_m = $('#responsableMdl');
						var compagny_m = $('#compagnyMdl');
						var type =$('#typepresseMdl');

						document.getElementById("dateMdl").value = $(
								"table tr.selected td:nth-child(2)").html();
						type.val($("table tr.selected td:nth-child(3)")
								.html());
						compagny_m.val($("table tr.selected td:nth-child(4)")
								.html());
						auteur_m.val($("table tr.selected td:nth-child(5)")
								.html());
						conclusion_m.val($("table tr.selected td:nth-child(10)")
								.html());
						produit_m.val($("table tr.selected td:nth-child(7)")
								.html());
						impact_m.val($("table tr.selected td:nth-child(8)")
								.html());
						reference_m.val($("table tr.selected td:nth-child(9)")
								.html());
						titre_m.val($("table tr.selected td:nth-child(6)")
								.html());
						gapsInsightReco_m.val($(
								"table tr.selected td:nth-child(11)").html());
						responsable_m.val($(
								"table tr.selected td:nth-child(12)").html());
						$('#myModalP').modal('show');
					}
				});
		
				
			
	</script>
</body>
</html>