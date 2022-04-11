package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.AulaService;
import model.session.Aula;
import model.session.Docente;

@WebServlet("/CtrlArchivioAula")
public class CtrlArchivioAula extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private AulaService oAulaSer = new AulaService();
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String azione = request.getParameter("azioneUtente");
		
		if(azione== null) {
			visualizzaElenco(request, response);
		}else if(azione.equals("Nuovo")) {
			nuovaAula(request, response);
		}else if(azione.equals("Modifica")) {
			modificaAula(request, response);
		}else if(azione.equals("Registra")) {
			salvaAula(request, response);
			visualizzaElenco(request, response);
		}else if(azione.equals("Torna alla Home")) {
			getServletContext().getRequestDispatcher("/CtrlMain").forward(request, response);
		}else if(azione.equals("Elimina")) {
			eliminaAula(request, response);
		}else if(azione.equals("Conferma")) {
			cancellaAula(request, response);
			visualizzaElenco(request, response);
		}else if(azione.equals("Annulla")) {
			visualizzaElenco(request, response);
		}
	}


	private void cancellaAula(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		oAulaSer.delete(((Aula)request.getSession().getAttribute("beanAula")).getId_aula());
	}


	private void eliminaAula(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Aula oggAula = oAulaSer.findById(Integer.parseInt(request.getParameter("rdoIDAula")));
		request.getSession().setAttribute("beanAula", oggAula);
		getServletContext().getRequestDispatcher("/ArchivioAula/PgArchivioAulaElimina.jsp").forward(request, response);
	}


	private void salvaAula(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		Aula oggAula = (Aula) request.getSession().getAttribute("valoreAula");
		oggAula.setDescrizione(request.getParameter("txtDescrizione"));
		oggAula.setNum_posti(Integer.parseInt(request.getParameter("txtNumPosti")));
		if(oggAula.getId_aula()==0) {
			oAulaSer.persist((Aula) request.getSession().getAttribute("valoreAula"));
		}else {
			oAulaSer.update((Aula) request.getSession().getAttribute("valoreAula"));
		}
	}


	private void modificaAula(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Aula oggAula = oAulaSer.findById(Integer.parseInt(request.getParameter("rdoIDAula")));
		request.getSession().setAttribute("valoreAula", oggAula);
		getServletContext().getRequestDispatcher("/ArchivioAula/PgArchivioAulaNuovoModifica.jsp").forward(request, response);
	}


	private void nuovaAula(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Aula oAula = new Aula();
		request.getSession().setAttribute("valoreAula", oAula);
		getServletContext().getRequestDispatcher("/ArchivioAula/PgArchivioAulaNuovoModifica.jsp").forward(request, response);
	
	}


	private void visualizzaElenco(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Aula> elencoAule = new AulaService().findAll();
		request.setAttribute("elencoAule", elencoAule);
		getServletContext().getRequestDispatcher("/ArchivioAula/PgArchivioAula.jsp").forward(request, response);
	}

}
