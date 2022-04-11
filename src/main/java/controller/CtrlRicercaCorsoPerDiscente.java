package controller;

import java.io.IOException;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.DiscenteService;
import model.dao.DocenteService;
import model.session.Corso;
import model.session.Discente;
import model.session.Docente;

@WebServlet("/CtrlRicercaCorsoPerDiscente")
public class CtrlRicercaCorsoPerDiscente extends HttpServlet{
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static DiscenteService oDisc = new DiscenteService();

	
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
		List<Discente> elenco = new DiscenteService().findAll();
		Set<Corso> corsiDiscente = oDisc.findById(Integer.parseInt(request.getParameter("rdoIDDiscente"))).getCorsi();
		request.setAttribute("elencoDiscenti", elenco);
		request.setAttribute("corsiDiscente", corsiDiscente);
		getServletContext().getRequestDispatcher("/ArchivioCorso/PgRicercaCorsiPerDiscente.jsp").forward(request, response);
	}


	private void visualizzaHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Discente> elenco = new DiscenteService().findAll();
		request.setAttribute("elencoDiscenti", elenco);
		getServletContext().getRequestDispatcher("/ArchivioCorso/PgRicercaCorsoDic.jsp").forward(request, response);
	}
}
