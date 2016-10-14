package medicalgap.dao.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the type_registre database table.
 * 
 */
@Entity
@Table(name="type_registre")
@NamedQuery(name="TypeRegistre.findAll", query="SELECT t FROM TypeRegistre t")
public class TypeRegistre implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Column(name="nom_categorie")
	private String nomCategorie;

	@Column(name="type_registre")
	private String typeRegistre;

	public TypeRegistre() {
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

	public String getTypeRegistre() {
		return this.typeRegistre;
	}

	public void setTypeRegistre(String typeRegistre) {
		this.typeRegistre = typeRegistre;
	}

}