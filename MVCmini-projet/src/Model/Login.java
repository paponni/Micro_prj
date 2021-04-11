package Model;

public class Login {

	private String email;
	private String motdepasse;
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Login(String email, String motdepasse) {
		super();
		this.email = email;
		this.motdepasse = motdepasse;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMotdepasse() {
		return motdepasse;
	}
	public void setMotdepasse(String motdepasse) {
		this.motdepasse = motdepasse;
	}
	
	
	
	
}
