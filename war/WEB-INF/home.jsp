<%@include file="entete.jsp" %>
<%@ page import="com.google.appengine.api.datastore.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.blobstore.*" %>
	  
		<div id="top">
		    <div class="container">
		        <div class="row">
		            <h3 class="footertext">Vous voulez aider votre ville � r�gler ses probl�mes ?</h3>
		            <br>
		              <div class="col-md-4 text-center">
		              	  <a href="<%=request.getContextPath()+"/fixmynantes/reportproblem"%>"><button class="btn btn-primary btn-lg-2"><span class="glyphicon glyphicon-map-marker"></span></button></a>
		                  
		                  <br>
		                  <h4 class="footertext">Reporter un probl�me</h4>
		                  <p class="footertext">Ici vous pouvez remplir un formulaire de l'incident rencontr� afinqu'il soit r�gl� au plus vite ! <br>
		              </div>
		              <div class="col-md-4 text-center">
		                  <a href="<%=request.getContextPath()+"/fixmynantes/myalerts"%>"><button class="btn btn-success btn-lg-2"><span class="glyphicon glyphicon-comment"></span></button></a>
		                  <br>
		                  <h4 class="footertext">Consultez vos alertes</h4>
		                  <p class="footertext">Vous pouvez ainsi voir les probl�mes r�solus et ceux qui restent � r�soudre !<br>
		              </div>
		              <div class="col-md-4 text-center">
						  <a href="<%=request.getContextPath()+"/fixmynantes/mostliked"%>"><button class="btn btn-danger btn-lg-2"><span class="glyphicon glyphicon-heart"></span></button></a>		                  <br>
		                  <h4 class="footertext">Pensez � "Liker"</h4>
		                  <p class="footertext">Les probl�mes qui seront les plus lik�s, seront les premiers � �tre r�solus !<br>
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
			  <div class="timeline-badge primary"><a><i class="glyphicon glyphicon-record" rel="tooltip" title="Post� le <%= date %>" id=""></i></a></div>
			    <div class="timeline-panel thumbnail col-md-3" style="margin:20px;">
		            <div class="timeline-heading">
		            <% if (incident.getProperty("Photo")!=null){
			  			String image = incident.getProperty("Photo").toString();
			  		%>
		              <img class="img-responsive" src=<%= image %> />
		              <%} %>
		              
		              
		            </div>
		            <div class="timeline-body">
						<p><strong>Post� le <%= incident.getProperty("Date") %></strong></p>
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