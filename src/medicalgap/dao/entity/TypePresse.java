package medicalgap.dao.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the type_presse database table.
 * 
 */
@Entity
@Table(name="type_presse")
@NamedQuery(name="TypePresse.findAll", query="SELECT t FROM TypePresse t")
public class TypePresse implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Column(name="nom_categorie")
	private String nomCategorie;

	@Column(name="type_presse")
	private String typePresse;

	public TypePresse() {
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

	public String getTypePresse() {
		return this.typePresse;
	}

	public void setTypePresse(String typePresse) {
		this.typePresse = typePresse;
	}

}