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
.btn-info, .btn-warning, .btn-danger{
	color: white;
	background-color: #0394e3;
	border-color: transparent;
}

</style>

<div class="container-fluid"
	style="width: 90%; height: auto; margin: 0 auto; padding: 10px; position: relative;">
	<div class="row">
		<form:form id="div_add" method="post"
			action="/MedicalGap/registres/add" name="registration"
			modelAttribute="registredescancers" class="form-horizontal">

			<form:input path="idRegistre" type="hidden" class="form-control"
				id="idRegistre" placeholder="idRegistre" />

			<div class="col-xs-10 col-md-6">
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Date :</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="date" type="date" class="form-control" id="date" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Ville :</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="ville" type="text" class="form-control"
							id="ville" placeholder="ville" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Age médian :</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="ageMedian" type="number" class="form-control"
							id="ageMedian" placeholder="ageMedian" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Nombre population :</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="nbrePopulation" type="number"
							class="form-control" id="nbrePopulation"
							placeholder="nbrePopulation" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Incidence :</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="incidence" type="text" class="form-control"
							id="incidence" placeholder="incidence" />

					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Stade :</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="stade" type="text" class="form-control"
							id="stade" placeholder="stade" />

					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Type de registre :</label>
					<div class="col-md-5 col-xs-12">
						<form:select path="type" items="${typeregistre}"
							itemValue="typeRegistre" itemLabel="typeRegistre"
							class=" form-control" id="typeRegistre" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Type histologique :</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="typeHisto" type="text" class="form-control"
							id="typeHisto" placeholder="typeHisto" />

					</div>
				</div>
			</div>
			<div class="col-xs-10 col-md-6">

				<div class="form-group">
					<label class="col-md-5 col-xs-10 control-label">Source lien :</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="sourceLien" type="text" class="form-control"
							id="sourceLien" placeholder="sourceLien" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-5 col-xs-10 control-label">Conclusion :</label>
					<div class="col-md-5 col-xs-12">
						<form:textarea path="conclusion" rows="4" cols="70"
							class="form-control" id="conclusion" placeholder="conclusion" />
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
					<label class="col-md-5 col-xs-10 control-label">Responsable :</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="responsable" type="text" class="form-control"
							id="responsable" placeholder="responsable" />
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

		<form:form id="div_modify" modelAttribute="registredescancers"
			class="form-horizontal">

			<form:input path="idRegistre" type="hidden" class="form-control"
				id="idRegistre" placeholder="idRegistre" />

			<div class="col-xs-10 col-md-6">
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Date :</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="date" type="date" class="form-control"
							id="date_m" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Ville :</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="ville" type="text" class="form-control"
							id="ville_m" placeholder="ville" />

					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Age médian :</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="ageMedian" type="number" class="form-control"
							id="ageMedian_m" placeholder="ageMedian" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Nombre population :</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="nbrePopulation" type="number"
							class="form-control" id="nbrePopulation_m"
							placeholder="nbrePopulation" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Incidence :</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="incidence" type="text" class="form-control"
							id="incidence_m" placeholder="incidence" />

					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Stade :</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="stade" type="text" class="form-control"
							id="stade_m" placeholder="stade" />

					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Type histologique :</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="typeHisto" type="text" class="form-control"
							id="typeHisto_m" placeholder="typeHisto" />

					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Type de registre :</label>
					<div class="col-md-5 col-xs-12">
						<form:select path="type" items="${typeregistre}"
							itemValue="typeRegistre" itemLabel="typeRegistre"
							class=" form-control" id="typeRegistre_m" />
					</div>
				</div>
			</div>
			
			<div class="col-xs-10 col-md-6">

				<div class="form-group">
					<label class="col-md-5 col-xs-10 control-label">Source lien :</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="sourceLien" type="text" class="form-control"
							id="sourceLien_m" placeholder="sourceLien" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-5 col-xs-10 control-label">Conclusion :</label>
					<div class="col-md-5 col-xs-12">
						<form:textarea path="conclusion" rows="4" cols="70"
							class="form-control" id="conclusion_m" placeholder="conclusion" />
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
					<label class="col-md-5 col-xs-10 control-label">Responsable :</label>
					<div class="col-md-5 col-xs-12">
						<form:input path="responsable" type="text" class="form-control"
							id="responsable_m" placeholder="responsable" />
					</div>
				</div>
			</div>
			<div class="col-md-12 col-xs-12">
				<div class="form-group">
					<div class="col-md-11 col-xs-10">
						<button id="btn_form_mod" type="button" class="btn  btn-add btn-lg pull-right">
							<img alt="delete" src="/MedicalGap/resources/images/icone_edit.png"
								style="max-height: 14px; max-width: 14px;"> Modifier
						</button>
					</div>
				</div>
			</div>
		</form:form>
	</div>
</div>