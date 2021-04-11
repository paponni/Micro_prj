package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Article;
import dao.InterArticle;
import dao.InterArticleImpl;
@WebServlet("/CategorieController")
public class CategorieController extends HttpServlet{
	InterArticle ia;
	
	@Override
	public void init() throws ServletException {
		ia=new InterArticleImpl();
	}
	
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
	String categorie=request.getParameter("select");
	System.out.println(categorie);
	
	List<Article> articles=new ArrayList<Article>();
	articles=ia.findArticle(categorie);
	request.setAttribute("articles", articles);
	request.getRequestDispatcher("catalogue.jsp").forward(request, response);
		
	
}

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doGet(request, response);
}

}
