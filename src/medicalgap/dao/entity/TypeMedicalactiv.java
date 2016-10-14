package medicalgap.dao.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the type_medicalactiv database table.
 * 
 */
@Entity
@Table(name="type_medicalactiv")
@NamedQuery(name="TypeMedicalactiv.findAll", query="SELECT t FROM TypeMedicalactiv t")
public class TypeMedicalactiv implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Column(name="nom_categorie")
	private String nomCategorie;

	@Column(name="type_medical")
	private String typeMedical;

	public TypeMedicalactiv() {
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

	public String getTypeMedical() {
		return this.typeMedical;
	}

	public void setTypeMedical(String typeMedical) {
		this.typeMedical = typeMedical;
	}

}