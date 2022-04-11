<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>pgsArchivioAulaElimina.jsp</title>
</head>
<body>
<jsp:useBean id="beanAula" scope="session"
	class="model.session.Aula">
	<jsp:setProperty name="beanAula" property="*" />
</jsp:useBean>

<P align="center"><FONT size="+2" color="green">Sei sicuro di voler eliminare l'Aula?</FONT></P>


<FORM method="post" action="/Corso/CtrlArchivioAula">

<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-4">Eliminazione Aula</h1>
    <p class="lead">Sei sicuro di voler eliminare l'aula?</p>
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