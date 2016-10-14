package medicalgap.dao.DaoInterface;

import java.util.List;

import medicalgap.dao.entity.TypeRegistre;

public interface RegistreTypeInterface {

	public TypeRegistre addTypeRegistre(TypeRegistre rg);
	public void deleteTypeRegistre(TypeRegistre rg);
	public TypeRegistre updateTypeRegistre(TypeRegistre rg);
	public TypeRegistre getTypeRegistre(int id_rg);
	public List<TypeRegistre> getAllTypeRegistres();
	public List<TypeRegistre> getAllTypeRegistresC(String nameC);

}
