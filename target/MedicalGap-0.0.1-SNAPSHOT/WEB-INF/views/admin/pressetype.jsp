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

	#btn_addp,#btn_modifyp,#btn_deletep{ 
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
						<input class="form-control input-sm" id="system-searchP" name="q"
							placeholder="Rechercher" required
							style="border-radius: 6%; height: 22px; width: 80px;">
					</div>
				</form>
			</div>
		</div>
		<div class="container-fluid col-md-12" style="margin-right: 20px;">
			<div class="table-responsive">
				<table class="table table-list-search" data-click-to-select="true"
					data-toggle="tablep" id="tablep">
					<thead>
						<tr>
							<th class="hidden-sm hidden-md hidden-lg hidden-xs">ID</th>
							<th>Catégorie</th><th>Sous-Catégorie</th>
							
						</tr>
					</thead>
					<tbody id="myTablep">
						<c:forEach var="presse" items="${listPresse}">
							<tr class="clickable-row">
								<td class="hidden-sm hidden-md hidden-lg hidden-xs">${presse.id}</td>
								<td>${presse.nomCategorie}</td><td>${presse.typePresse}</td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="pull-right">
				<ul class="pagination pagination-sm " id="myPagerp"></ul>
		</div>
	</div>
	<div class=" container-fluid col-md-4 col-xs-12"
		style="text-align:center">
		<button id="btn_addp" onclick="togglep();" type="button"
			class="btn  btn-add btn-lg" style="margin-top: 10px;  text-align: center">
			<img alt="add" src="/MedicalGap/resources/images/icone_add.png"
				style="max-height: 14px; max-width: 14px;"> Nouvelle insertion
		</button>
		<button id="btn_modifyp" type="button" class="btn  btn-maj btn-lg"
			style="margin-top: 10px;   text-align: center">
			<img alt="add" src="/MedicalGap/resources/images/icone_edit.png"
				style="max-height: 14px; max-width: 14px;"> Modifier
		</button>
		<button id="btn_deletep" type="button" class="btn  btn-delete btn-lg"
			style="margin-top: 10px;   text-align: center">
			<img alt="add" src="/MedicalGap/resources/images/icone_delete.png"
				style="max-height: 14px; max-width: 14px;"> Supprimer
		</button>
	</div>

</div>

<div id="divaddp" class="container-fluid col-md-8"
	style="background-color: #f7f7f7; margin-top: 50px; margin-bottom: 4%; margin-left: 20px; padding-top: 3%; padding-bottom: 3%; display: none">
	<%@include file="forms/pressesanteform.jsp"%>
</div>

<script>
	$('#tablep').on('click', '.clickable-row', function(event) {
		$(this).addClass('active').siblings().removeClass('active');
	});
	var rowp_index;

	var togglep = function() {
		var mydiv = document.getElementById('divaddp');
		mydiv.style.display = 'block';
	};

	$("#btn_addp").click(function() {
		var btn_addp = document.getElementById('div_addp');
		var btn_modifyp = document.getElementById('div_modifyp');
		btn_addp.style.display = 'block';
		btn_modifyp.style.display = 'none';
		$('html, body').animate({
			scrollTop : $("#divaddp").offset().top
		}, 2000);
		

	});

	$("#tablep tr").click(function() {
		$(this).addClass('selected').siblings().removeClass('selected');
		var value = $(this).find('td:first').html();

	});

	$('td').click(function(){
		 rowp_index = $(this).parent().index();
		});
	
	$("#btn_deletep").click(function(e) {
		e.preventDefault();
		var t = $("#tablep tr.selected td:first").html();
		if (t == null) {
			$('#myModal').modal('show');
		} else {
			document.getElementById("tablep").deleteRow(rowp_index+1);
			$.ajax({
				type : 'DELETE',
				url : "/MedicalGap/admin/removePresse/" + t,
				dataType : 'json',
				async : true,
				success : function(result) {

				},
				error : function(jqXHR, textStatus, errorThrown) {

				}
			});
		}

	});

	$("#btn_modifyp").click(function() {

		var id = $("#tablep tr.selected td:first-child").html();
		if (id == null) {
			var btn_addp = document.getElementById('div_addp');
			var btn_modifyp = document.getElementById('div_modifyp');
			
			btn_addp.style.display = 'none';
			btn_modifyp.style.display = 'none';
			$('#myModal').modal('show');

		}
		if (id != null) {

			var btn_addp = document.getElementById('div_addp');
			var btn_modifyp = document.getElementById('div_modifyp');
			var divaddmod = document.getElementById('divaddp');
			divaddmod.style.display= 'block';
			btn_addp.style.display = 'none';
			btn_modifyp.style.display = 'block';

			$('html, body').animate({
				scrollTop : $("#divaddp").offset().top
			}, 2000);

			//var idRegistre = $("#tablep tr.selected td:first-child").html();

			//var idRegistre = $('#ide');
			var typePressee = $('#typePressee');
			var nomCategorie = $('#nomCategoriep');
			//idRegistre.val(idRegistre);
			//compagny_m.val("test");

			typePressee.val($("#tablep tr.selected td:nth-child(3)").html());
			document.getElementById('oldCategoriep').value = $("#tablep tr.selected td:nth-child(2)").html();

		}
	});

	$("#btn_form_modp").click(function() {

		var e = document.getElementById("nomCategoriep");
		var strUser = e.options[e.selectedIndex].value;
		/*
		var json = {
			"id" : $("#tablep tr.selected td:first-child").html(),
			"presseType" : typePressee.value,
			"nomCategorie" : strUser,
		};

		$.ajax({
			type : "POST",
			dataType : 'json',
			url : "/MedicalGap/admin/editPresse",
			data : json, // Note it is important
			success : function(result) {
				
			},
			error : function(jqXHR, textStatus, errorThrown) {
				
			}
		}); */

		$.post("/MedicalGap/admin/editPresse", {
			"id" : $("#tablep tr.selected td:first-child").html(),
			"presseType" : typePressee.value,
			"nomCategorie" : strUser,
		}, function(data) {
			if(data === "Le nom de presse est trop court."){
				var x =  document.getElementsByClassName("errorCP");
				x[0].innerHTML = data;	
				x[0].style.display = "block";
					
				}
			else if(data === "Le nom de presse est trop court."){
				var x =  document.getElementsByClassName("errorCP");
				x[0].innerHTML = data;		
				x[0].style.display = "block";
				
				}
			else if(data === "Le nom de presse de santé choisie existe dans cette catégorie, veuillez choisir un autre nom."){
				var x =  document.getElementsByClassName("errorCP");
				x[0].innerHTML = data;		
				x[0].style.display = "block";
				
				}
			else if(data === "success"){
				location.reload();
				}
		});
	});
</script>