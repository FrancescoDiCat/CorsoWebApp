package controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.AulaService;
import model.dao.CorsoService;
import model.dao.DiscenteService;
import model.dao.DocenteService;
import model.session.Aula;
import model.session.Corso;
import model.session.Discente;
import model.session.Docente;
import util.UDate;

@WebServlet("/CtrlGestioneCorso")
public class CtrlGestioneCorso extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static CorsoService oCoSer = new CorsoService();
	private static DocenteService oDoc = new DocenteService();
	private static DiscenteService oDisc = new DiscenteService();
	private static AulaService oAul = new AulaService();
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String azione = request.getParameter("azioneUtente");
		
		if(azione == null) {
			visualizzaElenco(request, response);
		}else if(azione.equals("Nuovo")) {
			nuovoCorso(request, response);
		}else if(azione.equals("Registra")) {
			salvaCorso(request, response);
			visualizzaElenco(request, response);
		}else if(azione.equals("Modifica")) {
			modificaDocente(request, response);
		}else if(azione.equals("Elimina")) {
			elimiaCorso(request, response);
		}else if(azione.equals("Conferma")){
			cancellaCorso(request, response);
			visualizzaElenco(request, response);
		}else if(azione.equals("Annulla")) {
			visualizzaElenco(request, response);
		}else if(azione.equals("Torna alla Home")) {
			getServletContext().getRequestDispatcher("/CtrlMain").forward(request, response);
		}
	}


	private void cancellaCorso(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		oCoSer.delete(((Corso)request.getSession().getAttribute("beanCorso")).getId_corso());
	}


	private void elimiaCorso(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Corso oCorso = oCoSer.findById(Integer.parseInt(request.getParameter("rdoIDCorso")));
		request.getSession().setAttribute("beanCorso", oCorso);
		getServletContext().getRequestDispatcher("/ArchivioCorso/PgArchivioCorsoElimina.jsp").forward(request, response);
	}


	private void modificaDocente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Docente> elenco = new DocenteService().findAll();
		request.setAttribute("elencoDocenti", elenco);
		Corso oCorso = oCoSer.findById(Integer.parseInt(request.getParameter("rdoIDCorso")));
		request.getSession().setAttribute("beanCorso", oCorso);
		getServletContext().getRequestDispatcher("/ArchivioCorso/PgArchivioCorsoModifica.jsp").forward(request, response);
	}


	private void salvaCorso(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		Corso oCorso = (Corso) request.getSession().getAttribute("beanCorso");
		try{
			oCorso.setData_inizio(new GregorianCalendar(Integer.parseInt(request.getParameter("txtAnno")),Integer.parseInt(request.getParameter("txtMese")), Integer.parseInt(request.getParameter("txtGiorno"))));
		
		}catch(Exception ex) {
			System.out.println("Impossibile");
		}
		oCorso.setNome(request.getParameter("txtNome"));
		oCorso.setDurata(Integer.parseInt(request.getParameter("txtDurata")));
		oCorso.setDocente(oDoc.findById(Integer.parseInt(request.getParameter("rdoIDDocente"))));
		String[] matricole =  request.getParameterValues("checkId");
		Set<Discente> partecipanti = new HashSet<Discente>();
		
		
		for(String mat : matricole) {
			partecipanti.add(new DiscenteService().findById(Integer.parseInt(mat)));
		}
		oCorso.setDiscenti(partecipanti);
		oCorso.setAula(oAul.findById(Integer.parseInt(request.getParameter("rdoIDAula"))));
		if(oCorso.getId_corso()==0) {
			oCoSer.persist((Corso) request.getSession().getAttribute("beanCorso"));
		}else {
			oCoSer.update((Corso) request.getSession().getAttribute("beanCorso"));
		}
	}


	private void nuovoCorso(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Docente> elenco = new DocenteService().findAll();
		List<Discente> elencoDisc= new DiscenteService().findAll();
		List<Aula> elencoAule = new AulaService().findAll();
		request.setAttribute("elencoDocenti", elenco);
		request.setAttribute("elencoDiscenti", elencoDisc);
		request.setAttribute("elencoAule", elencoAule);
		Corso oCorso = new Corso();
		request.getSession().setAttribute("beanCorso", oCorso);
		getServletContext().getRequestDispatcher("/ArchivioCorso/PgArchivioCorsoNuovo.jsp").forward(request, response);
	}


	private void visualizzaElenco(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Corso> elenco = new CorsoService().findAll();
		request.setAttribute("elencoCorso", elenco);
		getServletContext().getRequestDispatcher("/ArchivioCorso/PgArchivioCorso.jsp").forward(request, response);
	}
	
	

}
