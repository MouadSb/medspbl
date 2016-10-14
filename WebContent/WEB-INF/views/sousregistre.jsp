<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="includes/link.jsp"%>

<title>Medical GAP</title>
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<h1>Registrees :</h1>

			<form:form commandName="typesregistres" method="POST"
				action="/MedicalGap/registres/redirectReg" class="form-group">
				<form:select path="name">
					<form:options items="${listRegistre}" />
				</form:select>
				<input type="submit" value="<spring:message text="Accéder"/>" />
			</form:form>

		</div>
	</div>
	<script>
		$(document).ready(function() {
			$('.combobox').combobox();
			$('form').submit(function(e) {
				e.preventDefault();

			});
		});
	</script>
	<%@include file="includes/script.jsp"%>
<script type="text/javascript" charset="utf8"
	src="/MedicalGap/resources/js/jquery.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="/MedicalGap/resources/js/bootstrap.min.js"></script>
</body>
</html>