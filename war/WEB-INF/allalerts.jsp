<%@include file="entete.jsp" %>
<%@ page import="com.google.appengine.api.datastore.*" %>
<%@ page import="java.util.List" %>
	  
		<div class="container-fluid panel panel-default col-md-10 col-md-offset-1">  
		<div class="container-fluid" style="margin-top:42px;">
			<div class="row-fluid">
				<legend>Toutes les alertes</legend>
				<br />
			</div>
		</div>
			
		<div class="container-fluid">
		    <div class="row-fluid">
		        <div class="col-sm-3 col-md-2">
		          
		        </div>
		        <div class="col-sm-9 col-md-10">
		           
		        </div>
		    </div>
		    <hr />
		    <div class="row">
		      <div class="col-sm-3 col-md-2">
		      
		        </div>
		        <div class="col-sm-9 col-md-10 col-md-offset-1">
		            
		            <!-- Tab panes -->
		            <div class="tab-content">
		                  
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
							                        <th><input type="text" class="form-control" placeholder="Sujet" disabled></th>
							                        <th><input type="text" class="form-control" placeholder="Adresse" disabled></th>
							                        <th><input type="text" class="form-control" placeholder="Categorie" disabled></th>
							                    	<th></th>
							                    	<th></th>
							                    </tr>
							                </thead>
							                <tbody>
							                    <%
			  									List<Entity> incidents = (List<Entity>) request.getAttribute("incidents");
							                 
											  	for (Entity incident : incidents) {
											%>
							                    <tr>
							                        <td><%= incident.getProperty("Sujet") %></td>
							                        <td><%= incident.getProperty("Adresse") %></td>
							                        <td><%= incident.getProperty("Categorie") %></td>
							                        <td><button class="btn btn-connexion btn-xs"><span class="glyphicon glyphicon-thumbs-up"></span> Like</button><span class="badge">40</span></td>
							                        <td><button class="btn btn-continuer btn-xs"><span class="glyphicon glyphicon-share"></span> Share</button><span class="badge">40</span></td>
							                    </tr>
							                    <%
										  			}
									          	%>
							                </tbody>
							            </table>
							        </div>
							    </div>
							</div>
		              
		                
		                
		            
		        </div>
		    </div>
		</div>
		</div>
			
	<%@include file="footer.jsp" %>