<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="model.session.Corso"
import="model.dao.CorsoService"
import="model.dao.CorsoDAO"
%>
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

<TITLE>pgsArchivioCorso.jsp</TITLE>
</HEAD>
<BODY>

<FORM method="post" action="/Corso/CtrlGestioneCorso" name="GestioneCorso">

<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-4">Archivio Corso</h1>
  </div>
</div>

<% List<Corso> pgsElenco= (List<Corso>) request.getAttribute("elencoCorso");
   if(pgsElenco.size() > 0){
   		int i = 0;
   
%>
<TABLE class="table table-bordered" >
<TBODY>
<TR>
<TD> </TD>
<TD>Data Inizio</TD>   		
<TD>Nome</TD>
<TD>Durata</TD>
<TD>Docente</TD>  
</TR>

<%while(i< pgsElenco.size()){
	%>
	<TR>
		<TD>
			<input type="radio" name="rdoIDCorso" value="<%= ((Corso)pgsElenco.get(i)).getId_corso()%>" > 
		</TD>
		<TD> <%= ((Corso)pgsElenco.get(i)).getData_inizio().get(Calendar.YEAR) %>/<%=((Corso)pgsElenco.get(i)).getData_inizio().get(Calendar.MONTH) %>/<%=((Corso)pgsElenco.get(i)).getData_inizio().get(Calendar.DAY_OF_MONTH) %></TD>
		<TD> <%= ((Corso)pgsElenco.get(i)).getNome() %></TD>
		<TD> <%= ((Corso)pgsElenco.get(i)).getDurata() %> gg</TD>	
		<TD> <%= ((Corso)pgsElenco.get(i)).getDocente().getNome()%> <%= ((Corso)pgsElenco.get(i)).getDocente().getCognome()%></TD>
		<TD> <%= ((Corso)pgsElenco.get(i)).getAula().getDescrizione() %></TD>
	</TR>
	<% i++;
	} %>	
</TBODY>
</TABLE>
<P> </P>
<% } else{%> <div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-2">Non ci sono corsi</h1>
  </div>
</div><% } %> <BR>


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