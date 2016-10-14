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

	#btn_addu,#btn_modifyu,#btn_deleteu{ 
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
						<input class="form-control input-sm" id="system-searchU" name="q"
							placeholder="Rechercher" required
							style="border-radius: 6%; height: 22px; width: 80px;">
					</div>
				</form>
			</div>
		</div>

		<div class="container-fluid col-md-12" style="margin-right: 20px;">
			<div class="table-responsive">
				<table class="table table-list-search" data-click-to-select="true"
					data-toggle="tableu" id="tableu">
					<thead>
						<tr>
							<th>Utilisateur</th>
							<th>Nom</th>
							<th>Prenom</th>
							<th>Telephone</th>
							<th>Email</th>
							<th>Fonction</th>
							<th>Role</th>
							<th>Compte Actif</th>
						</tr>
					</thead>
					<tbody id="myTableu">
						<c:forEach var="user" items="${usersM}">
							<tr class="clickable-row">
								<td>${user.username}</td>
								<td>${user.nom}</td>
								<td>${user.prenom}</td>
								<td>${user.telephone}</td>
								<td>${user.email}</td>
								<td>${user.fonction}</td>
								<td>${user.role}</td>
								<td>
								<c:choose>
									<c:when test="${user.enabled == '0'}">Inactif</c:when>
									<c:otherwise>Actif</c:otherwise>
								 </c:choose>
								 </td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="pull-right" style="margin-top: -10px;">
				<ul class="pagination pagination-sm " id="myPageru"></ul>
		</div>
	</div>
	<div class=" container-fluid col-md-4 col-xs-12"
		style="text-align:center">
		<button id="btn_addu" onclick="toggleu();" type="button"
			class="btn  btn-add btn-lg" style="margin-top: 10px; text-align: center">
			<img alt="add" src="/MedicalGap/resources/images/icone_add.png"
				style="max-height: 14px; max-width: 14px;"> Nouvelle insertion
		</button>
		<button id="btn_modifyu" type="button" class="btn  btn-maj btn-lg"
			style="margin-top: 10px;text-align: center ">
			<img alt="add" src="/MedicalGap/resources/images/icone_edit.png"
				style="max-height: 14px; max-width: 14px;"> Modifier
		</button>
		<button id="btn_deleteu" type="button" class="btn  btn-delete btn-lg"
			style="margin-top: 10px; text-align: center">
			<img alt="add" src="/MedicalGap/resources/images/icone_delete.png"
				style="max-height: 14px; max-width: 14px;"> Supprimer
		</button>
	</div>
</div>
<div id="divaddu" class="container-fluid col-md-8"
	style="background-color: #f7f7f7; margin-top: 50px; margin-bottom: 4%; margin-left: 20px; padding-top: 3%; padding-bottom: 3%; display: none">
	<%@include file="forms/userform.jsp"%>
</div>


<script>
	$('#tableu').on('click', '.clickable-row', function(event) {
		$(this).addClass('active').siblings().removeClass('active');
	});
	var rowu_index;

	var toggleu = function() {
		var mydiv = document.getElementById('divaddu');
		mydiv.style.display = 'block';
	};

	$("#btn_addu").click(function() {
		var btn_addu = document.getElementById('div_addu');
		var btn_modifyu = document.getElementById('div_modifyu');
		btn_addu.style.display = 'block';
		btn_modifyu.style.display = 'none';
		$('html, body').animate({
			scrollTop : $("#divaddu").offset().top
		}, 2000);

	});

	$("#tableu tr").click(function() {
		$(this).addClass('selected').siblings().removeClass('selected');
		var value = $(this).find('td:first').html();

	});

	$('td').click(function(){
		 rowu_index = $(this).parent().index();
		});
	
	$("#btn_deleteu").click(function(e) {
		e.preventDefault();
		var t = $("#tableu tr.selected td:first").html();
		if (t == null) {
			$('#myModal').modal('show');
		} else {
			document.getElementById("tableu").deleteRow(rowu_index+1);
			$.ajax({
				type : 'DELETE',
				url : "/MedicalGap/admin/removeUser/" + t,
				dataType : 'json',
				async : true,
				success : function(result) {

				},
				error : function(jqXHR, textStatus, errorThrown) {

				}
			});
		}

	});

	/*$('.actifcheck').bootstrapSwitch({
		on: 'Actif', // default 'On'
	    off: 'Inactif', // default 'Off'
	    onClass: 'success',
	    offClass: 'danger',
	    setState: true,
	});

	
	 $('.actifcheck').change(function (event) {
		 
		    if ($('.actifcheck').val() === "Actif") {
		    	$('.actifcheck').val("Inactif");
		    } else {
		    	$('.actifcheck').val("Actif");
		    }
		});*/



	
	$("#btn_modifyu")
			.click(
					function() {

						var id = $("#tableu tr.selected td:first-child").html();
						if (id == null) {
							var btn_add = document.getElementById('div_addu');
							var btn_modify = document
									.getElementById('div_modifyu');
							
							btn_add.style.display = 'none';
							btn_modify.style.display = 'none';
							$('#myModal').modal('show');
						}
						if (id != null) {

							var btn_add = document.getElementById('div_addu');
							var btn_modify = document
									.getElementById('div_modifyu');
							var divaddx = document.getElementById('divaddu');
							divaddx.style.display= 'block';
							btn_add.style.display = 'none';
							btn_modify.style.display = 'block';

							$('html, body').animate({
								scrollTop : $("#divaddu").offset().top
							}, 2000);

							//var idRegistre = $("#table tr.selected td:first-child").html();

							var usernamee = $('#usernamee');
							var nome = $('#nome');
							var prenome = $('#prenome');
							var fonctione = $('#fonctione');
							var telephonee = $('#telephonee');
							var emaile = $('#emaile');

							usernamee.val($(
									"#tableu tr.selected td:first-child")
									.html());
							nome.val($("#tableu tr.selected td:nth-child(2)")
									.html());
							prenome
									.val($(
											"#tableu tr.selected td:nth-child(3)")
											.html());
							telephonee.val($(
									"#tableu tr.selected td:nth-child(4)")
									.html());
							emaile.val($("#tableu tr.selected td:nth-child(5)")
									.html());
							fonctione.val($(
									"#tableu tr.selected td:nth-child(6)")
									.html());
							document.getElementById('usname').value = $(
									"#tableu tr.selected td:first-child")
									.html();
							document.getElementById('oldRole').value = $(
									"#tableu tr.selected td:nth-child(7)")
									.html();
							$('.actifcheck').val($("#tableu tr.selected td:nth-child(8)").html());
							//document.getElementById('actifcheck').setAttribute('checked', 'checked');
							//$('#actifcheck').bootstrapToggle('off');
							//$('#actifcheck').prop('checked', false).change();
							//$('#actifcheck').bootstrapToggle();
						//	$('#actifcheck').bootstrapToggle('off');
							if($("#tableu tr.selected td:nth-child(8)").html().replace(/\s/g, "") === "Actif"){
									$('#actifcheck').prop('checked', true).change();
									document.getElementById("actifcheck").value = "1";
								}else{
									$('#actifcheck').prop('checked', false).change();
									document.getElementById("actifcheck").value = "0";
								}
							
						}
					});


	document.getElementById("actifcheck").onclick = function() {
		
		if(document.getElementById("actifcheck").value === "1"){
			document.getElementById("actifcheck").value = "0";
			}else{
				document.getElementById("actifcheck").value = "1";
				}
		};

		
	$("#btn_form_modu").click(function() {

		var e = document.getElementById("rolee");
		var strUser = e.options[e.selectedIndex].value;
		
		$.post("/MedicalGap/admin/editUser", {
			"id" : $("#tableu tr.selected td:first-child").html(),
			"nom" : nome.value,
			"prenom" : prenome.value,
			"telephone" : telephonee.value,
			"email" : emaile.value,
			"fonction" : fonctione.value,
			"password" : passworde.value,
			"role" : strUser,
			"enabled" : document.getElementById("actifcheck").value,
		}, function(data) {
			
			var xtn =  document.getElementsByClassName("errorCUN");
			var xtp =  document.getElementsByClassName("errorCUP");
			var xtf =  document.getElementsByClassName("errorCUF");
			var xtt =  document.getElementsByClassName("errorCUT");
			var xte =  document.getElementsByClassName("errorCUE");
			var xtpp =  document.getElementsByClassName("errorCUPP");
			
			
			if(data === "Le nom est trop court."){
				xtn[0].innerHTML = data;		
				xtn[0].style.display = "block";
				alert(data);
				}
			else if(data === "Le nom est trop long."){
				document.getElementById("errorC").style.display = "block";
				xtn[0].innerHTML = data;		
				xtn[0].style.display = "block";
				}
			else if(data === "Le prenom est trop court."){
				xtp[0].innerHTML = data;		
				xtp[0].style.display = "block";
				}
			else if(data === "Le prenom est trop long."){
				document.getElementById("errorC").style.display = "block";
				xtp[0].innerHTML = data;		
				xtp[0].style.display = "block";
				}
			else if(data === "La longueur du champ fonction est trop courte."){
				xtf[0].innerHTML = data;		
				xtf[0].style.display = "block";
				}
			else if(data === "La longueur du champ fonction est trop long"){
				document.getElementById("errorC").style.display = "block";
				xtf[0].innerHTML = data;		
				xtf[0].style.display = "block";
				}
			else if(data === "Le numero du téléphone est trop court."){
				xtt[0].innerHTML = data;		
				xtt[0].style.display = "block";
				}
			else if(data === "Le numero du téléphone est trop long."){
				document.getElementById("errorC").style.display = "block";
				xtt[0].innerHTML = data;		
				xtt[0].style.display = "block";
				}
			else if(data === "Email incorrecte."){
				xte[0].innerHTML = data;		
				xte[0].style.display = "block";
				}
			else if(data === "Email incorrecte."){
				document.getElementById("errorC").style.display = "block";
				xte[0].innerHTML = data;		
				xte[0].style.display = "block";
				}
			else if(data === "Le mot de passe saisie est trop court."){
				xtpp[0].innerHTML = data;		
				xtpp[0].style.display = "block";
				alert(data);
				}
			else if(data === "Le mot de passe saisie est trop long."){
				document.getElementById("errorC").style.display = "block";
				xtpp[0].innerHTML = data;		
				xtpp[0].style.display = "block";
				}
			else if(data === "Le nom de registre choisie existe dans cette catégorie, veuillez choisir un autre nom."){
				document.getElementById("errorC").style.display = "block";
				xtpp[0].innerHTML = data;		
				xtpp[0].style.display = "block";
				}
			else if(data === "success"){
				location.reload();
				}
		});
	});

</script>