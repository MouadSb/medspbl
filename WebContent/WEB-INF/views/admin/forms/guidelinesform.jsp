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
		<form:form id="div_addg" method="post"
			action="/MedicalGap/admin/addGuidelines" modelAttribute="Guideline"
			class="form-horizontal">

			<form:input path="id" type="hidden" class="form-control" id="id"
				placeholder="id" />
			<div class="col-md-10 col-xs-12">
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Nouveau type de
						guideline :</label>
					<div class="col-md-5 col-xs-10">
						<form:input path="guidelinesType" type="text"
							class="form-control input-md" id="guidelinesType"
							placeholder="Type de guideline" />
							<label  id="errorC"><c:out value="${param.eltng}" /></label>
							
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
		<form:form id="div_modifyg" modelAttribute="Guideline"
			class="form-horizontal">
			<form:input path="id" type="hidden" class="form-control" id="id"
				placeholder="ide" />
				
			<div class="col-md-10 col-xs-12">
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Nouveau type de
						guideline :</label>
					<div class="col-md-5 col-xs-10">
						<form:input path="guidelinesType" type="text"
							class="form-control input-md" id="guidelinesTypee"
							placeholder="Type de guideline" />
					<label  id="errorC" class="errorCG"><c:out value="${param.eltngm}" /></label>
							
					</div>
				</div>
					
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Catégorie :</label>
					<div class="col-md-5 col-xs-10">
						<input type="text" id="oldCategorieg" class="form-control" disabled="disabled" ></input>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Nouvelle categorie :</label>
					<div class="col-md-5 col-xs-10 selectContainer">
						<form:select path="nomCategorie" items="${listCategorie}"
							itemValue="name" itemLabel="name" class=" form-control"
							id="nomCategorieg" />
					</div>
				</div>
			</div>
			<div class="col-md-10 col-xs-12 ">
				<div class="form-group">
					<div class="col-xs-10 col-md-9 ">
						<button id="btn_form_modg" type="button" class="btn  btn-add btn-lg pull-right">
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