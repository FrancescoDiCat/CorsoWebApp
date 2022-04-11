<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<%@ page 
language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
%>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<TITLE>pgsArchivioDocenteNuovoModifica.jsp</TITLE>
</HEAD>
<BODY>

<jsp:useBean id="beanDocente" scope="session"
	class="model.session.Docente">
	<jsp:setProperty name="beanDocente" property="*" />
</jsp:useBean>

<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-4">Crea Nuovo Docente</h1>
  </div>
</div>


<FORM method="post" action="/Corso/CtrlArchivioDocente">

<div class="container">

  <div class="form-row">
    <div class="form-group col-md-6">
    <label for="cognomeDoc">Cognome</label>
      <input type="text" name="txtCognome" class="form-control" value="<%= beanDocente.getCognome()%>" id="cognomeDoc">
    </div>
    <div class="form-group col-md-6">
    <label for="nomeDoc">Nome</label>
      <input type="text" name="txtNome" class="form-control" value="<%= beanDocente.getNome()%>" id="nomeDoc">
    </div>
  </div>

</div>

<BR/> 
<BR/>

<div class="container">
	<INPUT type="submit" class="btn btn-primary" name="cmdAzione" value="Registra">
	<INPUT type="submit" class="btn btn-danger" name="cmdAzione" value="Annulla">
</div>

</FORM>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	 integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
	 crossorigin="anonymous"></script>
</BODY>
</HTML>
