package medicalgap.dao.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the typecongresse database table.
 * 
 */
@Entity
@NamedQuery(name="Typecongresse.findAll", query="SELECT t FROM Typecongresse t")
public class Typecongresse implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Column(name="congresse_type")
	private String congresseType;

	@Column(name="nom_categorie")
	private String nomCategorie;

	public Typecongresse() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCongresseType() {
		return this.congresseType;
	}

	public void setCongresseType(String congresseType) {
		this.congresseType = congresseType;
	}

	public String getNomCategorie() {
		return this.nomCategorie;
	}

	public void setNomCategorie(String nomCategorie) {
		this.nomCategorie = nomCategorie;
	}

}