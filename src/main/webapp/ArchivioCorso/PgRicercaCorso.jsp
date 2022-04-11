<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="model.session.Docente"
import="model.dao.DocenteService"
import="model.dao.DocenteDAO"
import="model.session.Corso"%>
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
<TITLE>RicercaCorsoDocente.jsp</TITLE>
</HEAD>
 
<BODY bgcolor="#ffff00">
<FORM method="post" action="/Corso/CtrlRicercaCorsoPerDocente" name="CtrlRicercaCorsoDocente">
<P>&nbsp;&nbsp; <input type="button" name="azioneUtente" value="Torna alla home" onclick="javascript:location.href='../pgsMenu.htm';">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<font size="+3">Ricerca corso per Docente</font>
</P> 

<Table>
  <tr>  
  	<TD>
<% List<Docente> pgsElenco= (List<Docente>) request.getAttribute("elencoDocenti");
   if(pgsElenco.size() > 0){
   		int i = 0;
   
%>
<TABLE>
<TBODY>
<TR>
<TD> </TD>
<TD>Cognome</TD>   		
<TD>Nome</TD>  
</TR>
<%
while(i< pgsElenco.size()){
	%>
	<TR>
		<TD>
			<input type="radio" name="rdoIDDiscente" value="<%= ((Docente)pgsElenco.get(i)).getId() %>" > 
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
		
	</TD>
	<TD>
	<INPUT type="submit" name="azioneUtente" value="Cerca">
	</TD>
  </tr>
</table>
</FORM>
<br>
<br>
<br>

</BODY>
</HTML>