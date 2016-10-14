<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

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
.btn-info, .btn-warning, .btn-danger{
	color: white;
	background-color: #0394e3;
	border-color: transparent;
}

</style>

<div class="container-fluid" style="  width: 90%;
    height: auto;
    margin: 0 auto;
    padding: 10px;
    position: relative;">
    
	<div class="row">
		<form:form id="div_add" method="post"
			action="/MedicalGap/guidelines/add" modelAttribute="guidelines"
			class="form-horizontal">

			<form:input path="idGuideline" type="hidden" class="form-control"
				id="idGuideline" placeholder="idGuideline" />
			<div class="col-xs-10 col-md-6">
				

				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Date</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="date" type="date" class="form-control input-md"
							id="date" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Auteur</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="auteur" type="text"
							class="form-control input-md" id="auteur" placeholder="auteur" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Produit</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="produit" type="text"
							class="form-control input-md" id="produit" placeholder="produit" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Impact</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="impact" type="text"
							class="form-control input-md" id="impact" placeholder="impact" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Reference</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="reference" type="text"
							class="form-control input-md" id="reference"
							placeholder="reference" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Type de guidline :</label>
					<div class="col-md-5 col-xs-12">
						<form:select path="type" items="${listtypeguidlines}"
							itemValue="guidelinesType" itemLabel="guidelinesType" class=" form-control"
							id="guidelinesType" />
					</div>
				</div>
			</div>
			<div class="col-xs-10 col-md-6">

				<div class="form-group">
					<label class="col-md-5 col-xs-10 control-label">Conclusion :</label>
					<div class="col-md-5 col-xs-12">
						<form:textarea path="conclusion" rows="4" cols="70"
							class="form-control" id="conclusion"
							placeholder="conclusion" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-5 col-xs-10 control-label">Gaps, Insight ou
						Recommendation :</label>
					<div class="col-md-5 col-xs-12">
						<form:textarea path="gapsInsightReco" rows="4" cols="90"
							class="form-control" id="gapsInsightReco"
							placeholder="gapsInsightReco" />
					</div>
				</div>


				<div class="form-group">
					<label class="col-md-5 col-xs-10 control-label">Responsable</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="responsable" type="text"
							class="form-control input-md" id="responsable"
							placeholder="responsable" />
					</div>
				</div>
			</div>
			<div class="col-md-12 col-xs-12">
				<div class="form-group">
					<div class="col-md-11 col-xs-10">
						<button type="submit" class="btn  btn-add btn-lg pull-right">
							<img alt="delete" src="/MedicalGap/resources/images/icone_add.png"
								style="max-height: 14px; max-width: 14px;"> Ajouter
						</button>
					</div>
				</div>
			</div>
		</form:form>
		<form:form id="div_modify" modelAttribute="guidelines"
			class="form-horizontal">

			<form:input path="idGuideline" type="hidden" class="form-control"
				id="idGuideline" placeholder="idGuideline" />
			<div class="col-xs-10 col-md-6">

				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Date</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="date" type="date" class="form-control input-md"
							id="date_m" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Auteur</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="auteur" type="text"
							class="form-control input-md" id="auteur_m" placeholder="auteur" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Produit</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="produit" type="text"
							class="form-control input-md" id="produit_m"
							placeholder="produit" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Impact</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="impact" type="text"
							class="form-control input-md" id="impact_m" placeholder="impact" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Reference</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="reference" type="text"
							class="form-control input-md" id="reference_m"
							placeholder="reference" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Type de guidline :</label>
					<div class="col-md-5 col-xs-12">
						<form:select path="type" items="${listtypeguidlines}"
							itemValue="guidelinesType" itemLabel="guidelinesType" class=" form-control"
							id="guidelinesType_m" />
					</div>
				</div>
			</div>
			<div class="col-xs-10 col-md-6">
				<div class="form-group">
					<label class="col-md-5 col-xs-10 control-label">Conclusion :</label>
					<div class="col-md-5 col-xs-12">
						<form:textarea path="conclusion" rows="4" cols="70"
							class="form-control" id="conclusion_m"
							placeholder="conclusion" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-5 col-xs-10 control-label">Gaps, Insight ou
						Recommendation :</label>
					<div class="col-md-5 col-xs-12">
						<form:textarea path="gapsInsightReco" rows="4" cols="90"
							class="form-control" id="gapsInsightReco_m"
							placeholder="gapsInsightReco" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-5 col-xs-10 control-label">Responsable</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="responsable" type="text"
							class="form-control input-md" id="responsable_m"
							placeholder="responsable" />
					</div>
				</div>
			</div>
			<div class="col-md-12 col-xs-12">
				<div class="form-group">
					<div class="col-md-11 col-xs-10">
						<button id="btn_form_mod" type="button" class="btn  btn-add btn-lg pull-right">
							<img alt="delete" src="/MedicalGap/resources/images/icone_edit.png"
								style="max-height: 14px; max-width: 14px; margin-top: 7%">
							Modifier
						</button>
					</div>
				</div>
			</div>
		</form:form>

	</div>
</div>