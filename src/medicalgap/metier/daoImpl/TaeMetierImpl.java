package medicalgap.metier.daoImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import medicalgap.dao.DaoInterface.TaeInterface;
import medicalgap.dao.entity.Tae;
import medicalgap.metier.daoInterface.TaeInterfaceMetier;

@Component
public class TaeMetierImpl implements TaeInterfaceMetier {

	@Autowired
	private TaeInterface taeDao;
	
	
	public void setTaeDao(TaeInterface taeDao) {
		this.taeDao = taeDao;
	}

	@Override
	public Tae addTae(Tae tae) {
		return taeDao.addTae(tae);
	}

	@Override
	public void deleteTae(Tae tae) {
		taeDao.deleteTae(tae);
	}

	@Override
	public Tae updateTae(Tae tae) {
		return taeDao.updateTae(tae);
	}

	@Override
	public Tae getTae(long id_tae) {
		return taeDao.getTae(id_tae);
	}

	@Override
	public List<Tae> getAllTaes() {
		return taeDao.getAllTaes();
	}

	@Override
	public List<Tae> getAllTaes(String categorie) {
		return taeDao.getAllTaes(categorie);
	}

	@Override
	public List<Tae> getAllTaes(String categorie, String type) {
		return taeDao.getAllTaes(categorie, type);
	}


}
