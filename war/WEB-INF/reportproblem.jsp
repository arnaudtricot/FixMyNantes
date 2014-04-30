<%@include file="entete.jsp" %>
<%@ page import="com.google.appengine.api.datastore.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.blobstore.*" %>

<%
    BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
%>
	  
<head>
	<link type="text/css" rel="stylesheet" href="/bootstrap/css/map.css"/>
	<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script>
// In the following example, markers appear when the user clicks on the map.
// The markers are stored in an array.
// The user can then click an option to hide, show or delete the markers.
var geocoder;
var map;
var infowindow = new google.maps.InfoWindow();
var markers = [];

function initialize() {
	geocoder = new google.maps.Geocoder();
	var centreCarte = new google.maps.LatLng(47.2169182, -1.5553354);
  	var mapOptions = {
    	zoom: 14,
    	center: centreCarte,
    	mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById('EmplacementDeMaCarte'),
      mapOptions);

  google.maps.event.addListener(map, 'click', function(event) {
    addMarker(event.latLng);
  });
}

function codeLatLng(location) {

	var input = location.toString();
	var tableau=input.split("(");
	
	var tableau2=tableau[1].split(")");
	
	var latlngStr=tableau2[0].split(",");
	  var lat = parseFloat(latlngStr[0]);
	  var lng = parseFloat(latlngStr[1]);
	  var latlng = new google.maps.LatLng(lat, lng);
	  geocoder.geocode({'latLng': latlng}, function(results, status) {
	    if (status == google.maps.GeocoderStatus.OK) {
	      if (results[1]) {
	        infowindow.setContent(results[1].formatted_address);
	        infowindow.open(map, markers[0]);
	      } else {
	        alert('No results found');
	      }
	    } else {
	      alert('Geocoder failed due to: ' + status);
	    }
	  });
	}

// Add a marker to the map and push to the array.
function addMarker(location) {
	
  	var marker = new google.maps.Marker({
    	position: location,
    	map: map
  	});
 	deleteMarkers();
  	markers.push(marker);
  	codeLatLng(location);
}

// Sets the map on all markers in the array.
function setAllMap(map) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map);
  }
}

// Removes the markers from the map, but keeps them in the array.
function clearMarkers() {
  setAllMap(null);
}

// Shows any markers currently in the array.
function showMarkers() {
  setAllMap(map);
}

// Deletes all markers in the array by removing references to them.
function deleteMarkers() {
  clearMarkers();
  markers = [];
}

google.maps.event.addDomListener(window, 'load', initialize);

    </script>
	
</head>
		<div class="col-md-4">
			<br />
			<br />
			<br />
		 <form role="form" class="go-right" action="<%= blobstoreService.createUploadUrl("/fixmynantes/reportproblem") %>" method="post" enctype="multipart/form-data">
				<legend>Reporter un problème</legend>
				
				<div class="form-group">
					<input id="Sujet" type="text" name="Sujet" placeholder="Objet du problème" class="form-control" required>
					<label for="Sujet">Sujet</label>
				</div>
				<div class="form-group">
					<input id="Adresse" type="text" class="form-control" name="Adresse" placeholder="Lieu du problème">
					<label for="Adresse">Adresse</label>
				</div>
				<div class="form-group">
				 	Type / Catégorie <br />
					<select name="Categorie" class="form-control">
					<option>Véhicules abandonnés
					<option>Abribus
					<option>Parking
					<option>Affichage illégal
					<option>Décharge sauvage
					<option>Graffiti
					<option>Parc / Aménagement paysager
					<option>Trottoir / Sentier
					<option>Nid de poule
					<option>Toilettes publics
					<option>Routes / Autoroutes
					<option>Panneaux de signalisation
					<option>Depots d'ordures
					<option>Nettoyage de la rue
					<option>Eclairage public
					<option>Plaques de rue
					<option>Feux de signalisation
					<option>Arbres
					</select>
					
				</div>
				<div class="form-group">
					Joindre une photo<br />
					<input type="file" class="filestyle" data-classButton="btn btn-primary" name="Photo">
				</div>
				<div class="form-group-2">
					<textarea id="Description" name="Description" class="form-control" placeholder="Décrivez le problème" rows="5" cols="25"></textarea>
					<label for="Description">Description</label>
				</div>
				<input id="Nom" type="hidden" name="Nom" value="<%= userService.getCurrentUser().getNickname() %>" required>
				<br />
				<div class="form-group">
					<button type="submit" class="btn btn-connexion"><span class="glyphicon glyphicon-ok-sign"></span> Envoyer</button>
					<button type="submit" class="btn btn-connexion"><span class="glyphicon glyphicon-remove-sign"></span> Annuler</button>
				</div>
			</form>
		</div>
		
	  	
	  	<br />
		<br />
	  	<div class="col-md-8 thumbnail" id="EmplacementDeMaCarte"></div>
	  <!-- <div id="EmplacementDeMaCarte" style="float:top; position:absolute; height:63%;width:100%;z-index: 1;"></div> -->
		<noscript>
				<p>Attention : </p>
				<p>Afin de pouvoir utiliser Google Maps, JavaScript doit être activé.</p>
				<p>Or, il semble que JavaScript est désactivé ou qu'il ne soit pas supporté par votre navigateur.</p>
				<p>Pour afficher Google Maps, activez JavaScript en modifiant les options de votre navigateur, puis essayez à nouveau.</p>
		</noscript>
		
		

		<div class="container-fluid">
		<div class="row-fluid">
			<div class="panel panel-default">
			  <div class="panel-heading">
			    <h1 class="panel-title" style="color:#07738C; font-style:bold; font-size:25px;"><em>Suggestion d'incidents</em></h1>
			  </div>
			  <div class="panel-body" style="background-color:#EFFEFF;">
			  <div class="col-md-offset-1">
			  
			  <%
			  	List<Entity> incidents = (List<Entity>) request.getAttribute("incidents");
			  	for (Entity incident : incidents) {
			  		 
			  %>  
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
		          <%
			  		}
		          %>
			  </div>
			  </div>
			</div>
		</div>
		</div>
		

<%@include file="footer.jsp" %>