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

<title>Registres des cancers</title>
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
						<th>Ville</th>
						<th>Age Médian</th>
						<th>Nombre population</th>
						<th>Incidence</th>
						<th>Stade</th>
						<th>Type histologique</th>
						<th>Source lien</th>
						<th class="hidden-sm hidden-md hidden-lg hidden-xs">Conclusion</th>
						<th class="hidden-sm hidden-md hidden-lg hidden-xs">Gaps/Insight/Recommendation</th>
						<th>Personne responsable</th>
					</tr>

				</thead>
				<tbody id="myTable">

					<c:forEach var="rdc" items="${listRegistres}">
						<tr class="clickable-row">
							<td class="hidden-sm hidden-md hidden-lg hidden-xs">${rdc.idRegistre }</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${rdc.date}" /></td>
							<td>${rdc.type }</td>
							<td>${rdc.ville }</td>
							<td>${rdc.ageMedian}</td>
							<td>${rdc.nbrePopulation}</td>
							<td>${rdc.incidence}</td>
							<td>${rdc.stade}</td>
							<td>${rdc.typeHisto}</td>
							<td>${rdc.sourceLien}</td>
							<td class="hidden-sm hidden-md hidden-lg hidden-xs">${rdc.conclusion}</td>
							<td class="hidden-sm hidden-md hidden-lg hidden-xs">${rdc.gapsInsightReco}</td>
							<td>${rdc.responsable}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="container-fluid"
			style="background-image: url('/MedicalGap/resources/images/pat.png');margin-top:-20px; background-size: 100%; background-position: center; background-repeat: no-repeat; width: 100%; padding: 0.6%;">
			
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
							<button id="btn_showr" type="button" class="btn  btn-info btn-lg" style="margin-top: 2px;">
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
		<%@include file="forms/registresdescancersform.jsp"%>
	</div>
	<%@include file="forms/registresdescancersmodel.jsp"%>
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
			var idRegistre = $('#idRegistre');
			var compagny = $('#compagny');
			var date = $('#date');
			var ageMedian = $('#ageMedian');
			var nbrePopulation = $('#nbrePopulation');
			var incidence = $('#incidence');
			var stade = $('#stade');
			var typeHisto = $('#typeHisto');
			var sourceLien = $('#sourceLien');
			var type = $('#type');
			var conclusion = $('#conclusion');
			var gapsInsightReco = $('#gapsInsightReco');
			var responsable = $('#responsable');
			var ville = $('ville');

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
					url : "/MedicalGap/registres/remove/" + t,
					dataType : 'json',
					async : true,
					success : function(result) {
						window.open("registre", "_self");
					},
					error : function(jqXHR, textStatus, errorThrown) {
						window.open("registre", "_self");
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

						//var idRegistre = $('#idRegistre');
						//var compagny_m = $('#compagny_m');
						var date_m = $('#date_m');
						var ageMedian_m = $('#ageMedian_m');
						var nbrePopulation_m = $('#nbrePopulation_m');
						var incidence_m = $('#incidence_m');
						var stade_m = $('#stade_m');
						var typeHisto_m = $('#typeHisto_m');
						var sourceLien_m = $('#sourceLien_m');
						var type_m = $('#typeRegistre');
						var conclusion_m = $('#conclusion_m');
						var gapsInsightReco_m = $('#gapsInsightReco_m');
						var responsable_m = $('#responsable_m');
						var ville_m = $('#ville_m');
						//idCongresses.val(id);
						//compagny_m.val("test");
						document.getElementById("date_m").value = $(
								"table tr.selected td:nth-child(2)").html();
						//date.val($("table tr.selected td:nth-child(2)").html());
						ville_m.val($("table tr.selected td:nth-child(4)")
								.html());
						ageMedian_m.val($("table tr.selected td:nth-child(5)")
								.html());
						nbrePopulation_m.val($(
								"table tr.selected td:nth-child(6)").html());
						incidence_m.val($("table tr.selected td:nth-child(7)")
								.html());
						stade_m.val($("table tr.selected td:nth-child(8)")
								.html());
						typeHisto_m.val($("table tr.selected td:nth-child(9)")
								.html());
						sourceLien_m.val($("table tr.selected td:nth-child(10)")
								.html());
						conclusion_m
								.val($("table tr.selected td:nth-child(11)")
										.html());
						gapsInsightReco_m.val($(
								"table tr.selected td:nth-child(12)").html());
						responsable_m.val($(
								"table tr.selected td:nth-child(13)").html());

					}
				});

		$("#btn_form_mod").click(function() {

			 var selectBox = document.getElementById("typeRegistre_m");
			    var selectedValue = selectBox.options[selectBox.selectedIndex].value;
			
			var json = {
				"idRegistre" : $("#table tr.selected td:first-child").html(),
				"date" : date_m.value,
				"ageMedian_m" : ageMedian_m.value,
				"nbrePopulation_m" : nbrePopulation_m.value,
				"incidence_m" : incidence_m.value,
				"stade_m" : stade_m.value,
				"typeHisto_m" : typeHisto_m.value,
				"sourceLien_m" : sourceLien_m.value,
				"ville_m" : ville_m.value,
				"conclusion_m" : conclusion_m.value,
				"gapsInsightReco_m" : gapsInsightReco_m.value,
				"responsable_m" : responsable_m.value,
				"type_m" : selectedValue
			};
			
			$.ajax({
				type : "POST",
				dataType : 'json',
				url : "/MedicalGap/registres/edit",
				data : json, // Note it is important
				success : function(result) {
					window.open("registre", "_self");
				},
				error : function(jqXHR, textStatus, errorThrown) {
					window.open("registre", "_self");
				}
			});
		});

		$("#btn_showr").click(function() {
			var id = $("#table tr.selected td:first-child").html();
			if (id == null) {
				var btn_add = document.getElementById('div_add');
				var btn_modify = document.getElementById('div_modify');
				btn_add.style.display = 'none';
				btn_modify.style.display = 'none';
				$('#myModal').modal('show');
			}
			if (id != null) {
				var date = $('#dateMdl');
				var ageMedian = $('#ageMedianMdl');
				var nbrePopulation = $('#nbrePopulationMdl');
				var incidence = $('#incidenceMdl');
				var stade = $('#stadeMdl');
				var typeHisto = $('#typeHistoMdl');
				var sourceLien = $('#sourceLienMdl');
				var type = $('#typeRegistreMdl');
				var conclusion = $('#conclusionMdl');
				var gapsInsightReco = $('#gapsInsightRecoMdl');
				var responsable = $('#responsableMdl');
				var ville = $('#villeMdl');

				document.getElementById("dateMdl").value = $(
				"table tr.selected td:nth-child(2)").html();
		//date.val($("table tr.selected td:nth-child(2)").html());
				ville.val($("table tr.selected td:nth-child(4)")
						.html());
				ageMedian.val($("table tr.selected td:nth-child(5)")
						.html());
				nbrePopulation.val($(
						"table tr.selected td:nth-child(6)").html());
				incidence.val($("table tr.selected td:nth-child(7)")
						.html());
				stade.val($("table tr.selected td:nth-child(8)")
						.html());
				typeHisto.val($("table tr.selected td:nth-child(9)")
						.html());
				sourceLien.val($("table tr.selected td:nth-child(10)")
						.html());
				conclusion
						.val($("table tr.selected td:nth-child(11)")
								.html());
				gapsInsightReco.val($(
						"table tr.selected td:nth-child(12)").html());
				responsable.val($(
						"table tr.selected td:nth-child(13)").html());
				type.val($(
				"table tr.selected td:nth-child(3)").html());
				
				$('#myModalr').modal('show');
				}
			});

		
			
		
	</script>
</body>
</html>