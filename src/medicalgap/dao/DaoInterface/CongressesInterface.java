package medicalgap.dao.DaoInterface;


import java.util.List;

import medicalgap.dao.entity.Congresses;
public interface CongressesInterface {

	public Congresses addCongresse(Congresses congresse);
	public void deleteCongresse(Congresses congresse);
	public Congresses updateCongresse(Congresses congresse);
	public Congresses getCongresse(long id_congresse);
	public List<Congresses> getAllCongresses();
	public List<Congresses> getAllCongresses(String categorie);
	public List<Congresses> getAllCongresses(String type,String categorie);
}
