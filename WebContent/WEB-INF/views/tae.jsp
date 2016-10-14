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
<title>TAE</title>
<link rel="stylesheet" href="../resources/css/costum_styleR.css">

</head>


<body>
	<div class="container-fluid">
		<%@include file="includes/navbar.jsp"%>


		<div class="table-responsive">
			<table class="table table-list-search table-bordered"  data-click-to-select="true"
				data-toggle="table" id="table">
				<thead>
					<tr>
						<th class="hidden-sm hidden-md hidden-lg hidden-xs">ID</th>
						<th>Date</th>
						<th>Type</th>
						<th>Proprietaire</th>
						<th class="hidden-sm hidden-md hidden-lg hidden-xs">Nombre de publications ${categorieSession}</th>
						<th class="hidden-sm hidden-md hidden-lg hidden-xs">Nombre de publications Total</th>
						<th>Titre HCP</th>
						<th>Essai clinique</th>
						<th class="hidden-sm hidden-md hidden-lg hidden-xs">Conclusion</th>
						<th class="hidden-sm hidden-md hidden-lg hidden-xs">Gaps/Insight/Recommendation</th>
						<th>Personne responsable</th>
						

					</tr>
				</thead>
				<tbody id="myTable">
					<c:forEach var="tae" items="${listTae}">
						<tr class="clickable-row">
							<td class="hidden-sm hidden-md hidden-lg hidden-xs">${tae.idTae}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${tae.date}" /></td>
							<td>${tae.type}</td>
							<td>${tae.proprietaire }</td>
							<td class="hidden-sm hidden-md hidden-lg hidden-xs">${tae.nbrePubBc}</td>
							<td class="hidden-sm hidden-md hidden-lg hidden-xs">${tae.nbreTot}</td>
							<td>${tae.titreHcp}</td>
							<td>${tae.essaiClinique}</td>
							<td class="hidden-sm hidden-md hidden-lg hidden-xs">${tae.conclusion}</td>
							<td class="hidden-sm hidden-md hidden-lg hidden-xs">${tae.gapsInsightReco}</td>
							<td>${tae.responsable}</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="container-fluid"
			style="background-image: url('/MedicalGap/resources/images/pat.png'); background-size: 100%; background-position: center; background-repeat: no-repeat; width: 100%; padding: 0.6%;
			margin-top:-20px;
			">
			<ul></ul>
		</div>
		<div class="row">
			<div class=" col-md-3 col-xs-12 pull-right">
				<ul class="pagination pagination-sm " id="myPager"></ul>
			</div>
			<div class=" col-md-10 col-xs-12" >
				<div class="row">
					<div class="col-md-2 col-xs-12" style="text-align: center;">
						 <button id="btn_add" onclick="toggle();toBottom()" type="button"
							class="btn  btn-add btn-lg">
							<img alt="add" src="/MedicalGap/resources/images/icone_add.png"
								style="max-height: 14px; max-width: 14px;"> Nouvelle insertion
						</button>
					</div>
					
					<div class="col-md-10 col-xs-12" style="text-align: center;">
						<button id="btn_showt" type="button" class="btn  btn-info btn-lg" style="margin-top: 2px;">
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
		<%@include file="forms/taeform.jsp"%>

	</div>
<%@include file="forms/taemodel.jsp"%>
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
			var idTae = $('#idTae');
			var compagny = $('#compagny');
			var date = $('#date');
			var titreHcp = $('#titreHcp');
			var essaiClinique = $('#essaiClinique');
			var proprietaire = $('#proprietaire');
			var nbrePubBc = $('#nbrePubBc');
			var nbreTot = $('#nbreTot');
			var conclusion = $('#conclusion');
			var gapsInsightReco = $('#gapsInsightReco');
			var responsable = $('#responsable');

			compagny.val("");
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
					url : "/MedicalGap/tae/remove/" + t,
					dataType : 'json',
					async : true,
					success : function(result) {
						window.open("tae", "_self");
					},
					error : function(jqXHR, textStatus, errorThrown) {
						window.open("tae", "_self");
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

						var idTae_m = $('#idTae_m');
						var compagny_m = $('#compagny_m');
						//var date_m = $('#date_m');
						var titreHcp_m = $('#titreHcp_m');
						var essaiClinique_m = $('#essaiClinique_m');
						var proprietaire_m = $('#proprietaire_m');
						var nbrePubBc_m = $('#nbrePubBc_m');
						var nbreTot_m = $('#nbreTot_m');
						var conclusion_m = $('#conclusion_m');
						var gapsInsightReco_m = $('#gapsInsightReco_m');
						var responsable_m = $('#responsable_m');
						//idCongresses.val(id);
						compagny_m.val("test");
						document.getElementById("date_m").value = $(
								"table tr.selected td:nth-child(2)").html();
						//date_m.val($("table tr.selected td:nth-child(2)").html());
						proprietaire_m.val($(
								"table tr.selected td:nth-child(4)").html());
						nbrePubBc_m.val($("table tr.selected td:nth-child(5)")
								.html());
						nbreTot_m.val($("table tr.selected td:nth-child(6)")
								.html());
						titreHcp_m.val($("table tr.selected td:nth-child(7)")
								.html());
						essaiClinique_m.val($(
								"table tr.selected td:nth-child(8)").html());
						conclusion_m.val($("table tr.selected td:nth-child(9)")
								.html());
						gapsInsightReco_m.val($(
								"table tr.selected td:nth-child(10)").html());
						responsable_m.val($(
								"table tr.selected td:nth-child(11)").html());
					}
				});

		$("#btn_form_mod").click(function() {
			 var selectBox = document.getElementById("typeTae_m");
			 var selectedValue = selectBox.options[selectBox.selectedIndex].value;
			
			var json = {
				"idTae" : $("#table tr.selected td:first-child").html(),
				"date" : date_m.value,
				"proprietaire" : proprietaire_m.value,
				"nbrePubBc_m" : nbrePubBc_m.value,
				"nbreTot_m" : nbreTot_m.value,
				"titreHcp_m" : titreHcp_m.value,
				"essaiClinique_m" : essaiClinique_m.value,
				"conclusion_m" : conclusion_m.value,
				"gapsInsightReco_m" : gapsInsightReco_m.value,
				"responsable_m" : responsable_m.value,
				"type" : selectedValue
			};

			
			
			$.ajax({
				type : "POST",
				dataType : 'json',
				url : "/MedicalGap/tae/edit",
				data : json, // Note it is important
				success : function(result) {
					window.open("tae", "_self");
				},
				error : function(x, e) {
					window.open("tae", "_self");
				}
			});
		});

		$("#btn_showt").click(
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
						
						var titreHcp_m = $('#titreHcpMdl');
						var essaiClinique_m = $('#essaiCliniqueMdl');
						var proprietaire_m = $('#proprietaireMdl');
						var nbrePubBc_m = $('#nbrePubBcMdl');
						var nbreTot_m = $('#nbreTotMdl');
						var conclusion_m = $('#conclusionMdl');
						var gapsInsightReco_m = $('#gapsInsightRecoMdl');
						var responsable_m = $('#responsableMdl');
						var type = $('#typeTaeMdl');
						
						
						document.getElementById("dateMdl").value = $(
								"table tr.selected td:nth-child(2)").html();
						type.val($("table tr.selected td:nth-child(3)").html());
						proprietaire_m.val($(
								"table tr.selected td:nth-child(4)").html());
						nbrePubBc_m.val($("table tr.selected td:nth-child(5)")
								.html());
						nbreTot_m.val($("table tr.selected td:nth-child(6)")
								.html());
						titreHcp_m.val($("table tr.selected td:nth-child(7)")
								.html());
						essaiClinique_m.val($(
								"table tr.selected td:nth-child(8)").html());
						conclusion_m.val($("table tr.selected td:nth-child(9)")
								.html());
						gapsInsightReco_m.val($(
								"table tr.selected td:nth-child(10)").html());
						responsable_m.val($(
								"table tr.selected td:nth-child(11)").html());
						$('#myModalT').modal('show');
					}
				});
	</script>
</body>
</html>