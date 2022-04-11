<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="model.session.Discente"
import="model.dao.DiscenteService"
import="model.dao.DiscenteDAO"
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
<TITLE>RicercaCorsoDiscente.jsp</TITLE>
</HEAD>
 
<BODY>
<FORM method="post" action="/Corso/CtrlRicercaCorsoPerDiscente" name="CtrlRicercaCorsoDiscente">
<P>&nbsp;&nbsp; <input type="button" name="azioneUtente" value="Torna alla home" onclick="javascript:location.href='../pgsMenu.htm';">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<font size="+3">Ricerca corso per Discente</font>
</P> 

<Table>
  <tr>  
  	<TD>
<% List<Discente> pgsElenco= (List<Discente>) request.getAttribute("elencoDiscenti");
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
			<input type="radio" name="rdoIDDocente" value="<%= ((Discente)pgsElenco.get(i)).getMatricola() %>" > 
		</TD>
		<TD> <%= ((Discente)pgsElenco.get(i)).getCognome() %></TD>
		<TD> <%= ((Discente)pgsElenco.get(i)).getNome() %></TD>	
	</TR>
	<% i++;
	} %>	
</TBODY>
</TABLE>
<P> </P>
<% } else{%> Non ci sono Discenti<% } %> <BR>
		
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