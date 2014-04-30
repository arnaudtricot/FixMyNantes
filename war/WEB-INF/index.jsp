
	<%@ page import="com.google.appengine.api.users.*" %>	
	<% UserService userService = UserServiceFactory.getUserService(); %><!DOCTYPE html>
<html lang="fr">
	<head>
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
		<meta charset="UTF-8" />
		<link type="text/css" rel="stylesheet" href="/bootstrap/css/bootstrap.css"/>
		<title>FixMyNantes</title>
	</head>
	  <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	  <div class="container-fluid">
	  </div>
	  </div>
	  <body>
		<br />
		<br />
		<br />
	<div class="container-fluid">	
		<div class="col-md-2 col-md-offset-3">
			<img SRC="/bootstrap/fonts/logo.png" ALT="Logo de Fix My Nantes">
		</div>
	</div>
	<div class="container-fluid">
		<hr>
		<div class="row-fluid text-center">
			<cite>To keep pleasant city, share problems you see!</cite>
		</div>
		<hr>
	</div>
	<br />
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-md-6">
			<div class="container-fluid lead">
				<h1 style="color:#07738C; font-style:italic;">Bienvenue !</h1>
				<br />
				<p>Ici tu peux échanger sur les incidents que tu as rencontrés dans ta ville afin qu'ils soient réglés au plus vite ! </p>
			</div>
			</div>
			<div class="col-md-1 ligne_verticale"></div>
			<div class="col-md-5">
			<div class="container-fluid">
			<br />
				<fieldset>
				<legend>Connexion</legend>
				<div class="control-group">
					<p style="font-size:15px;">Pour se connecter au site il vous faudra créer un compte gmail !</p>
					<br />
					<div class="col-md-offset-2">	
						<a class="btn btn-connexion btn-lg" href="<%= userService.createLoginURL("/fixmynantes/home") %>"><span class="glyphicon glyphicon-ok-sign"></span> Se connecter</a>
					</div>
					<br />
				</div>
				</fieldset>
			</div>
			</div>
		</div>
	</div>
	<div class="panel-footer small text-center">
            <p style="color:#FFF; font-weight:bold;"> Jessy JARNOUX / Arnaud TRICOT</p>
            <p style="color:#FFF"> Copyright &#169; 2014 <strong>Fix My Nantes</strong> - Design with <em><a href=http://getbootstrap.com>Twitter Bootstrap</a></em> - Code source sur <a href=https://github.com/>Github</a></p> 
    </div>
	
		
		<%@include file="footer.jsp" %>