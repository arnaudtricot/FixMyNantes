<%@include file="entete.jsp" %>
<%@ page import="com.google.appengine.api.datastore.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.blobstore.*" %>
	  
		<div id="top">
		    <div class="container">
		        <div class="row">
		            <h3 class="footertext">Vous voulez aider votre ville à régler ses problèmes ?</h3>
		            <br>
		              <div class="col-md-4 text-center">
		              	  <a href="<%=request.getContextPath()+"/fixmynantes/reportproblem"%>"><button class="btn btn-primary btn-lg-2"><span class="glyphicon glyphicon-map-marker"></span></button></a>
		                  
		                  <br>
		                  <h4 class="footertext">Reporter un problème</h4>
		                  <p class="footertext">Ici vous pouvez remplir un formulaire de l'incident rencontré afinqu'il soit réglé au plus vite ! <br>
		              </div>
		              <div class="col-md-4 text-center">
		                  <a href="<%=request.getContextPath()+"/fixmynantes/myalerts"%>"><button class="btn btn-success btn-lg-2"><span class="glyphicon glyphicon-comment"></span></button></a>
		                  <br>
		                  <h4 class="footertext">Consultez vos alertes</h4>
		                  <p class="footertext">Vous pouvez ainsi voir les problèmes résolus et ceux qui restent à résoudre !<br>
		              </div>
		              <div class="col-md-4 text-center">
						  <a href="<%=request.getContextPath()+"/fixmynantes/mostliked"%>"><button class="btn btn-danger btn-lg-2"><span class="glyphicon glyphicon-heart"></span></button></a>		                  <br>
		                  <h4 class="footertext">Pensez à "Liker"</h4>
		                  <p class="footertext">Les problèmes qui seront les plus likés, seront les premiers à être résolus !<br>
		              </div>
		            </div>
		        <!--     <div class="row text-center">
		            <p><a href="#">Contact Stuff Here</a> <p class="footertext">Copyright 2014</p></p>
		        </div> -->
		    </div>
		   </div>
		   
		   <br /><br /><br /><br />
		   <br /><br /><br /><br />
		   <br /><br /><br /><br />
		   <br /><br />
		   <br /><br />
		   
		   <div class="container">
		    <div class="page-header text-center">
		        <h1 id="timeline"><em>Timeline des incidents</em></h1>
		    </div>
		    <ul class="timeline">
		        <%
			  	List<Entity> incidents = (List<Entity>) request.getAttribute("incidents");
			  	for (Entity incident : incidents) {
			  		String date = incident.getProperty("Date").toString();
			  %> 
		        <li> 
			  <div class="timeline-badge primary"><a><i class="glyphicon glyphicon-record" rel="tooltip" title="Posté le <%= date %>" id=""></i></a></div>
			    <div class="timeline-panel thumbnail col-md-3" style="margin:20px;">
		            <div class="timeline-heading">
		            <% if (incident.getProperty("Photo")!=null){
			  			String image = incident.getProperty("Photo").toString();
			  		%>
		              <img class="img-responsive" src=<%= image %> />
		              <%} %>
		              
		              
		            </div>
		            <div class="timeline-body">
						<p><strong>Posté le <%= incident.getProperty("Date") %></strong></p>
						<em>Sujet :</em> <%= incident.getProperty("Sujet") %><br>
						<em>Adresse :</em> <%= incident.getProperty("Adresse") %><br>
						<em>Description :</em> <%= incident.getProperty("Description") %></p>		              
		            </div>
		            
		            <div class="timeline-footer">
		                <a><span class="badge">0</span> <i class="glyphicon glyphicon-thumbs-up"> </i></a>
		                <a><span class="badge">0</span> <i class="glyphicon glyphicon-share"></i></a>
		               
		            </div>
		          </div>
		          
		        </li>
		        <%
			  		}
		          %>
		        
		    
		        
		        <li class="clearfix" style="float: none;"></li>
		    </ul>
		</div>
			
<%@include file="footer.jsp" %>