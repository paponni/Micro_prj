package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Client;
import dao.InterClient;
import dao.InterClientImpl;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	private InterClient client ;
	
	@Override
	public void init() throws ServletException {
		 client= new InterClientImpl();
	}
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
if(request.getParameter("valider").equals("Inscription")) {
		String email=request.getParameter("email");
		String nom=request.getParameter("nom");
		String prenom=request.getParameter("prenom");
		String adresse=request.getParameter("adresse");
		int codepostal=Integer.parseInt(request.getParameter("codepostal"));
		String ville=request.getParameter("ville");
		int tel=Integer.parseInt(request.getParameter("tel"));
		String motdepasse=request.getParameter("motdepasse");
		
		
		Client c=new Client();
		c.setEmail(email);
		c.setNom(nom);
		c.setPrenom(prenom);
		c.setAdresse(adresse);
		c.setCodePostal(codepostal);
		c.setVille(ville);
		c.setTel(tel);
		c.setMotDePasse(motdepasse);
		
		client.insertClient(c);
		request.getRequestDispatcher("identification.jsp").forward(request, response);
		
		}
		else if(request.getParameter("valider").equals("Identifier")) {
			String email=request.getParameter("email");
			String motdepasse=request.getParameter("motdepasse");
			
		Client c=client.getClient(email, motdepasse);
		String prenom=c.getPrenom();
		request.setAttribute("prenom", prenom);
		System.out.println(c.getEmail());
				if(c.getEmail()==null) {
					request.getRequestDispatcher("Inscription.jsp").forward(request, response);
				}
				else {
				
				request.getRequestDispatcher("Accueil1.jsp").forward(request, response);
		
		}
				
		}
		else {}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
