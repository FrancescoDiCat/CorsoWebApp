<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="model.session.Aula"
import="model.dao.AulaService"
import="model.dao.AulaDAO"%>
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
<TITLE>pgsArchivioDiscente.jsp</TITLE>
</HEAD>
<BODY>

<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-4">Archivio Aula</h1>
  </div>
</div>
<FORM method="post" action="/Corso/CtrlArchivioAula" name="ArchivioAula">

<% List<Aula> pgsElenco= (List<Aula>) request.getAttribute("elencoAule");
   if(pgsElenco.size() > 0){
   		int i = 0;
   
%>
<div class="container">
	<TABLE class="table table-bordered" >
<TBODY>
<TR>
<TD> </TD>
<TD>Descrizione</TD>   		
<TD>Numero Posti</TD>  
</TR>

<%while(i< pgsElenco.size()){
	%>
	<TR>
		<TD>
			<input type="radio" name="rdoIDAula" value="<%= ((Aula)pgsElenco.get(i)).getId_aula() %>" > 
		</TD>
		<TD> <%= ((Aula)pgsElenco.get(i)).getDescrizione() %></TD>
		<TD> <%= ((Aula)pgsElenco.get(i)).getNum_posti() %></TD>	
	</TR>
	<% i++;
	} %>	
</TBODY>
</TABLE>
</div>
<P> </P>
<% } else{%><div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-2">Non ci sono aule</h1>
  </div>
</div><% } %> 	

<div class="container">
		<input type="submit" class="btn btn-primary" name="azioneUtente" value="Nuovo">
		<input type="submit" class="btn btn-primary" name="azioneUtente" value="Modifica">
		<input type="submit" class="btn btn-danger" name="azioneUtente" value="Elimina">
		<input type="submit" class="btn btn-secondary" name="azioneUtente" value="Torna alla Home">
	</div>
</Form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	 integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
	 crossorigin="anonymous"></script>
</BODY>
</HTML>