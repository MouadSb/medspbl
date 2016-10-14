package medicalgap.dao.DaoInterface;

import java.util.List;

import medicalgap.dao.entity.Typecongresse;

public interface CongresseTypeInterface {

	public Typecongresse addCongresse(Typecongresse congresse);
	public void deleteCongresse(Typecongresse congresse);
	public Typecongresse updateCongresse(Typecongresse congresse);
	public Typecongresse getCongresse(int id_congresse);
	public List<Typecongresse> getAllCongresses();
	public List<Typecongresse> getAllCongressesC(String nameC);

}
