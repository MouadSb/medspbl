<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@page session="true"%>
<style>
	.container-fluid.col-md-2.col-xs-12{
		margin-top: 1.4%; 
		margin-left: 70px; 
	}

	#btn_addco,#btn_modifyco,#btn_deleteco{ 
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
						<input class="form-control input-sm" id="system-searchC" name="q"
							placeholder="Rechercher" required
							style="border-radius: 6%; height: 22px; width: 80px;">
					</div>
				</form>
			</div>
		</div>
		<div class="container-fluid col-md-12" style="margin-right: 20px;">
			<div class="table-responsive">
				<table class="table table-list-search " data-click-to-select="true"
					data-toggle="tableco" id="tableco">
					<thead>
						<tr>
							<th class="hidden-sm hidden-md hidden-lg hidden-xs">ID</th>
							
							<th>Catégorie</th>
							<th>Sous-Catégorie</th>
						</tr>
					</thead>
					<tbody id="myTableco">
						<c:forEach var="congresse" items="${listCongresses}">
							<tr class="clickable-row">
								<td class="hidden-sm hidden-md hidden-lg hidden-xs">${congresse.id}</td>
								<td>${congresse.nomCategorie}</td>
								<td>${congresse.congresseType}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="pull-right" style="margin-top: -10px;">
				<ul class="pagination pagination-sm " id="myPagerco"></ul>
		</div>
	</div>
	<div class=" container-fluid col-md-4 col-xs-12"
		style="text-align:center">
		<button id="btn_addco" onclick="toggleco();" type="button"
			class="btn  btn-add btn-lg" style="margin-top: 10px;  text-align: center">
			<img alt="add" src="/MedicalGap/resources/images/icone_add.png"
				style="max-height: 14px; max-width: 14px;"> Nouvelle insertion
		</button>
		<button id="btn_modifyco" type="button" class="btn  btn-maj btn-lg"
			style="margin-top: 10px;  text-align: center">
			<img alt="add" src="/MedicalGap/resources/images/icone_edit.png"
				style="max-height: 14px; max-width: 14px;"> Modifier
		</button>
		<button id="btn_deleteco" type="button" class="btn  btn-delete btn-lg"
			style="margin-top: 10px;  text-align: center">
			<img alt="add" src="/MedicalGap/resources/images/icone_delete.png"
				style="max-height: 14px; max-width: 14px;"> Supprimer
		</button>
	</div>
</div>
<%@include file="../includes/script.jsp"%>
<div id="divaddco" class="container-fluid col-md-8"
	style="background-color: #f7f7f7; margin-top: 50px; margin-bottom: 4%; margin-left: 20px; padding-top: 3%; padding-bottom: 3%; display: none">
	<%@include file="forms/congressesform.jsp"%>
</div>

<script>
	$('#tableco').on('click', '.clickable-row', function(event) {
		$(this).addClass('active').siblings().removeClass('active');
	});
	var rowco_index;

	var toggleco = function() {
		var mydiv = document.getElementById('divaddco');
		mydiv.style.display = 'block';
	};

	$("#btn_addco").click(function() {
		var btn_add = document.getElementById('div_addco');
		var btn_modify = document.getElementById('div_modifyco');
		btn_add.style.display = 'block';
		btn_modify.style.display = 'none';
		$('html, body').animate({
			scrollTop : $("#divaddco").offset().top
		}, 2000);
		var idRegistre = $('#id');
		var typeRegistre = $('#typeRegistre');
		var nomCategorie = $('#nomCategorie');

	});

	$("#tableco tr").click(function() {
		$(this).addClass('selected').siblings().removeClass('selected');
		var value = $(this).find('td:first').html();

	});

	$('td').click(function(){
		 rowco_index = $(this).parent().index();
		});
	
	$("#btn_deleteco").click(function(e) {
		e.preventDefault();
		var t = $("#tableco tr.selected td:first").html();
		if (t == null) {
			$('#myModal').modal('show');
		} else {
			document.getElementById("tableco").deleteRow(rowco_index+1);
			
			$.ajax({
				type : 'DELETE',
				url : "/MedicalGap/admin/removeCongresse/" + t,
				dataType : 'json',
				async : true,
				success : function(result) {

				},
				error : function(jqXHR, textStatus, errorThrown) {

				}
			});
		}

	});

	$("#btn_modifyco").click(function() {

		var id = $("#tableco tr.selected td:first").html();
		if (id == null) {
			var btn_add = document.getElementById('div_addco');
			var btn_modify = document.getElementById('div_modifyco');
			btn_add.style.display = 'none';
			btn_modify.style.display = 'none';
			$('#myModal').modal('show');

		}
		if (id != null) {

			var btn_add = document.getElementById('div_addco');
			var btn_modify = document.getElementById('div_modifyco');
			var divaddmod = document.getElementById('divaddco');
			divaddmod.style.display= 'block';
			btn_add.style.display = 'none';
			btn_modify.style.display = 'block';

			$('html, body').animate({
				scrollTop : $("#divaddco").offset().top
			}, 2000);

			//var idRegistre = $("#tableco tr.selected td:first-child").html();

			var idRegistre = $('#ide');
			var typeCongresse = $('#congresseTypee');
			idRegistre.val(idRegistre);
			//compagny_m.val("test");
			
			typeCongresse.val($("#tableco tr.selected td:nth-child(3)").html());
			document.getElementById('oldCategorieco').value = $("#tableco tr.selected td:nth-child(2)").html();
		}
	});

	$("#btn_form_modco").click(function() {
		var e = document.getElementById("nomCategorieco");
		var strUser = e.options[e.selectedIndex].value;
		
		/**
		var json = {
			"id" : $("#tableco tr.selected td:first").html(),
			"congresseType" : congresseTypee.value,
			"nomCategorie" : strUser,
		};

		$.ajax({
			type : "POST",
			dataType : 'json',
			url : "/MedicalGap/admin/editCongresse",
			data : json, // Note it is important
			success : function(result) {
				window.open(result);
			},
			error : function(jqXHR, textStatus, errorThrown) {
				window.open("_self");
			}
		}); */

		$.post("/MedicalGap/admin/editCongresse", {
			"id" : $("#tableco tr.selected td:first").html(),
			"congresseType" : congresseTypee.value,
			"nomCategorie" : strUser,
		}, function(data) {
			if(data === "Le nom de congresse est trop court."){
				var x =  document.getElementsByClassName("errorCC");
				x[0].innerHTML = data;
				x[0].style.display = "block";
						
				}
			else if(data === "Le nom de congresse est trop long."){
				var x =  document.getElementsByClassName("errorCC");
				x[0].innerHTML = data;	
				x[0].style.display = "block";
					
				}
			else if(data === "Le nom de congresse choisie existe dans cette catégorie, veuillez choisir un autre nom."){
				var x =  document.getElementsByClassName("errorCC");
				x[0].innerHTML = data;	
				x[0].style.display = "block";
					
				}
			
			else if(data === "success"){
				location.reload();
				}
		});
		
	});
</script>