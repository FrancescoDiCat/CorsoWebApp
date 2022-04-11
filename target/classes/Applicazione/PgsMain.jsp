<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<%@ page 
language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
%>

<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<TITLE>pgsMain.jsp</TITLE>
</HEAD>
<BODY>

<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-4">Menu Gestione</h1>
    <p class="lead">Da qui puoi gestire tutto ciò che riguarda i tuoi corsi di formazione</p>
  </div>
</div>

<form method="post" action="/Corso/CtrlMain">
<div class="container">
	<table class="table table-bordered">
  <thead>
    <tr>
		<td text_align ="">SELEZIONA UN OPZIONE</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><INPUT type="radio" name="rdoScelta" value="0" checked="checked"></td>
      <td>ARCHIVIO DOCENTE</td>
    </tr>
    <tr>
      <td><INPUT type="radio" name="rdoScelta" value="1" ></td>
      <td>ARCHIVIO DISCENTE</td>
    </tr>
    
    <tr>
      <td><INPUT type="radio" name="rdoScelta" value="2" ></td>
      <td>ARCHIVIO AULA</td>
    </tr>
    
    <tr>
      <td><INPUT type="radio" name="rdoScelta" value="3" ></td>
      <td>GESTIONE CORSO</td>
    </tr>
    
    <tr>
      <td><INPUT type="radio" name="rdoScelta" value="4" ></td>
      <td>RICERCA CORSO PER DOCENTE</td>
    </tr>
    
     <tr>
      <td><INPUT type="radio" name="rdoScelta" value="5" ></td>
      <td>RICERCA CORSO PER DISCENTE</td>
    </tr>
  </tbody>
</table>
</div>


<div align="center">
<BR>
<button class="btn btn-primary" type="submit" name="cmdInvio" value="Invio">Invio</button>
</div>
</form>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	 integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
	 crossorigin="anonymous"></script>
</BODY>
</HTML>