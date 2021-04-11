package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import Model.Article;

public class InterArticleImpl implements InterArticle{

	@Override
	public Article getArticle(int ca) {
		
		Connection conn =SingletonConnection.getConnection();
		Article article= new Article();
		
		
		try {
			PreparedStatement ps=conn.prepareStatement
					("SELECT * FROM articles WHERE codeArticle =?");
			ps.setInt(1,ca);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				
				article.setCodeArticle(rs.getInt("codeArticle"));
				article.setDesignation(rs.getString("designation"));
				article.setPrix(rs.getDouble("prix"));
				article.setStock(rs.getString("stock"));
				article.setCategorie(rs.getString("categorie"));
				article.setPhoto(rs.getString("photo"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return article;
	}

	@Override
	public List<Article> findArticle(String categorie) {
		
		Connection conn=SingletonConnection.getConnection();
		List<Article> a=new ArrayList<Article>();
		Article article=new Article();
		
		
		try {
			PreparedStatement ps=conn.prepareStatement
					("SELECT * FROM articles WHERE categorie=?");
			ps.setString(1, categorie);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				article.setCodeArticle(rs.getInt("codeArticle"));
				article.setDesignation(rs.getString("designation"));
				article.setPrix(rs.getDouble("prix"));
				article.setStock(rs.getString("stock"));
				article.setCategorie(rs.getString("categorie"));
				article.setPhoto(rs.getString("photo"));
				a.add(article);
								}
			}
		 catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return a;
	}

	
	
}
