<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.google.appengine.api.users.*" %>

<% UserService userService = UserServiceFactory.getUserService(); %>

<!DOCTYPE html>
<html lang="fr">
	<head>
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
		<meta charset="UTF-8" />
		<link type="text/css" rel="stylesheet" href="/bootstrap/css/bootstrap.css"/>
		<title>FixMyNantes</title>
	</head>
	
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
	        <span class="sr-only">Toggle navigation</span>
	      </button>
	      <a class="navbar-brand" href="<%=request.getContextPath()+"/fixmynantes/home"%>"><span class="glyphicon glyphicon-home"></span><img SRC="/bootstrap/fonts/logo_small.png" ALT="Logo de Fix My Nantes"></a>
	    </div>
	    <div class="collapse navbar-collapse">
	      <ul class="nav navbar-nav">
<!-- class="active" -->	        <li><a href="<%=request.getContextPath()+"/fixmynantes/reportproblem"%>">Reporter un problème</a></li>
	        <li><a href="<%=request.getContextPath()+"/fixmynantes/myalerts"%>">Mes alertes</a></li>
	        <li><a href="<%=request.getContextPath()+"/fixmynantes/allalerts"%>">Toutes les alertes</a></li>
	        <!-- <li><a href="<%=request.getContextPath()+"/fixmynantes/help"%>">Aide</a></li> -->
	        <li><a href="<%=request.getContextPath()+"/fixmynantes/mostliked"%>">Les plus likés</a></li>
	      </ul>
	      <% if (userService.getCurrentUser() != null) { %>
  		  <ul class="nav navbar-nav pull-right">
  		  	<li> <a href="#"><%= userService.getCurrentUser().getEmail() %></a></li>
	        <li><a href="<%= userService.createLogoutURL("/") %>"><span class="glyphicon glyphicon-remove-sign"></span> Déconnexion</a></li>
  		  </ul>
  		  <% } %>
	    </div><!--/.nav-collapse -->
	  </div>
	  </div>
	  
	  <body>