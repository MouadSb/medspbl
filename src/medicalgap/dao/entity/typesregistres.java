package medicalgap.dao.entity;

public class typesregistres {

	private int id;
	private String name;
	
	
	
	public typesregistres() {
		super();
	}
	public typesregistres(String name) {
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "typesregistres [id=" + id + ", name=" + name + "]";
	}
	
	
	
}
