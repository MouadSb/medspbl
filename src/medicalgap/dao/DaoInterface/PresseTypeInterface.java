package medicalgap.dao.DaoInterface;

import java.util.List;

import medicalgap.dao.entity.TypePresse;

public interface PresseTypeInterface {

	public TypePresse addPresseSante( TypePresse presseSante);
	public void deletePresseSante(TypePresse presseSante);
	public TypePresse updatePresseSante(TypePresse presseSante);
	public TypePresse getPresseSante(int id_presseSante);
	public List<TypePresse> getAllPresseSantes();
	public List<TypePresse> getAllPresseSantesC(String nameC);

}
