<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="model.session.Docente"
import="model.dao.DocenteService"
import="model.dao.DocenteDAO"%>
<HTML>
<HEAD>
<%@ page 
language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
import="java.util.*"
%>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<TITLE>pgsArchivioDocente.jsp</TITLE>
</HEAD>
<BODY>
<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-4">Archivio Docente</h1>
  </div>
</div>
<FORM method="post" action="/Corso/CtrlArchivioDocente" name="ArchivioDocente">
<% List<Docente> pgsElenco= (List<Docente>) request.getAttribute("elencoDocenti");
   if(pgsElenco.size() > 0){
   		int i = 0;
   
%>
<div class="container">
<table  class="table table-bordered">
<thead>
	<tr>
		<td>Cognome</td>
		<td>Nome</td>
    </tr>
</thead>
<TBODY>

<%while(i< pgsElenco.size()){
	%>
	<TR>
		<TD>
			<input type="radio" name="rdoIDDocente" value="<%= ((Docente)pgsElenco.get(i)).getId() %>" > 
		</TD>
		<TD> <%= ((Docente)pgsElenco.get(i)).getCognome() %></TD>
		<TD> <%= ((Docente)pgsElenco.get(i)).getNome() %></TD>	
	</TR>
	<% i++;
	} %>	
</TBODY>
</TABLE>

</div>
<P> </P>
<% } else{%><div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-2">Non ci sono docenti</h1>
  </div>
</div> <% } %> <BR>

	<div class="container">
		<input type="submit" class="btn btn-primary" name="cmdAzione" value="Nuovo">
		<input type="submit" class="btn btn-primary" name="cmdAzione" value="Modifica">
		<input type="submit" class="btn btn-danger" name="cmdAzione" value="Elimina">
		<input type="submit" class="btn btn-secondary" name="cmdAzione" value="Torna alla Home">
	</div>

</Form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	 integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
	 crossorigin="anonymous"></script>
</BODY>
</HTML>
