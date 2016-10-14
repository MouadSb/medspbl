package medicalgap.metier.daoImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import medicalgap.dao.DaoInterface.GuidelinesInterface;
import medicalgap.dao.entity.Guidelines;
import medicalgap.metier.daoInterface.GuidelinesInterfaceMetier;

@Component
public class GuidelinesMetierImpl implements GuidelinesInterfaceMetier {
	
	@Autowired
	private GuidelinesInterface guidelinesDAO;

	public void setGuidelinesDAO(GuidelinesInterface guidelinesDAO) {
		this.guidelinesDAO = guidelinesDAO;
	}

	@Override
	public Guidelines addGuideline(Guidelines guideline) {
		return guidelinesDAO.addGuideline(guideline);
	}

	@Override
	public void deleteGuideline(Guidelines guideline) {
		guidelinesDAO.deleteGuideline(guideline);
	}

	@Override
	public Guidelines updateGuideline(Guidelines guideline) {
		return guidelinesDAO.updateGuideline(guideline);
	}

	@Override
	public Guidelines getGuideline(long id_guideline) {
		return guidelinesDAO.getGuideline(id_guideline);
	}

	@Override
	public List<Guidelines> getAllGuidelines() {
		return guidelinesDAO.getAllGuidelines();
	}

	@Override
	public List<Guidelines> getAllGuidelines(String categorie) {
		return guidelinesDAO.getAllGuidelines(categorie);
	}

	@Override
	public List<Guidelines> getAllGuidelines(String categorie, String type) {
		return guidelinesDAO.getAllGuidelines(categorie, type);
	}



}
