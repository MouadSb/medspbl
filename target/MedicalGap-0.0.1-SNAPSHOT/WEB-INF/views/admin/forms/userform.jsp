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
.form-group {
    margin-bottom: 2px;
}
</style>


<div class="container-fluid">
	<div class="row">
		<form:form id="div_addu" method="post"
			action="/MedicalGap/admin/addUser" modelAttribute="userM"
			class="form-horizontal">
			<div class="col-md-10 col-xs-12">
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Nom d'utilisateur :</label>
					<div class="col-md-5 col-xs-10">
						<form:input path="username" type="text"
							class="form-control input-md" id="username"
							placeholder="Nom d'utlisateur" />
						<label  id="errorC" class="errorCUUU"><c:out value="${param.eltnuuu}" /></label>

					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Nom :</label>
					<div class="col-md-5 col-xs-10">
						<form:input path="nom" type="text" class="form-control input-md"
							id="nom" placeholder="Nom" />
						<label  id="errorC" class="errorCUNN"><c:out value="${param.eltnn}" /></label>							
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Prenom :</label>
					<div class="col-md-5 col-xs-10">
						<form:input path="prenom" type="text"
							class="form-control input-md" id="prenom" placeholder="Prenom" />
						<label  id="errorC" class="errorCUPR"><c:out value="${param.eltnp}" /></label>
					</div>
					
					
				</div>

				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Fonction :</label>
					<div class="col-md-5 col-xs-10">
						<form:input path="fonction" type="text"
							class="form-control input-md" id="fonction"
							placeholder="fonction" />
						<label  id="errorC" class="errorCUFF"><c:out value="${param.eltnf}" /></label>	
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Telephone :</label>
					<div class="col-md-5 col-xs-10">
						<form:input path="telephone" type="text"
							class="form-control input-md" id="telephone"
							placeholder="telephone" />
						<label  id="errorC" class="errorCUTT"><c:out value="${param.eltnt}" /></label>	
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Email :</label>
					<div class="col-md-5 col-xs-10">
						<form:input path="email" type="text" class="form-control input-md"
							id="email" placeholder="email" />
						<label  id="errorC" class="errorCUEE"><c:out value="${param.eltne}" /></label>	
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Mot de passe :</label>
					<div class="col-md-5 col-xs-10" style="    height: 60px;">
						<form:input path="password" type="password" class="form-control input-md" id="password"
							placeholder="Mot de passe" />
						<label  id="errorC" class="errorCUPP"><c:out value="${param.eltnpa}" /></label>
					</div>
									
					
				</div>
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Role :</label>
					<div class="col-md-5 col-xs-10 selectContainer">
						<form:select path="role" items="${roles}" class=" form-control"
							id="role" />
						<label ></label>
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
		<form:form id="div_modifyu" modelAttribute="userM"
			class="form-horizontal">
			<div class="col-md-10 col-xs-12">

				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Nom d'utilisateur :</label>
					<div class="col-md-5 col-xs-10" style="    height: 60px;">
						<input type="text" id="usname" class="form-control" disabled="disabled" ></input>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Nom :</label>
					<div class="col-md-5 col-xs-10" style="    height: 60px;">
						<form:input path="nom" type="text" class="form-control input-md"
							id="nome" placeholder="Nom" />
						<label  id="errorC" class="errorCUN"><c:out value="${param.eltnuu}" /></label>
							
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Prenom :</label>
					<div class="col-md-5 col-xs-10" style="    height: 60px;">
						<form:input path="prenom" type="text"
							class="form-control input-md" id="prenome" placeholder="Prenom" />
							<label  id="errorC" class="errorCUP"><c:out value="${param.eltnup}" /></label>
						<label  id="errorC" class="errorCUP"><c:out value="${param.eltnun}" /></label>
							
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Fonction :</label>
					<div class="col-md-5 col-xs-10">
						<form:input path="fonction" type="text"
							class="form-control input-md" id="fonctione"
							placeholder="fonction" />
							<label  id="errorC" class="errorCUF"><c:out value="${param.eltnuf}" /></label>
							
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Telephone :</label>
					<div class="col-md-5 col-xs-10">
						<form:input path="telephone" type="text"
							class="form-control input-md" id="telephonee"
							placeholder="telephone" />
							<label  id="errorC" class="errorCUT"><c:out value="${param.eltnut}" /></label>
							
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Email :</label>
					<div class="col-md-5 col-xs-10">
						<form:input path="email" type="text" class="form-control input-md"
							id="emaile" placeholder="email" />
							<label  id="errorC" class="errorCUE"><c:out value="${param.eltnue}" /></label>
						
					</div>
				</div>

				
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Role :</label>
					<div class="col-md-5 col-xs-10">
						<input type="text" id="oldRole" class="form-control" disabled="disabled" ></input>
												<label ></label>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Nouveau role :</label>
					<div class="col-md-5 col-xs-10 selectContainer">
						<form:select path="role" items="${roles}" class=" form-control"
							id="rolee" />
													<label ></label>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Mot de passe :</label>
					<div class="col-md-5 col-xs-10">
						<form:input path="password" type="password"
							class="form-control input-md" id="passworde"
							placeholder="Mot de passe" />
							<label  id="errorC" class="errorCUP"><c:out value="${param.eltnue}" /></label>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-4 col-xs-10 control-label">Actif :</label>
					<div class="col-md-5 col-xs-8">
						<input class="col-md-5" type="checkbox"  id="actifcheck" value="1" checked>
					</div>
				</div>
			</div>
			<div class="col-md-10 col-xs-12 ">
				<div class="form-group">
					<div class="col-xs-10 col-md-9 ">
						<button id="btn_form_modu" type="button"
							class="btn  btn-add btn-lg pull-right">
							<img alt="delete" src="/MedicalGap/resources/images/icone_edit.png"
								style="max-height: 14px; max-width: 14px;"> Modifier
						</button>
					</div>
				</div>
			</div>

		</form:form>
	</div>
</div>
