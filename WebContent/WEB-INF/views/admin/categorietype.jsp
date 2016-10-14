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

	#btn_addca,#btn_modifyca,#btn_deleteca{ 
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
						<input class="form-control input-sm" id="system-searchCa" name="q"
							placeholder="Rechercher" required
							style="border-radius: 6%; height: 22px; width: 80px;">
					</div>
				</form>
			</div>
		</div>
		<div class="container-fluid col-md-12" style="margin-right: 20px;">
			<div class="table-responsive">
				<table class="table table-list-search" data-click-to-select="true"
					data-toggle="tableca" id="tableca">
					<thead>
						<tr>
							<th class="hidden-sm hidden-md hidden-lg hidden-xs">ID</th>
							<th>Catégorie</th>
						</tr>
					</thead>
					<tbody id="myTableca">
						<c:forEach var="categorie" items="${listCategorie}">
							<tr class="clickable-row">
								<td class="hidden-sm hidden-md hidden-lg hidden-xs">${categorie.id_categorie}</td>
								<td>${categorie.name}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="pull-right" style="margin-top: -10px;">
				<ul class="pagination pagination-sm " id="myPagerca"></ul>
		</div>
	</div>
	<div class=" container-fluid col-md-4 col-xs-12"
		style="text-align:center">
		<button id="btn_addca" onclick="toggleca()" type="button"
			class="btn  btn-add btn-lg" style="margin-top: 10px; text-align: center">
			<img alt="add" src="/MedicalGap/resources/images/icone_add.png"
				style="max-height: 14px; max-width: 14px;"> Nouvelle insertion
		</button>
		<button id="btn_modifyca" type="button" class="btn  btn-maj btn-lg"
			style="margin-top: 10px; text-align: center">
			<img alt="add" src="/MedicalGap/resources/images/icone_edit.png"
				style="max-height: 14px; max-width: 14px;"> Modifier
		</button>
		<button id="btn_deleteca" type="button" class="btn  btn-delete btn-lg"
			style="margin-top: 10px; text-align: center">
			<img alt="add" src="/MedicalGap/resources/images/icone_delete.png"
				style="max-height: 14px; max-width: 14px;"> Supprimer
		</button>
	</div>
</div>
<div id="divaddca" class="container-fluid col-md-8"
	style="background-color: #f7f7f7; margin-top: 50px; margin-bottom: 4%; margin-left: 20px; padding-top: 3%; padding-bottom: 3%; display: none">
	<%@include file="forms/categoriesform.jsp"%>
</div>


<%@include file="../includes/script.jsp"%>
<script>
	$('#tableca').on('click', '.clickable-row', function(event) {
		$(this).addClass('active').siblings().removeClass('active');
	});
	var rowca_index;

	var toggleca = function() {
		var mydiv = document.getElementById('divaddca');
		mydiv.style.display = 'block';
	};

	$("#btn_addca").click(function() {
		var btn_addca = document.getElementById('div_addca');
		var btn_modifyca = document.getElementById('div_modifyca');
		btn_addca.style.display = 'block';
		btn_modifyca.style.display = 'none';
		$('html, body').animate({
			scrollTop : $("#divaddca").offset().top
		}, 2000);
		
	});

	$("#tableca tr").click(function() {
		$(this).addClass('selected').siblings().removeClass('selected');
		var value = $(this).find('td:first').html();

	});

	$('td').click(function(){
		 rowca_index = $(this).parent().index();
		});
	
	$("#btn_deleteca").click(function(e) {
		e.preventDefault();
		var t = $("#tableca tr.selected td:first").html();
		if (t == null) {
			$('#myModal').modal('show');
		} else {
			document.getElementById("tableca").deleteRow(rowca_index+1);
			
			$.ajax({
				type : 'DELETE',
				url : "/MedicalGap/admin/removeCategorie/" + t,
				dataType : 'json',
				async : true,
				success : function(result) {
				},
				error : function(jqXHR, textStatus, errorThrown) {
				}
			});
		}

	});

	$("#btn_modifyca")
			.click(
					function() {
						var id = $("#tableca tr.selected td:first-child").html();
						if (id == null) {
							var btn_addca = document.getElementById('div_addca');
							var btn_modifyca = document
									.getElementById('div_modifyca');
							btn_addca.style.display = 'none';
							btn_modifyca.style.display = 'none';
							$('#myModal').modal('show');

						}
						if (id != null) {
							var btn_addca = document.getElementById('div_addca');
							var btn_modifyca = document
									.getElementById('div_modifyca');
							var divaddmod = document.getElementById('divaddca');
							divaddmod.style.display= 'block';
							btn_addca.style.display = 'none';
							btn_modifyca.style.display = 'block';

							$('html, body').animate({
								scrollTop : $("#divaddca").offset().top
							}, 2000);

							var id = $("#tableca tr.selected td:first-child")
									.html();

							
							var namee = $('#oldCategorieCA');
							
							namee.val($("#tableca tr.selected td:nth-child(2)")
											.html());
							
						}
					});

	$("#btn_form_modca").click(function() {

		/*var json = {
			"id" : $("#tableca tr.selected td:first-child").html(),
			"namee" : namee.value,
		};
		
		alert(JSON.stringify(json));

		$.ajax({
			type : "POST",
			dataType : 'json',
			url : "/MedicalGap/admin/editCategorie",
			data : json, // Note it is important
			success : function(result) {
				
			},
			error : function(jqXHR, textStatus, errorThrown) {
				
			}
		}); */

		$.post("/MedicalGap/admin/editCategorie", {
			"id" : $("#tableca tr.selected td:first-child").html(),
			"namee" : namee.value,
		}, function(data) {
			
			
			if(data === "Le nom de catégorie est trop court."){
				var xt =  document.getElementsByClassName("errorCCA");
				xt[0].innerHTML = data;		
				xt[0].style.display = "block";
				}
			else if(data === "Le nom de catégorie est trop long."){
				document.getElementById("errorC").style.display = "block";
				var xt =  document.getElementsByClassName("errorCCA");
				xt[0].innerHTML = data;		
				xt[0].style.display = "block";
				}
			else if(data === "Le nom de catégorie choisie existe, veuillez choisir un autre nom."){
				document.getElementById("errorC").style.display = "block";
				var xt =  document.getElementsByClassName("errorCCA");
				xt[0].innerHTML = data;		
				xt[0].style.display = "block";
				}
			else if(data === "success"){
				location.reload();
				}
		});
		
	});
</script>
