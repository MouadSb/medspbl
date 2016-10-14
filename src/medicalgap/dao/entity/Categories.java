package medicalgap.dao.entity;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "categories", catalog = "medicalgap")
public class Categories implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5580650196377526851L;

	public Categories(int id_categorie, String name) {
		super();
		this.id_categorie = id_categorie;
		this.name = name;
	}

	public Categories() {
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id_categorie", unique = true, nullable = false)
	private int id_categorie;
	
	@Column(name = "nom", length = 200)
	private String name;
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	
	
	public int getId_categorie() {
		return id_categorie;
	}

	public void setId_categorie(int id_categorie) {
		this.id_categorie = id_categorie;
	}

	@Override
	public String toString() {
		return "DepartmentVO [id=" + id_categorie + ", name=" + name + "]";
	}
}
