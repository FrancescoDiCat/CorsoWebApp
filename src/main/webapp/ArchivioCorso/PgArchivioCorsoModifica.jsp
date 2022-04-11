<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<%@ page 
language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
import="model.session.Docente"
import="model.dao.DocenteService"
import="model.dao.DocenteDAO"
import="java.util.*"
import="model.session.Discente"
import="model.dao.DiscenteService"
import="model.dao.DiscenteDAO"
import="model.session.Aula"
import="model.dao.AulaService"
import="model.dao.AulaDAO"%>

<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<TITLE>pgsArchivioCorsoModifica.jsp</TITLE>
</HEAD>
<BODY>

<jsp:useBean id="beanCorso" scope="session"
	class="model.session.Corso">
	<jsp:setProperty name="beanCorso" property="*" />
</jsp:useBean>

<P align="center"><FONT size="+2" color="green">Corso</FONT></P>


<FORM method="post" action="/Corso/CtrlGestioneCorso">
<div class="container">
	  <div class="form-row">
    <div class="form-group col-md-6">
    <label for="cognomeDoc">Data Inizio</label>
		<INPUT type="text" name="txtAnno" value="<%= beanCorso.getData_inizio().get(Calendar.YEAR) %>" size="20" maxlength="50">
		<INPUT type="text" name="txtMese" value="<%= beanCorso.getData_inizio().get(Calendar.MONTH) %>" size="20" maxlength="50">
		<INPUT type="text" name="txtGiorno" value="<%= beanCorso.getData_inizio().get(Calendar.DAY_OF_MONTH) %>" size="20" maxlength="50">
    </div>
    <div class="form-group col-md-6">
    <label for="nomeDoc">Nome</label>
      	<INPUT type="text" name="txtNome" value="<%= beanCorso.getNome() %>" size="20" maxlength="50">
    </div>
        <div class="form-group col-md-6">
    <label for="nomeDoc">Durata</label>
 		<INPUT type="text" name="txtDurata" value="<%= beanCorso.getDurata() %>" size="20" maxlength="50">
    </div>
  </div>
</div>


<DIV>
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
</div> <% } %> 
<DIV align="center">

<% List<Discente> elencoDisc= (List<Discente>) request.getAttribute("elencoDiscenti");
   if(elencoDisc.size() > 0){
   		int j = 0;
   
%>
<div class="container">
	<TABLE class="table table-bordered">
	<TBODY>
	<TR>
	<TD> </TD>
	<TD>Cognome</TD>   		
	<TD>Nome</TD>  
	</TR>
	
	<%while(j< elencoDisc.size()){
		%>
		<TR>
			<TD>
				<input type="checkbox" name="checkId" value="<%= ((Discente)elencoDisc.get(j)).getMatricola() %>" > 
			</TD>
			<TD> <%= ((Discente)elencoDisc.get(j)).getCognome() %></TD>
			<TD> <%= ((Discente)elencoDisc.get(j)).getNome() %></TD>	
		</TR>
		<% j++;
		} %>	
	</TBODY>
	</TABLE>

</div>

<P> </P>
<% } else{%><div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-2">Non ci sono docenti</h1>
  </div>
</div><% } %>

<% List<Aula> elencoAule= (List<Aula>) request.getAttribute("elencoAule");
   if(elencoAule.size() > 0){
   		int x = 0;
   
%>
<div class="container">
	<TABLE class="table table-bordered" >
<TBODY>
<TR>
<TD> </TD>
<TD>Descrizione</TD>   		
<TD>Numero Posti</TD>  
</TR>

<%while(x< elencoAule.size()){
	%>
	<TR>
		<TD>
			<input type="radio" name="rdoIDAula" value="<%= ((Aula)elencoAule.get(x)).getId_aula() %>" > 
		</TD>
		<TD> <%= ((Aula)elencoAule.get(x)).getDescrizione() %></TD>
		<TD> <%= ((Aula)elencoAule.get(x)).getNum_posti() %></TD>	
	</TR>
	<% x++;
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

</DIV>
<div class="container">
		<input type="submit" class="btn btn-primary" name="azioneUtente" value="Registra">
		<input type="submit" class="btn btn-secondary" name="azioneUtente" value="Annulla">
	</div>

</DIV>
</FORM>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	 integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
	 crossorigin="anonymous"></script>

</BODY>
</HTML>