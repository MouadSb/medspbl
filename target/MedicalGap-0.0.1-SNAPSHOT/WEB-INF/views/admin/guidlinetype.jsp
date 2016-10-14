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

	#btn_addg,#btn_modifyg,#btn_deleteg{ 
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
						<input class="form-control input-sm" id="system-searchG" name="q"
							placeholder="Rechercher" required
							style="border-radius: 6%; height: 22px; width: 80px;">
					</div>
				</form>
			</div>
		</div>

		<div class="container-fluid col-md-12" style="margin-right: 20px;">
			<div class="table-responsive">
				<table class="table table-list-search" data-click-to-select="true"
					data-toggle="tableg" id="tableg">
					<thead>
						<tr>
							<th class="hidden-sm hidden-md hidden-lg hidden-xs">ID</th>
							<th>Catégorie</th><th>Sous-Catégorie</th>
							
						</tr>
					</thead>
					<tbody id="myTableg">
						<c:forEach var="guidline" items="${listGuidline}">
							<tr class="clickable-row">
								<td class="hidden-sm hidden-md hidden-lg hidden-xs">${guidline.id}</td>
								<td>${guidline.nomCategorie}</td>
								<td>${guidline.guidelinesType}</td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
				<div class="pull-right" style="margin-top: -10px;">
				<ul class="pagination pagination-sm " id="myPagerg"></ul>
		</div>
	</div>
	<div class=" container-fluid col-md-4 col-xs-12"
		style="text-align:center">
		<button id="btn_addg" onclick="toggleg();" type="button"
			class="btn  btn-add btn-lg" style="margin-top: 10px;  text-align: center">
			<img alt="add" src="/MedicalGap/resources/images/icone_add.png"
				style="max-height: 14px; max-width: 14px;"> Nouvelle insertion
		</button>
		<button id="btn_modifyg" type="button" class="btn  btn-maj btn-lg"
			style="margin-top: 10px;   text-align: center">
			<img alt="add" src="/MedicalGap/resources/images/icone_edit.png"
				style="max-height: 14px; max-width: 14px;"> Modifier
		</button>
		<button id="btn_deleteg" type="button" class="btn  btn-delete btn-lg"
			style="margin-top: 10px;   text-align: center">
			<img alt="add" src="/MedicalGap/resources/images/icone_delete.png"
				style="max-height: 14px; max-width: 14px;"> Supprimer
		</button>
	</div>
</div>

<div id="divaddg" class="container-fluid col-md-8"
	style="background-color: #f7f7f7; margin-top: 50px; margin-bottom: 4%; margin-left: 20px; padding-top: 3%; padding-bottom: 3%; display: none">
	<%@include file="forms/guidelinesform.jsp"%>
</div>

<script>
	$('#tableg').on('click', '.clickable-row', function(event) {
		$(this).addClass('active').siblings().removeClass('active');
	});

	var rowg_index;
	
	var toggleg = function() {
		var mydiv = document.getElementById('divaddg');
		mydiv.style.display = 'block';
	};

	$("#btn_addg").click(function() {
		var btn_addg = document.getElementById('div_addg');
		var btn_modifyg = document.getElementById('div_modifyg');
		btn_addg.style.display = 'block';
		btn_modifyg.style.display = 'none';
		$('html, body').animate({
			scrollTop : $("#divaddg").offset().top
		}, 2000);

	});

	$("#tableg tr").click(function() {
		$(this).addClass('selected').siblings().removeClass('selected');
		var value = $(this).find('td:first').html();

	});

	$('td').click(function(){
		 rowg_index = $(this).parent().index();
		});
	
	$("#btn_deleteg").click(function(e) {
		e.preventDefault();
		var t = $("#tableg tr.selected td:first").html();
		if (t == null) {
			$('#myModal').modal('show');
		} else {
			document.getElementById("tableg").deleteRow(rowg_index+1);
			$.ajax({
				type : 'DELETE',
				url : "/MedicalGap/admin/removeGuidlines/" + t,
				dataType : 'json',
				async : true,
				success : function(result) {

				},
				error : function(jqXHR, textStatus, errorThrown) {

				}
			});
		}

	});

	$("#btn_modifyg").click(function() {

		var id = $("#tableg tr.selected td:first-child").html();
		if (id == null) {
			var btn_addg = document.getElementById('div_addg');
			var btn_modifyg = document.getElementById('div_modifyg');
			btn_addg.style.display = 'none';
			btn_modifyg.style.display = 'none';
			$('#myModal').modal('show');

		}
		if (id != null) {

			var btn_addg = document.getElementById('div_addg');
			var btn_modifyg = document.getElementById('div_modifyg');
			var divaddmod = document.getElementById('divaddg');
			divaddmod.style.display= 'block';
			btn_addg.style.display = 'none';
			btn_modifyg.style.display = 'block';
			
			$('html, body').animate({
				scrollTop : $("#divaddg").offset().top
			}, 2000);

			//var idRegistre = $("#tableg tr.selected td:first-child").html();

			var guidelinesTypee = $('#guidelinesTypee');
			//compagny_m.val("test");

			guidelinesTypee.val($("#tableg tr.selected td:nth-child(3)").html());
			document.getElementById('oldCategorieg').value = $("#tableg tr.selected td:nth-child(2)").html();

		}
	});

	$("#btn_form_modg").click(function() {

		var e = document.getElementById("nomCategorieg");
		var strUser = e.options[e.selectedIndex].value;
		/*
		var json = {
			"id" : $("#tableg tr.selected td:first-child").html(),
			"guidlineType" : guidelinesTypee.value,
			"nomCategorie" : strUser,
		};

		alert(JSON.stringify(json));

		$.ajax({
			type : "POST",
			dataType : 'json',
			url : "/MedicalGap/admin/editGuidline",
			data : json, // Note it is important
			success : function(result) {
				window.open("admin", "_self");
			},
			error : function(jqXHR, textStatus, errorThrown) {
				window.open("admin", "_self");
			}
		}); */

		$.post("/MedicalGap/admin/editGuidline", {
			"id" : $("#tableg tr.selected td:first-child").html(),
			"guidlineType" : guidelinesTypee.value,
			"nomCategorie" : strUser,
		}, function(data) {
			if(data === "Le nom de guidline est trop court."){
				var x =  document.getElementsByClassName("errorCG");
				x[0].innerHTML = data;		
				x[0].style.display = "block";
				
				}
			else if(data === "Le nom de guidline est trop long."){
				var x =  document.getElementsByClassName("errorCG");
				x[0].innerHTML = data;		
				x[0].style.display = "block";
				
				}
			else if(data === "Le nom de guideline choisie existe dans cette catégorie, veuillez choisir un autre nom."){
				var x =  document.getElementsByClassName("errorCG");
				x[0].innerHTML = data;		
				x[0].style.display = "block";
				
				}
			else if(data === "success"){
				location.reload();
				}
		});
		
		
		
	});
</script>