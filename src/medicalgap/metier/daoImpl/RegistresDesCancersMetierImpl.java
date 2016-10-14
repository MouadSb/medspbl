package medicalgap.metier.daoImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import medicalgap.dao.DaoInterface.RegistresDesCancersInterface;
import medicalgap.dao.entity.RegistresDesCancers;
import medicalgap.metier.daoInterface.RegistresDesCancersInterfaceMetier;

@Component
public class RegistresDesCancersMetierImpl implements
		RegistresDesCancersInterfaceMetier {

	@Autowired
	private RegistresDesCancersInterface registresDesCancersDAO;

	public void setRegistresDesCancersDAO(
			RegistresDesCancersInterface registresDesCancersDAO) {
		this.registresDesCancersDAO = registresDesCancersDAO;
	}

	@Override
	public RegistresDesCancers addRegistre(RegistresDesCancers rg) {
		return registresDesCancersDAO.addRegistre(rg);
	}

	@Override
	public void deleteRegistre(RegistresDesCancers rg) {
		registresDesCancersDAO.deleteRegistre(rg);
	}

	@Override
	public RegistresDesCancers updateRegistre(RegistresDesCancers rg) {
		return registresDesCancersDAO.updateRegistre(rg);
	}

	@Override
	public RegistresDesCancers getRegistre(long id_rg) {
		return registresDesCancersDAO.getRegistre(id_rg);
	}

	@Override
	public List<RegistresDesCancers> getAllRegistres(String categorie) {
		return registresDesCancersDAO.getAllRegistres(categorie);
	}

	@Override
	public List<RegistresDesCancers> getAllRegistres(String type,
			String categorie) {
		return registresDesCancersDAO.getAllRegistres(type, categorie);
	}

	@Override
	public List<RegistresDesCancers> getAllRegistres(String type,
			String categorie, String ville) {
		return registresDesCancersDAO.getAllRegistres(type, categorie, ville);
	}

	@Override
	public List<String> getAllCategories() {
		return registresDesCancersDAO.getAllCategories();
	}

	@Override
	public List<String> getAllTypes() {
		return registresDesCancersDAO.getAllTypes();
	}


}
