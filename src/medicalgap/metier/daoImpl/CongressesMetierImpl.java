package medicalgap.metier.daoImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import medicalgap.dao.DaoInterface.CongressesInterface;
import medicalgap.dao.entity.Congresses;
import medicalgap.metier.daoInterface.CongressesInterfaceMetier;

@Component
public class CongressesMetierImpl implements CongressesInterfaceMetier {
	@Autowired
	private CongressesInterface congressesDAO;

	public void setCongressesDAO(CongressesInterface congressesDAO) {
		this.congressesDAO = congressesDAO;
	}

	@Override
	public Congresses addCongresse(Congresses congresse) {
		return congressesDAO.addCongresse(congresse);
	}

	@Override
	public void deleteCongresse(Congresses congresse) {
		congressesDAO.deleteCongresse(congresse);
	}

	@Override
	public Congresses updateCongresse(Congresses congresse) {
		return congressesDAO.updateCongresse(congresse);
	}

	@Override
	public Congresses getCongresse(long id_congresse) {
		return congressesDAO.getCongresse(id_congresse);
	}

	@Override
	public List<Congresses> getAllCongresses() {
		return congressesDAO.getAllCongresses();
	}

	@Override
	public List<Congresses> getAllCongresses(String categorie) {
		return congressesDAO.getAllCongresses(categorie);
	}

	@Override
	public List<Congresses> getAllCongresses(String type, String categorie) {
		return congressesDAO.getAllCongresses(type, categorie);
	}


}
