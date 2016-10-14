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

	#btn_add,#btn_modify,#btn_delete{ 
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
						<input class="form-control input-sm" id="system-searchr" name="q"
							placeholder="Rechercher" required
							style="border-radius: 6%; height: 22px; width: 80px;">
					</div>
				</form>
			</div>
		</div>
		
		<div class="container-fluid col-md-12" style="margin-right: 20px;">
			<div class="table-responsive">
				<table class="table table-list-search" data-click-to-select="true"
					data-toggle="table" id="table">
					<thead>
						<tr>
							<th class="hidden-sm hidden-md hidden-lg hidden-xs">ID</th>
							<th>Catégorie</th><th>Sous-Catégorie</th>
							
						</tr>
					</thead>
					<tbody id="myTablet">
						<c:forEach var="registre" items="${listRegistres}">
							<tr class="clickable-row">
								<td class="hidden-sm hidden-md hidden-lg hidden-xs">${registre.id}</td>
								<td>${registre.nomCategorie}</td><td>${registre.typeRegistre}</td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="pull-right">
				<ul class="pagination pagination-sm " id="myPagert"></ul>
		</div>
	</div>
	<div class=" container-fluid col-md-4 col-xs-12"
		style="text-align:center">
		<button id="btn_add" onclick="toggle();" type="button"
			class="btn  btn-add btn-lg" style="margin-top: 10px;  text-align: center">
			<img alt="add" src="/MedicalGap/resources/images/icone_add.png"
				style="max-height: 14px; max-width: 14px;"> Nouvelle insertion
		</button>
		<button id="btn_modify" type="button" class="btn  btn-maj btn-lg"
			style="margin-top: 10px;  text-align: center">
			<img alt="add" src="/MedicalGap/resources/images/icone_edit.png"
				style="max-height: 14px; max-width: 14px;"> Modifier
		</button>
		<button id="btn_delete" type="button" class="btn  btn-delete btn-lg"
			style="margin-top: 10px;  text-align: center">
			<img alt="add" src="/MedicalGap/resources/images/icone_delete.png"
				style="max-height: 14px; max-width: 14px;"> Supprimer
		</button>
	</div>
	
</div>
<div id="divadd" class="container-fluid col-md-8"
	style="background-color: #f7f7f7; margin-top: 50px; margin-bottom: 4%; margin-left: 20px; padding-top: 3%; padding-bottom: 3%; display: none;">
	<%@include file="forms/registresdescancersform.jsp"%>
</div>
<script>
	$('#table').on('click', '.clickable-row', function(event) {
		$(this).addClass('active').siblings().removeClass('active');
	});
	var rowr_index;
	
	
	var toggle = function() {
		var mydiv = document.getElementById('divadd');
		mydiv.style.display = 'block';
	};

	$("#btn_add").click(function() {
		var btn_add = document.getElementById('div_addr');
		var btn_modify = document.getElementById('div_modifyr');
		btn_add.style.display = 'block';
		btn_modify.style.display = 'none';
		$('html, body').animate({
			scrollTop : $("#divadd").offset().top
		}, 2000);

	});

	$("#table tr").click(function() {
		$(this).addClass('selected').siblings().removeClass('selected');
		var value = $(this).find('td:first').html();

	});

	$('td').click(function(){
		 rowr_index = $(this).parent().index();
		});
	
	$("#btn_delete").click(function(e) {
		e.preventDefault();
		var t = $("#table tr.selected td:first").html();
		if (t == null) {
			$('#myModal').modal('show');
		} else {
			document.getElementById("table").deleteRow(rowr_index+1);
			$.ajax({
				type : 'DELETE',
				url : "/MedicalGap/admin/removeRegistre/" + t,
				dataType : 'json',
				async : true,
				success : function(result) {
				},
				error : function(jqXHR, textStatus, errorThrown) {
				}
			});
		}

	});

	$("#btn_modify").click(function() {

		var id = $("#table tr.selected td:first-child").html();
		if (id == null) {
			var btn_add = document.getElementById('div_addr');
			var btn_modify = document.getElementById('div_modifyr');
			btn_add.style.display = 'none';
			btn_modify.style.display = 'none';
			$('#myModal').modal('show');

		}
		if (id != null) {

			var btn_add = document.getElementById('div_addr');
			var btn_modify = document.getElementById('div_modifyr');
			var divaddmod = document.getElementById('divadd');
			divaddmod.style.display= 'block';
			btn_add.style.display = 'none';
			btn_modify.style.display = 'block';

			$('html, body').animate({
				scrollTop : $("#divadd").offset().top
			}, 2000);

			//var idRegistre = $("#table tr.selected td:first-child").html();

			var idRegistre = $('#ide');
			var typeRegistre = $('#typeRegistree');
			idRegistre.val(idRegistre);


			 document.getElementById('oldCategorie').value = $("#table tr.selected td:nth-child(2)").html();
			
			typeRegistre.val($("#table tr.selected td:nth-child(3)").html());		
		}
	});

	$("#btn_form_mod").click(function() {

		var e = document.getElementById("nomCategoriee");
		var strUser = e.options[e.selectedIndex].value;
		/*
		var json = {
				"id" : $("#table tr.selected td:first-child").html(),
				"typeRegistre" : typeRegistree.value,
				"nomCategorie" : strUser,
			};

			$.ajax({
				type : "POST",
				dataType : 'json',
				url : "/MedicalGap/admin/editRegistre",
				data : json, // Note it is important
				success : function(result) {
					window.open("_self");
				},
				error : function(jqXHR, textStatus, errorThrown) {
					window.open("_self");
				}
			});*/

		$.post("/MedicalGap/admin/editRegistre", {
			"id" : $("#table tr.selected td:first-child").html(),
			"typeRegistre" : typeRegistree.value,
			"nomCategorie" : strUser,
		}, function(data) {
			if(data === "Le nom de registre est trop court."){
				var x =  document.getElementsByClassName("errorCR");
				x[0].innerHTML = data;		
				x[0].style.display = "block";
				}
			else if(data === "Le nom de registre est trop long."){
				var x =  document.getElementsByClassName("errorCR");
				x[0].innerHTML = data;		
				x[0].style.display = "block";
				}
			else if(data === "Le nom de registre choisie existe dans cette catégorie, veuillez choisir un autre nom."){
				var x =  document.getElementsByClassName("errorCR");
				x[0].innerHTML = data;		
				x[0].style.display = "block";
				}
			else if(data === "success"){
				location.reload();
				}
		});
	});
</script>