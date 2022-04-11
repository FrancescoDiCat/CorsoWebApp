package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.DocenteService;
import model.session.Corso;
import model.session.Docente;

@WebServlet("/CtrlRicercaCorsoPerDocente")
public class CtrlRicercaCorsoPerDocente extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static DocenteService oDoc = new DocenteService();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String azione= request.getParameter("azioneUtente");
		
		if(azione==null) {
			visualizzaHome(request, response);
		}else if(azione.equals("Cerca")) {
			visualizzaCorsi(request, response);
		}
	}

	private void visualizzaCorsi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Docente> elenco = new DocenteService().findAll();
		List<Corso> corsiDocente = oDoc.findById(Integer.parseInt(request.getParameter("rdoIDDocente"))).getCorsi();
		request.setAttribute("elencoDocenti", elenco);
		request.setAttribute("corsiDocente", corsiDocente);
		getServletContext().getRequestDispatcher("/ArchivioCorso/PgRicercaCorsiDocente.jsp").forward(request, response);
	}

	private void visualizzaHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Docente> elenco = new DocenteService().findAll();
		request.setAttribute("elencoDocenti", elenco);
		getServletContext().getRequestDispatcher("/ArchivioCorso/PgRicercaCorso.jsp").forward(request, response);
	}

}
