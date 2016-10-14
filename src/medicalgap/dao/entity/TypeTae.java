package medicalgap.dao.entity;

import java.io.Serializable;

import javax.persistence.*;


/**
 * The persistent class for the type_tae database table.
 * 
 */
@Entity
@Table(name="type_tae")
@NamedQuery(name="TypeTae.findAll", query="SELECT t FROM TypeTae t")
public class TypeTae implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Column(name="nom_categorie")
	private String nomCategorie;

	@Column(name="type_tae")
	private String typeTae;

	public TypeTae() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNomCategorie() {
		return this.nomCategorie;
	}

	public void setNomCategorie(String nomCategorie) {
		this.nomCategorie = nomCategorie;
	}

	public String getTypeTae() {
		return this.typeTae;
	}

	public void setTypeTae(String typeTae) {
		this.typeTae = typeTae;
	}

	public TypeTae(String nomCategorie, String typeTae) {
		super();
		this.nomCategorie = nomCategorie;
		this.typeTae = typeTae;
	}
	
	

}