<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form method="post" action="/Medicalgap/pressesantes/add"
	modelAttribute="pressesantes">

	<form:input path="idPresse" type="hidden" class="form-control"
		id="idPresse" placeholder="idPresse" />

	<label class="col-sm-2 control-label">Type</label>
	<form:input path="type" type="text" class="form-control" id="type"
		placeholder="type" />

	<label class="col-sm-2 control-label">Date</label>
	<form:input path="date" type="date" class="form-control" id="date" />

	<label class="col-sm-2 control-label">Auteur</label>
	<form:input path="auteur" type="text" class="form-control" id="auteur"
		placeholder="auteur" />

	<label class="col-sm-2 control-label">Titre</label>
	<form:input path="titre" type="text" class="form-control" id="titre"
		placeholder="titre" />
		
	<label class="col-sm-2 control-label">Produit</label>
	<form:input path="produit" type="text" class="form-control"
		id="produit" placeholder="produit" />

	<label class="col-sm-2 control-label">Impact</label>
	<form:input path="impact" type="text" class="form-control" id="impact"
		placeholder="impact" />

	<label class="col-sm-2 control-label">Reference</label>
	<form:input path="reference" type="text" class="form-control"
		id="reference" placeholder="reference" />

	<label class="col-sm-2 control-label">Conclusion</label>
	<form:input path="conclusion" type="text" class="form-control"
		id="conclusion" placeholder="conclusion" />

	<label class="col-sm-2 control-label">Gaps/Insight/Recommendation</label>
	<form:input path="gapsInsightReco" type="text" class="form-control"
		id="gapsInsightReco" placeholder="gapsInsightReco" />

	<label class="col-sm-2 control-label">Responsable</label>
	<form:input path="responsable" type="text" class="form-control"
		id="responsable" placeholder="responsable" />

	<input type="submit" value="<spring:message text="Ajouter"/>" />
</form:form>