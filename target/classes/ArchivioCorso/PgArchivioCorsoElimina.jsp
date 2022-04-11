<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>pgsArchivioCorsoElimina.jsp</title>
</head>
<body>
<jsp:useBean id="beanCorso" scope="session"
	class="model.session.Corso">
	<jsp:setProperty name="beanCorso" property="*" />
</jsp:useBean>

<P align="center"><FONT size="+2" color="green">Sei sicuro di voler eliminare il Corso?</FONT></P>


<FORM method="post" action="/Corso/CtrlGestioneCorso">

<TABLE  align="center" >
<tr>

	
	
	<td>
		<INPUT type="submit" name="azioneUtente" value="Conferma" size="20" maxlength="50">
	</td>
	
</tr>	

<tr>

	<td>
	&nbsp;
	</td>
	
</tr>

<tr>


	
	<td>
		 
	<INPUT type="submit" name="azioneUtente" value="Annulla" size="20" maxlength="50">
	
	</td>
	
</tr>
</TABLE >
</FORM>
</body>
</html>