package dao;

import java.util.List;

import Model.Article;

public interface InterArticle {

	public Article getArticle(int ca);
	public List<Article> findArticle(String categorie);
	
	
	
	
}
