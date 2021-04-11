package dao;

import java.sql.*;


import Model.Client;

public class InterClientImpl implements InterClient{

	@Override
	public void insertClient(Client c) {
		
		Connection con =SingletonConnection.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement
					("INSERT INTO clients(email,nom,prenom,adresse,codePostal,ville,tel,motDePasse) VALUES(?,?,?,?,?,?,?,?);");
			ps.setString(1,c.getEmail());
			ps.setString(2, c.getNom());
			ps.setString(3,c.getPrenom());
			ps.setString(4,c.getAdresse());
			ps.setInt(5,c.getCodePostal());
			ps.setString(6,c.getVille());
			ps.setInt(7,c.getTel());
			ps.setString(8,c.getMotDePasse());
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Client getClient(String email, String passe) {
		
		
		Client c =new Client();
		
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement
					("SELECT id,email,nom,prenom,adresse,codePostal,ville,tel,motDePasse FROM clients WHERE email=? AND motDePasse=? ;");
			System.out.println("test");
			ps.setString(1,email);
			ps.setString(2,passe);
			ResultSet res=ps.executeQuery();
			while(res.next()) {
				
				c.setId(res.getLong("id"));
				c.setEmail(res.getString("email"));
				c.setNom(res.getString("nom"));
				c.setPrenom(res.getString("prenom"));
				c.setAdresse(res.getString("adresse"));
				c.setCodePostal(res.getInt("codePostal"));
				c.setVille(res.getString("ville"));
				c.setTel(res.getInt("tel"));
				c.setMotDePasse(res.getString("motDePasse"));
				
				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return c;
	}

}
