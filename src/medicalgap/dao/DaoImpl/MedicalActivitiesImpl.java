package medicalgap.dao.DaoImpl;


import java.util.List;



import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import medicalgap.dao.DaoInterface.MedicaleActivitiesInterface;
import medicalgap.dao.entity.MedicaleActivities;

@Repository("medicaleActivitiesDAO")
@Transactional
public class MedicalActivitiesImpl implements MedicaleActivitiesInterface {

	@Autowired
    private SessionFactory sessionFactory;
 
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
	
	@Override
	public MedicaleActivities addMedicaleActivitie(
			MedicaleActivities medicaleActivities) {
		sessionFactory.getCurrentSession().save(medicaleActivities);
		return medicaleActivities;
	}

	@Override
	public void deleteMedicaleActivitie(MedicaleActivities medicaleActivities) {
		sessionFactory.getCurrentSession().delete(medicaleActivities);
	}

	@Override
	public MedicaleActivities updateMedicaleActivitie(
			MedicaleActivities medicaleActivities) {
		sessionFactory.getCurrentSession().update(medicaleActivities);
		return medicaleActivities;
	}

	@Override
	public MedicaleActivities getMedicaleActivitie(long id_medicaleActivities) {
		return (MedicaleActivities) sessionFactory.getCurrentSession().get(MedicaleActivities.class,id_medicaleActivities );
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MedicaleActivities> getAllMedicaleActivities() {
		List<MedicaleActivities> medicaleActivities = sessionFactory.getCurrentSession().createCriteria(MedicaleActivities.class).list();
		return medicaleActivities;

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MedicaleActivities> getAllMedicaleActivities(String categorie) {
		List<MedicaleActivities> MedicaleActivities = sessionFactory.getCurrentSession().createCriteria(MedicaleActivities.class)
				.add(Restrictions.eq("categorie", categorie)).list();
		return MedicaleActivities;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MedicaleActivities> getAllMedicaleActivities(String categorie,
			String type) {
		Criterion categoriec = Restrictions.ilike("categorie", categorie);
		Criterion typec = Restrictions.ilike("type",type);
		LogicalExpression andExp = Restrictions.and(categoriec, typec);
		List<MedicaleActivities> MedicaleActivities = sessionFactory.getCurrentSession().createCriteria(MedicaleActivities.class).add(andExp).list();

		return MedicaleActivities;
	}

	
}
