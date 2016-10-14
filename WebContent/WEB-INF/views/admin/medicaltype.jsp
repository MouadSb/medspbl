<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@page session="true"%>
<%@include file="../includes/script.jsp"%>
<style>
	.container-fluid.col-md-2.col-xs-12{
		margin-top: 1.4%; 
		margin-left: 70px; 
	}

	#btn_addm,#btn_modifym,#btn_deletem{ 
		width: 200px;
		margin-left: 0px !important;
	}

@media only screen and (max-device-width: 767px){

	.container-fluid.col-md-2.col-xs-12{
		margin-left: 0px !important;
	}
	.row{
		margin-left: -15px !important;
	}
}

</style>

<div class="row" style="margin-top: 10px; margin-left: 10px;">
	<div class="col-md-8">
		<div class="container-fluid adminBar col-md-12">
			<div class="pull-right">
				<form action="#" method="get">
					<div class="input-group ">
						<input class="form-control input-sm" id="system-searchM" name="q"
							placeholder="Rechercher" required
							style="border-radius: 6%; height: 22px; width: 80px;">
					</div>
				</form>
			</div>
		</div>
		<div class="container-fluid col-md-12" style="margin-right: 20px;">
			<div class="table-responsive">
				<table class="table table-list-search" data-click-to-select="true"
					data-toggle="tablema" id="tablema">
					<thead>
						<tr>
							<th class="hidden-sm hidden-md hidden-lg hidden-xs">ID</th>
							<th>Catégorie</th><th>Sous-Catégorie</th>
							
						</tr>
					</thead>
					<tbody id="myTablem">
						<c:forEach var="ma" items="${listMa}">
							<tr class="clickable-row">
								<td class="hidden-sm hidden-md hidden-lg hidden-xs">${ma.id}</td>
								
								<td>${ma.nomCategorie}</td><td>${ma.typeMedical}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div >
				<div class="pull-right" style="margin-top: -10px;">
				<ul class="pagination pagination-sm " id="myPagerm"></ul>
		</div>
	</div>
	<div class=" container-fluid col-md-4 col-xs-12"
		style="text-align:center">
		<button id="btn_addm" onclick="togglem();" type="button"
			class="btn  btn-add btn-lg" style="margin-top: 10px;  text-align: center">
			<img alt="add" src="/MedicalGap/resources/images/icone_add.png"
				style="max-height: 14px; max-width: 14px;"> Nouvelle insertion
		</button>
		<button id="btn_modifym" type="button" class="btn  btn-maj btn-lg"
			style="margin-top: 10px;  text-align: center">
			<img alt="add" src="/MedicalGap/resources/images/icone_edit.png"
				style="max-height: 14px; max-width: 14px;"> Modifier
		</button>
		<button id="btn_deletem" type="button" class="btn  btn-delete btn-lg"
			style="margin-top: 10px;  text-align: center">
			<img alt="add" src="/MedicalGap/resources/images/icone_delete.png"
				style="max-height: 14px; max-width: 14px;"> Supprimer
		</button>
	</div>
</div>
<div id="divaddm" class="container-fluid col-md-8"
	style="background-color: #f7f7f7; margin-top: 50px; margin-bottom: 4%; margin-left: 20px; padding-top: 3%; padding-bottom: 3%; display: none">
	<%@include file="forms/medicaleactivitiesform.jsp"%>
</div>
<script>
	$('#tablema').on('click', '.clickable-row', function(event) {
		$(this).addClass('active').siblings().removeClass('active');
	});
	var rowm_index;

	var togglem = function() {
		var mydiv = document.getElementById('divaddm');
		mydiv.style.display = 'block';
	};

	$("#btn_addm").click(function() {
		var btn_addm = document.getElementById('div_addm');
		var btn_modifym = document.getElementById('div_modifym');
		btn_addm.style.display = 'block';
		btn_modifym.style.display = 'none';
		$('html, body').animate({
			scrollTop : $("#divaddm").offset().top
		}, 2000);
		

	});

	$("#tablema tr").click(function() {
		$(this).addClass('selected').siblings().removeClass('selected');
		var value = $(this).find('td:first').html();

	});

	$('td').click(function(){
		 rowm_index = $(this).parent().index();
		});
	
	$("#btn_deletem").click(function(e) {
		e.preventDefault();
		var t = $("#tablema tr.selected td:first").html();
		if (t == null) {
			$('#myModal').modal('show');
		} else {
			document.getElementById("tablema").deleteRow(rowm_index+1);
			$.ajax({
				type : 'DELETE',
				url : "/MedicalGap/admin/removeMedical/" + t,
				dataType : 'json',
				async : true,
				success : function(result) {

				},
				error : function(jqXHR, textStatus, errorThrown) {

				}
			});
		}

	});

	$("#btn_modifym").click(function() {

		var id = $("#tablema tr.selected td:first-child").html();
		if (id == null) {
			var btn_addm = document.getElementById('div_addm');
			var btn_modifym = document.getElementById('div_modifym');
			
			btn_addm.style.display = 'none';
			btn_modifym.style.display = 'none';
			$('#myModal').modal('show');

		}
		if (id != null) {

			var btn_addm = document.getElementById('div_addm');
			var btn_modifym = document.getElementById('div_modifym');
			var divaddmod = document.getElementById('divaddm');
			divaddmod.style.display= 'block';
			btn_addm.style.display = 'none';
			btn_modifym.style.display = 'block';

			$('html, body').animate({
				scrollTop : $("#divaddm").offset().top
			}, 2000);

			//var idRegistre = $("#tablema tr.selected td:first-child").html();

			var idRegistre = $('#ide');
			var medicalType = $('#typeMedicale');
			idRegistre.val(idRegistre);
			//compagny_m.val("test");

			medicalType.val($("#tablema tr.selected td:nth-child(3)").html());
			document.getElementById('oldCategoriem').value = $("#tablema tr.selected td:nth-child(2)").html();
		}
	});

	$("#btn_form_modm").click(function() {

		var e = document.getElementById("nomCategoriem");
		var strUser = e.options[e.selectedIndex].value;
		/*
		var json = {
			"id" : $("#tablema tr.selected td:first-child").html(),
			"medicalType" : typeMedicale.value,
			"nomCategorie" : strUser,
		};

		alert(JSON.stringify(json));

		$.ajax({
			type : "POST",
			dataType : 'json',
			url : "/MedicalGap/admin/editMedical",
			data : json, // Note it is important
			success : function(result) {
				
			},
			error : function(jqXHR, textStatus, errorThrown) {
				
			}
		}); */

		$.post("/MedicalGap/admin/editMedical", {
			"id" : $("#tablema tr.selected td:first-child").html(),
			"medicalType" : typeMedicale.value,
			"nomCategorie" : strUser,
		}, function(data) {
			if(data === "Le nom de medicale activité est trop court."){
				var x =  document.getElementsByClassName("errorCM");
				x[0].innerHTML = data;	
				x[0].style.display = "block";
					
				}
			else if(data === "Le nom de medicale activité est trop long."){
				var x =  document.getElementsByClassName("errorCM");
				x[0].innerHTML = data;		
				x[0].style.display = "block";
				
				}
			else if(data === "Le nom de medicale activités choisie existe dans cette catégorie, veuillez choisir un autre nom."){
				var x =  document.getElementsByClassName("errorCM");
				x[0].innerHTML = data;		
				x[0].style.display = "block";
				
				}
			else if(data === "success"){
				location.reload();
				}
		});
		
	});
</script>