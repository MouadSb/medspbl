<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>

<style>
.form-horizontal .control-label {
	text-align: left;
}

.btn-add {
	color: white;
	background-color: #0394e3;
}

.btn-add:hover {
	background-color: #0077d0;
	border: 2px solid #0077d0;
}



</style>


<div class="container-fluid" style="margin-top: 50px;">
	<div class="row">
		<div class="col-md-10 col-sm-8 col-md-offset-1 col-sm-offset-2">
		<form:form id="div_modifyu" modelAttribute="userM"
			class="form-horizontal">
			
			<div class="col-md-6 col-sm-6">
				<div class="form-group" style="display: none;">
					<label class="col-md-3 col-sm-3 control-label">Nom d'utilisateur :</label>
					<div class="col-md-5 col-sm-5">
						<form:input path="username" type="text" class="form-control input-md"
							id="usname" placeholder="usname" readonly="true" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 col-xs-12 control-label">Nom :</label>
					<div class="col-md-5 col-sm-5 col-xs-10">
						<form:input path="nom" type="text" class="form-control input-md"
							id="nome" placeholder="Nom" readonly="true" />
						<label  id="errorC" class="errorCUN"><c:out value="${param.elu}" /></label>
							
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 col-xs-12 control-label">Prenom :</label>
					<div class="col-md-5 col-sm-5 col-xs-10">
						<form:input path="prenom" type="text"
							class="form-control input-md" id="prenome" placeholder="Prenom" readonly="true"/>
							<label  id="errorC" class="errorCUP"><c:out value="${param.elup}" /></label>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-3 col-ms-3 col-xs-12 control-label">Fonction :</label>
					<div class="col-md-5 col-sm-5 col-xs-10">
						<form:input path="fonction" type="text"
							class="form-control input-md" id="fonctione"
							placeholder="fonction" readonly="true"/>
							<label  id="errorC" class="errorCUF"><c:out value="${param.eluf}" /></label>
							
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-3 col-ms-3 col-xs-12 control-label">Telephone :</label>
					<div class="col-md-5 col-sm-5 col-xs-10">
						<form:input path="telephone" type="text"
							class="form-control input-md" id="telephonee"
							placeholder="telephone" />
							<label  id="errorC" class="telmodifyL"><c:out value="${param.elutelephone}" /></label>
							
					</div>
				</div>
				</div>
				<div class="col-md-6 col-sm-6">
				<div class="form-group">
					<label class="col-md-4 col-xs-12 control-label">Email :</label>
					<div class="col-md-5 col-sm-5 col-xs-10">
						<form:input path="email" type="text" class="form-control input-md"
							id="emaile" placeholder="email" />
							<label  id="errorC" class="errorCUEP"><c:out value="${param.elue}" /></label>
						
					</div>
				</div>

				
				<div class="form-group">
					<label class="col-md-4  col-xs-12 control-label">Role :</label>
					<div class="col-md-5 col-sm-5 col-xs-10">
						<form:input path="role" type="text" class="form-control input-md"
							id="oldRole" readonly="true"/>
						</div>
				</div>

				<div class="form-group">
					<label class="col-md-4  col-xs-12 control-label">Mot de passe :</label>
					<div class="col-md-5 col-sm-5 col-xs-10">
						<form:input path="password" type="password"
							class="form-control input-md" id="passworde"
							placeholder="Mot de passe" />
							<label  id="errorC" class="errorCUPPP"><c:out value="${param.eluppp}" /></label>
					</div>
				</div>
				
				<div class=" form-group ">
				<div class="col-md-9 col-xs-10">
					<button id="btn_modifyP" type="button"
						class="btn  btn-add btn-lg pull-right" onclick="modifyProfil()" >
						<img alt="delete" 
							src="/MedicalGap/resources/images/icone_edit.png"
							style="max-height: 14px; max-width: 14px;"> Modifier
					</button>
					</div>
				</div>

				
				</div>
				

		</form:form>
		</div>
	</div>
</div>

