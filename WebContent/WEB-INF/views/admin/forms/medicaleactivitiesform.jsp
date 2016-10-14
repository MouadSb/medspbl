<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
.form-group{
	margin-bottom:10px !important;
}
</style>


<div class="container-fluid">
	<div class="row">
		<form:form id="div_addm" method="post"
			action="/MedicalGap/admin/addMedicale" modelAttribute="ma"
			class="form-horizontal">

			<form:input path="id" type="hidden" class="form-control" id="id"
				placeholder="id" />
			<div class="col-md-10 col-xs-12">
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Nouvelle activité medicale :</label>
					<div class="col-md-5 col-xs-10">
						<form:input path="typeMedical" type="text"
							class="form-control input-md" id="typeMedical"
							placeholder="Activité medicale" />
							<label  id="errorC"><c:out value="${param.eltnm}" /></label>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Catégorie :</label>
					<div class="col-md-5 col-xs-10 selectContainer">
						<form:select path="nomCategorie" items="${listCategorie}"
							itemValue="name" itemLabel="name" class=" form-control"
							id="categorie" />
					</div>
				</div>
			</div>
			<div class="col-md-10 col-xs-12 ">
				<div class="form-group">
					<div class="col-xs-10 col-md-9 ">
						<button type="submit" class="btn  btn-add btn-lg pull-right">
							<img alt="add" src="/MedicalGap/resources/images/icone_add.png"
								style="max-height: 14px; max-width: 14px;"> Ajouter
						</button>
					</div>
				</div>
			</div>
		</form:form>
		<form:form id="div_modifym" modelAttribute="ma"
			class="form-horizontal">
			<form:input path="id" type="hidden" class="form-control" id="id"
				placeholder="ide" />
			<div class="col-md-10 col-xs-12">
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Nouvelle activité medicale :</label>
					<div class="col-md-5 col-xs-10">
						<form:input path="typeMedical" type="text"
							class="form-control input-md" id="typeMedicale"
							placeholder="Activité medicale" />
						<label  id="errorC" class="errorCM"><c:out value="${param.eltnmm}" /></label>
							
					</div>
				</div>
					
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Catégorie :</label>
					<div class="col-md-5 col-xs-10">
						<input type="text" id="oldCategoriem" class="form-control" disabled="disabled" ></input>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Nouvelle categorie :</label>
					<div class="col-md-5 col-xs-10 selectContainer">
						<form:select path="nomCategorie" items="${listCategorie}"
							itemValue="name" itemLabel="name" class=" form-control"
							id="nomCategoriem" />
					</div>
				</div>
			</div>
			<div class="col-md-10 col-xs-12 ">
				<div class="form-group">
					<div class="col-xs-10 col-md-9 ">
						<button id="btn_form_modm" type="button" class="btn  btn-add btn-lg pull-right">
							<img alt="update"
								src="/MedicalGap/resources/images/icone_edit.png"
								style="max-height: 14px; max-width: 14px;"> Modifier
						</button>
					</div>
				</div>
			</div>
		</form:form>
	</div>
</div>