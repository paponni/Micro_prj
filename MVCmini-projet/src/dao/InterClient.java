package dao;

import Model.Client;

public interface InterClient {

	public void	insertClient(Client c);
	public Client getClient(String email,String passe);

}
