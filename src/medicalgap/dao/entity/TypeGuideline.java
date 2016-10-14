package medicalgap.dao.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the type_guidelines database table.
 * 
 */
@Entity
@Table(name="type_guidelines")
@NamedQuery(name="TypeGuideline.findAll", query="SELECT t FROM TypeGuideline t")
public class TypeGuideline implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Column(name="guidelines_type")
	private String guidelinesType;

	@Column(name="nom_categorie")
	private String nomCategorie;

	public TypeGuideline() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGuidelinesType() {
		return this.guidelinesType;
	}

	public void setGuidelinesType(String guidelinesType) {
		this.guidelinesType = guidelinesType;
	}

	public String getNomCategorie() {
		return this.nomCategorie;
	}

	public void setNomCategorie(String nomCategorie) {
		this.nomCategorie = nomCategorie;
	}

}