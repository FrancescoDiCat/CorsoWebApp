package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.DiscenteService;
import model.session.Discente;

@WebServlet("/CtrlArchivioDiscente")
public class CtrlArchivioDiscente extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static DiscenteService oDiscenteSer = new DiscenteService();
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String azione = request.getParameter("azioneUtente");
		
		if(azione == null) {
			visualizzaElenco(request, response);
		}else if(azione.equals("Nuovo")) {
			nuovoDiscete(request, response);
		}else if(azione.equals("Modifica")) {
			modificaDiscente(request, response);
		}else if(azione.equals("Elimina")) {
			eliminaDiscente(request, response);
		}else if(azione.equals("Registra")) {
			salvaDiscente(request, response);
			visualizzaElenco(request, response);
		}else if (azione.equals("Torna alla Home")) {
			getServletContext().getRequestDispatcher("/CtrlMain").forward(request, response);
		}else if(azione.equals("Conferma")) {
			cancellaDiscente(request, response);
			visualizzaElenco(request, response);
		}else if(azione.equals("Annulla")) {
			visualizzaElenco(request, response);
		}
	}


	private void cancellaDiscente(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		oDiscenteSer.delete(((Discente)request.getSession().getAttribute("valoreDiscente")).getMatricola());
	
	}


	private void salvaDiscente(HttpServletRequest request, HttpServletResponse response) {
		Discente oDiscente =(Discente) request.getSession().getAttribute("valoreDiscente");
		oDiscente.setCognome(request.getParameter("txtCognome"));
		oDiscente.setNome(request.getParameter("txtNome"));
		if(oDiscente.getMatricola()==0) {
			oDiscenteSer.persist((Discente) request.getSession().getAttribute("valoreDiscente"));
		}else {
			oDiscenteSer.update((Discente) request.getSession().getAttribute("valoreDiscente"));
		}
	}


	private void eliminaDiscente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Discente oggDiscente = oDiscenteSer.findById(Integer.parseInt(request.getParameter("rdoMatDiscente")));
		request.getSession().setAttribute("valoreDiscente", oggDiscente);
		getServletContext().getRequestDispatcher("/ArchivioDiscente/PgArchivioDiscenteElimina.jsp").forward(request, response);
	}


	private void modificaDiscente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Discente oggDiscente = oDiscenteSer.findById(Integer.parseInt(request.getParameter("rdoMatDiscente")));
		request.getSession().setAttribute("valoreDiscente", oggDiscente);
		getServletContext().getRequestDispatcher("/ArchivioDiscente/PgArchivioDiscenteNuovoModifica.jsp").forward(request, response);
	}


	private void nuovoDiscete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Discente oDiscente = new Discente();
		request.getSession().setAttribute("valoreDiscente", oDiscente);
		getServletContext().getRequestDispatcher("/ArchivioDiscente/PgArchivioDiscenteNuovoModifica.jsp").forward(request, response);
		
	}


	private void visualizzaElenco(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Discente> elenco = new DiscenteService().findAll();
		request.setAttribute("elencoDiscenti", elenco);
		getServletContext().getRequestDispatcher("/ArchivioDiscente/PgArchivioDiscente.jsp").forward(request, response);
		
	}
	
}
