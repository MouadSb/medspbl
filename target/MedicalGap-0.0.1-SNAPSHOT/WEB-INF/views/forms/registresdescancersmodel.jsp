<style>
<!--

-->
#headerRocheM{
background-image: url('/MedicalGap/resources/images/roche.png'); 
			padding-bottom: 3%;
			max-height: 57px; max-width: 114px;
			background-size: contain;
	    	background-repeat: no-repeat; 
	    	display: block;
 			margin-left: auto;
  			margin-right: auto;
  			
}
</style>
<div class="modal fade" id="myModalr" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header" style=" height: 50px;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<div class="container-fluid">
					<div class="row">
						<div  class="container pull-right" id="headerRocheM">
						</div>
						<div style="cursor: pointer;" class="container pull-left" id="headerLogoM" >
						</div>
		
					</div>
				</div>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-xs-10 col-md-6">
						<div class="form-group">
							<label class="col-md-4 control-label">Date :</label>
							<div class="col-md-5" style="margin-bottom: 2px;">
								<input type="text" class="form-control" id="dateMdl" readonly />
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label">Ville :</label>
							<div class="col-md-5" style="margin-bottom: 2px;">
								<input type="text" class="form-control" id="villeMdl" readonly />
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label">Age médian :</label>
							<div class="col-md-5" style="margin-bottom: 2px;">
								<input type="number" class="form-control" id="ageMedianMdl"
									readonly />
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">Nombre population :</label>
							<div class="col-md-5" style="margin-bottom: 2px;">
								<input type="number" class="form-control" id="nbrePopulationMdl"
									readonly />
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">Incidence :</label>
							<div class="col-md-5" style="margin-bottom: 2px;">
								<input type="text" class="form-control" id="incidenceMdl"
									readonly />

							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">Stade :</label>
							<div class="col-md-5" style="margin-bottom: 2px;">
								<input type="text" class="form-control" id="stadeMdl" readonly />

							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label">Type de registre :</label>
							<div class="col-md-5" style="margin-bottom: 2px;">
								<input type="text" class="form-control" id="typeRegistreMdl"
									readonly />
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label">Type histologique :</label>
							<div class="col-md-5" style="margin-bottom: 2px;">
								<input type="text" class="form-control" id="typeHistoMdl"
									readonly />

							</div>
						</div>
					</div>
					<div class="col-xs-10 col-md-6">

						<div class="form-group">
							<label class="col-md-5 control-label">Source lien :</label>
							<div class="col-md-6" style="margin-bottom: 2px;">
								<input type="text" class="form-control" id="sourceLienMdl"
									readonly />
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-5 control-label">Conclusion :</label>
							<div class="col-md-6" style="margin-bottom: 2px;">
								<textarea rows="4" cols="70" class="form-control"
									id="conclusionMdl" readonly></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-5 control-label">Gaps, Insight ou
								Recommendation :</label>
							<div class="col-md-6" style="margin-bottom: 2px;">
								<textarea rows="4" cols="90" class="form-control"
									id="gapsInsightRecoMdl" readonly></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-5 control-label">Responsable :</label>
							<div class="col-md-6" style="margin-bottom: 2px;">
								<input type="text" class="form-control" id="responsableMdl"
									readonly />
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>