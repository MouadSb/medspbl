package medicalgap.dao.DaoInterface;


import java.util.List;

import medicalgap.dao.entity.RegistresDesCancers;


public interface RegistresDesCancersInterface {

	public RegistresDesCancers addRegistre(RegistresDesCancers rg);
	public void deleteRegistre(RegistresDesCancers rg);
	public RegistresDesCancers updateRegistre(RegistresDesCancers rg);
	public RegistresDesCancers getRegistre(long id_rg);
	public List<RegistresDesCancers> getAllRegistres(String categorie);
	public List<RegistresDesCancers> getAllRegistres(String type,String categorie);
	public List<RegistresDesCancers> getAllRegistres(String type,String categorie, String ville);
	public List<String> getAllCategories();
	public List<String> getAllTypes();
	
}