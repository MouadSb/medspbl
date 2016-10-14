package medicalgap.metier.daoImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import medicalgap.dao.DaoInterface.MedicaleActivitiesInterface;
import medicalgap.dao.entity.MedicaleActivities;
import medicalgap.metier.daoInterface.MedicaleActivitiesInterfaceMetier;

@Component
public class MedicalActivitiesMetierImpl implements
		MedicaleActivitiesInterfaceMetier {
	
	@Autowired
	private MedicaleActivitiesInterface medicaleActivitiesDAO;

	public void setMedicaleActivitiesDAO(
			MedicaleActivitiesInterface medicaleActivitiesDAO) {
		this.medicaleActivitiesDAO = medicaleActivitiesDAO;
	}

	@Override
	public MedicaleActivities addMedicaleActivitie(
			MedicaleActivities medicaleActivities) {
		return medicaleActivitiesDAO.addMedicaleActivitie(medicaleActivities);
	}

	@Override
	public void deleteMedicaleActivitie(MedicaleActivities medicaleActivities) {
		medicaleActivitiesDAO.deleteMedicaleActivitie(medicaleActivities);
	}

	@Override
	public MedicaleActivities updateMedicaleActivitie(
			MedicaleActivities medicaleActivities) {
		return medicaleActivitiesDAO
				.updateMedicaleActivitie(medicaleActivities);
	}

	@Override
	public MedicaleActivities getMedicaleActivitie(long id_medicaleActivities) {
		return medicaleActivitiesDAO
				.getMedicaleActivitie(id_medicaleActivities);
	}

	@Override
	public List<MedicaleActivities> getAllMedicaleActivities() {
		return medicaleActivitiesDAO.getAllMedicaleActivities();
	}

	@Override
	public List<MedicaleActivities> getAllMedicaleActivities(String categorie) {
		return medicaleActivitiesDAO.getAllMedicaleActivities(categorie);
	}

	@Override
	public List<MedicaleActivities> getAllMedicaleActivities(String categorie,
			String type) {
		return medicaleActivitiesDAO.getAllMedicaleActivities(categorie, type);
	}



}
