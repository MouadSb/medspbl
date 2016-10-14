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

	#btn_addt,#btn_modifyt,#btn_deletet{ 
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
						<input class="form-control input-sm" id="system-searchT" name="q"
							placeholder="Rechercher" required
							style="border-radius: 6%; height: 22px; width: 80px;">
					</div>
				</form>
			</div>
		</div>

		<div class="container-fluid col-md-12" style="margin-right: 20px;">
			<div class="table-responsive">
				<table class="table table-list-search" data-click-to-select="true"
					data-toggle="tablet" id="tablet">
					<thead>
						<tr>
							<th class="hidden-sm hidden-md hidden-lg hidden-xs">ID</th>
							<th>Catégorie</th><th>Sous-Catégorie</th>
							
						</tr>
					</thead>
					<tbody id="myTableta">
						<c:forEach var="tae" items="${listTae}">
							<tr class="clickable-row">
								<td class="hidden-sm hidden-md hidden-lg hidden-xs">${tae.id}</td>
								<td>${tae.nomCategorie}</td><td>${tae.typeTae}</td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="pull-right">
				<ul class="pagination pagination-sm " id="myPagerta"></ul>
		</div>
	</div>
	<div class=" container-fluid col-md-4 col-xs-12"
		style="text-align:center">
		<button id="btn_addt" onclick="togglet();" type="button"
			class="btn  btn-add btn-lg" style="margin-top: 10px;  text-align: center">
			<img alt="add" src="/MedicalGap/resources/images/icone_add.png"
				style="max-height: 14px; max-width: 14px;"> Nouvelle insertion
		</button>
		<button id="btn_modifyt" type="button" class="btn  btn-maj btn-lg"
			style="margin-top: 10px;  text-align: center">
			<img alt="add" src="/MedicalGap/resources/images/icone_edit.png"
				style="max-height: 14px; max-width: 14px;"> Modifier
		</button>
		<button id="btn_deletet" type="button" class="btn  btn-delete btn-lg"
			style="margin-top: 10px;  text-align: center">
			<img alt="add" src="/MedicalGap/resources/images/icone_delete.png"
				style="max-height: 14px; max-width: 14px;"> Supprimer
		</button>
	</div>
</div>
<div id="divaddt" class="container-fluid col-md-8"
	style="background-color: #f7f7f7; margin-top: 50px; margin-bottom: 4%; margin-left: 20px; padding-top: 3%; padding-bottom: 3%; display: none">
	<%@include file="forms/taeform.jsp"%>
</div>

<script>
	$('#tablet').on('click', '.clickable-row', function(event) {
		$(this).addClass('active').siblings().removeClass('active');
	});
	var row_index;
	var togglet = function() {
		var mydiv = document.getElementById('divaddt');
		mydiv.style.display = 'block';
	};

	$("#btn_addt").click(function() {
		var btn_add = document.getElementById('div_addt');
		var btn_modify = document.getElementById('div_modifyt');
		btn_add.style.display = 'block';
		btn_modify.style.display = 'none';
		$('html, body').animate({
			scrollTop : $("#divaddt").offset().top
		}, 2000);
		
	});

	$("#tablet tr").click(function() {
		$(this).addClass('selected').siblings().removeClass('selected');
		var value = $(this).find('td:first').html();

	});

	$('td').click(function(){
		 row_index = $(this).parent().index();
		});
	
	$("#btn_deletet").click(function(e) {
		e.preventDefault();
		var t = $("#tablet tr.selected td:first").html();
		if (t == null) {
			$('#myModal').modal('show');
		} else {
			document.getElementById("tablet").deleteRow(row_index+1);
			$.ajax({
				type : 'DELETE',
				url : "/MedicalGap/admin/removeTae/" + t,
				dataType : 'json',
				async : true,
				success : function(result) {
					
				},
				error : function(jqXHR, textStatus, errorThrown) {
					
				}
			});
		}

	});

	$("#btn_modifyt").click(function() {

		var id = $("#tablet tr.selected td:first").html();
		if (id == null) {
			var btn_addt = document.getElementById('div_addt');
			var btn_modifyt = document.getElementById('div_modifyt');
			
			btn_addt.style.display = 'none';
			btn_modifyt.style.display = 'none';
			$('#myModal').modal('show');

		}
		if (id != null) {

			var btn_addt = document.getElementById('div_addt');
			var btn_modifyt = document.getElementById('div_modifyt');
			var divaddmod = document.getElementById('divaddt');
			divaddmod.style.display= 'block';
			btn_addt.style.display = 'none';
			btn_modifyt.style.display = 'block';

			$('html, body').animate({
				scrollTop : $("#divaddt").offset().top
			}, 2000);

			//var idRegistre = $("#tableco tr.selected td:first-child").html();

			//var idRegistre = $('#ide');
			var typeTaee = $('#typeTaee');
			//idRegistre.val(idRegistre);
			//compagny_m.val("test");

			typeTaee.val($("#tablet tr.selected td:nth-child(3)").html());
			document.getElementById('oldCategoriet').value = $("#tablet tr.selected td:nth-child(2)").html();

		}
	});

	$("#btn_form_modt").click(function() {
		var e = document.getElementById("nomCategoriet");
		var strUser = e.options[e.selectedIndex].value;


		$.post("/MedicalGap/admin/editTae", {
			"id" : $("#tablet tr.selected td:first-child").html(),
			"taeType" : typeTaee.value,
			"nomCategorie" : strUser,
		}, function(data) {
			
			
			if(data === "Le nom de TAE est trop court."){
				var xt =  document.getElementsByClassName("errorCT");
				xt[0].innerHTML = data;		
				xt[0].style.display = "block";
				
				}
			else if(data === "Le nom de TAE est trop long."){
				document.getElementById("errorC").style.display = "block";
				var xt =  document.getElementsByClassName("errorCT");
				xt[0].innerHTML = data;		
				xt[0].style.display = "block";
				}
			else if(data === "Le nom de tae choisie existe dans cette catégorie, veuillez choisir un autre nom."){
				document.getElementById("errorC").style.display = "block";
				var xt =  document.getElementsByClassName("errorCT");
				xt[0].innerHTML = data;		
				xt[0].style.display = "block";
				}
			else if(data === "success"){
				location.reload();
				}
		});
	});
</script>