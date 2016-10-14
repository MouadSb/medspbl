package medicalgap.metier.daoInterface;




import java.util.List;

import medicalgap.dao.entity.MedicaleActivities;

public interface MedicaleActivitiesInterfaceMetier {

	public MedicaleActivities addMedicaleActivitie( MedicaleActivities medicaleActivities);
	public void deleteMedicaleActivitie(MedicaleActivities medicaleActivities);
	public MedicaleActivities updateMedicaleActivitie(MedicaleActivities medicaleActivities);
	public MedicaleActivities getMedicaleActivitie(long id_medicaleActivities);
	public List<MedicaleActivities> getAllMedicaleActivities();
	public List<MedicaleActivities> getAllMedicaleActivities(String categorie);
	public List<MedicaleActivities> getAllMedicaleActivities(String categorie, String type);

}
