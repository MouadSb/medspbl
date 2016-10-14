package medicalgap.dao.entity;

import java.sql.Timestamp;


public class UserModel {

	private String username;

	private Timestamp dateInsciption;

	private String email;

	private byte enabled;

	private String nom;

	private String password;

	private String prenom;

	private String telephone;
	
	private String fonction;
	
	private String role;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Timestamp getDateInsciption() {
		return dateInsciption;
	}

	public void setDateInsciption(Timestamp dateInsciption) {
		this.dateInsciption = dateInsciption;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public byte getEnabled() {
		return enabled;
	}

	public void setEnabled(byte enabled) {
		this.enabled = enabled;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public UserModel(String fonction, String username, Timestamp dateInsciption, String email,
			byte enabled, String nom, String password, String prenom,
			String telephone, String role) {
		super();
		this.username = username;
		this.dateInsciption = dateInsciption;
		this.email = email;
		this.enabled = enabled;
		this.nom = nom;
		this.password = password;
		this.prenom = prenom;
		this.telephone = telephone;
		this.role = role;
		this.fonction = fonction;
	}

	public UserModel() {
		super();
	}

	public String getFonction() {
		return fonction;
	}

	public void setFonction(String fonction) {
		this.fonction = fonction;
	}

	
	
}
