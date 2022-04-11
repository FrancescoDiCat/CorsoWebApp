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



<FORM method="post" action="/Corso/CtrlGestioneCorso">

<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-4">Eliminazione Corso</h1>
    <p class="lead">Sei sicuro di voler eliminare il corso?</p>
  </div>
</div>

<div class="container">
		<INPUT type="submit" class="btn btn-danger" name="azioneUtente" value="Conferma" size="20" maxlength="50">
		<INPUT type="submit" class="btn btn-secondary" name="azioneUtente" value="Annulla" size="20" maxlength="50">
</div>
</FORM>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	 integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
	 crossorigin="anonymous"></script>
</body>
</html>