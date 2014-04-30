<%@include file="entete.jsp" %>
	  
		<div class="container-fluid panel panel-default col-md-10 col-md-offset-1">  
		<div class="container-fluid" style="margin-top:42px;">
			<div class="row-fluid">
				<legend>Les plus "Likés"</legend>
				<br />
			</div>
		</div>
		
		<div class="container-fluid">
							    <div class="row-fluid">
							        <div class="panel panel-primary filterable">
							            <div class="panel-heading">
							                <h3 class="panel-title">Alertes</h3>
							                <div class="pull-right">
							                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filter</button>
							                </div>
							            </div>
							            <table class="table">
							                <thead>
							                    <tr class="filters">
							                        <th><input type="text" class="form-control" placeholder="#" disabled></th>
							                        <th><input type="text" class="form-control" placeholder="Sujet" disabled></th>
							                        <th><input type="text" class="form-control" placeholder="Adresse" disabled></th>
							                        <th><input type="text" class="form-control" placeholder="Categorie" disabled></th>
							                    	<th></th>
							                    	<th></th>
							                    </tr>
							                </thead>
							                <tbody>
							                    <tr>
							                        <td>1</td>
							                        <td>Incident 1</td>
							                        <td>Rue Kervégan</td>
							                        <td>Eclairage public</td>
							                        <td><button class="btn btn-connexion btn-xs"><span class="glyphicon glyphicon-thumbs-up"></span> Like</button><span class="badge">45</span></td>
							                        <td><button class="btn btn-continuer btn-xs"><span class="glyphicon glyphicon-share"></span> Share</button><span class="badge">26</span></td>
							                    </tr>
							                    <tr>
							                        <td>2</td>
							                        <td>Incident</td>
							                        <td>Rue de Strasbourg</td>
							                        <td>Abribus</td>
							                        <td><button class="btn btn-connexion btn-xs"><span class="glyphicon glyphicon-thumbs-up"></span> Like</button><span class="badge">37</span></td>
							                        <td><button class="btn btn-continuer btn-xs"><span class="glyphicon glyphicon-share"></span> Share</button><span class="badge">32</span></td>
							                    </tr>
							                    <tr>
							                        <td>3</td>
							                        <td>Incident</td>
							                        <td>Rue de Strasbourg</td>
							                        <td>Abribus</td>
							                        <td><button class="btn btn-connexion btn-xs"><span class="glyphicon glyphicon-thumbs-up"></span> Like</button><span class="badge">24</span></td>
							                        <td><button class="btn btn-continuer btn-xs"><span class="glyphicon glyphicon-share"></span> Share</button><span class="badge">17</span></td>
							                    </tr>
							                </tbody>
							            </table>
							        </div>
							    </div>
							</div>
			
<%@include file="footer.jsp" %>