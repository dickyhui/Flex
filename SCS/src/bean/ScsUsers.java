package bean;

// Generated 2012-10-23 21:34:48 by Hibernate Tools 3.4.0.CR1

/**
 * NioUsers generated by hbm2java
 */
public class ScsUsers implements java.io.Serializable {

	private String username;
	private String password;

	public ScsUsers() {
	}

	public ScsUsers(String username) {
		this.username = username;
	}

	public ScsUsers(String username, String password) {
		this.username = username;
		this.password = password;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}