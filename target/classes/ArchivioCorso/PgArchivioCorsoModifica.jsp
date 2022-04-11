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
<TITLE>pgsArchivioCorsoModifica.jsp</TITLE>
</HEAD>
<BODY>

<jsp:useBean id="beanCorso" scope="session"
	class="model.session.Corso">
	<jsp:setProperty name="beanCorso" property="*" />
</jsp:useBean>

<P align="center"><FONT size="+2" color="green">Corso</FONT></P>


<FORM method="post" action="/Corso/CtrlGestioneCorso">


<TABLE  align="center" >
<tr>

	<td>
	 	Data Inizio:	 
	</td>
	
	<td>
		<INPUT type="text" name="txtAnno" value="<%= beanCorso.getData_inizio().get(Calendar.YEAR) %>" size="20" maxlength="50">
		<INPUT type="text" name="txtMese" value="<%= beanCorso.getData_inizio().get(Calendar.MONTH) %>" size="20" maxlength="50">
		<INPUT type="text" name="txtGiorno" value="<%= beanCorso.getData_inizio().get(Calendar.DAY_OF_MONTH) %>" size="20" maxlength="50">
	</td>
	
</tr>	

<tr>

	<td>
	&nbsp;
	</td>
	
</tr>

<tr>

	<td>
		Nome: 
	</td>
	
	<td>
		 
	<INPUT type="text" name="txtNome" value="<%= beanCorso.getNome() %>" size="20" maxlength="50">
	
	</td>
	
</tr>

<tr>

	<td>
	&nbsp;
	</td>
	
</tr>

<tr>

	<td>
		Durata: 
	</td>
	
	<td>
		 
	<INPUT type="text" name="txtDurata" value="<%= beanCorso.getDurata() %>" size="20" maxlength="50">
	
	</td>
	
</tr>
</TABLE >
<BR/> 
<BR/>
<DIV>
<% List<Docente> pgsElenco= (List<Docente>) request.getAttribute("elencoDocenti");
   if(pgsElenco.size() > 0){
   		int i = 0;
   
%>
<TABLE border="1" >
<TBODY>
<TR>
<TD> </TD>
<TD>Cognome</TD>   		
<TD>Nome</TD>  
</TR>

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
<P> </P>
<% } else{%> Non ci sono Docenti<% } %> <BR>
</DIV>
<DIV align="center">

<% List<Discente> elencoDisc= (List<Discente>) request.getAttribute("elencoDiscenti");
   if(elencoDisc.size() > 0){
   		int j = 0;
   
%>
<TABLE border="1" >
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
<P> </P>
<% } else{%> Non ci sono Discenti<% } %> <BR>

<% List<Aula> elencoAule= (List<Aula>) request.getAttribute("elencoAule");
   if(elencoAule.size() > 0){
   		int x = 0;
   
%>
<TABLE border="1" >
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
			<input type="radio" name="rdoAula" value="<%= ((Aula)elencoAule.get(x)).getId() %>" > 
		</TD>
		<TD> <%= ((Aula)elencoAule.get(x)).getDescrizione() %></TD>
		<TD> <%= ((Aula)elencoAule.get(x)).getNumPosti() %></TD>	
	</TR>
	<% x++;
	} %>	
</TBODY>
</TABLE>
<P> </P>
<% } else{%> Non ci sono Aule<% } %> <BR>

</DIV>
<DIV align="center">

<INPUT type="submit" name="azioneUtente" value="Registra"> &nbsp;&nbsp;
<INPUT type="submit" name="azioneUtente" value="Annulla"> <BR>

</DIV>
</FORM>



</BODY>
</HTML>