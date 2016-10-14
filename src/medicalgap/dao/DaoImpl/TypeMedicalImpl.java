package medicalgap.dao.DaoImpl;

import java.util.List;


import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import medicalgap.dao.DaoInterface.MedicalTypeInterface;
import medicalgap.dao.entity.TypeMedicalactiv;

@Repository("medicaleActivitiestDAO")
@Transactional
public class TypeMedicalImpl implements MedicalTypeInterface {

	@Autowired
    private SessionFactory sessionFactory;
 
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

	@Override
	public TypeMedicalactiv addTypeMedicalactiv(TypeMedicalactiv tm) {
		sessionFactory.getCurrentSession().save(tm);
		return tm;
	}

	@Override
	public void deleteTypeMedicalactiv(TypeMedicalactiv tm) {
		sessionFactory.getCurrentSession().delete(tm);
	}

	@Override
	public TypeMedicalactiv updateTypeMedicalactiv(TypeMedicalactiv tm) {
		sessionFactory.getCurrentSession().update(tm);
		return tm;
	}

	@Override
	public TypeMedicalactiv getTypeMedicalactiv(int id_tm) {
		return (TypeMedicalactiv) sessionFactory.getCurrentSession().get(TypeMedicalactiv.class,id_tm );
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TypeMedicalactiv> getAllTypeMedicalactiv() {
		List<TypeMedicalactiv> TypeTae = sessionFactory.getCurrentSession().createCriteria(TypeMedicalactiv.class).list();
		return TypeTae;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TypeMedicalactiv> getAllTypeMedicalactivC(String nameC) {
		List<TypeMedicalactiv> TypeTae = sessionFactory.getCurrentSession().createCriteria(TypeMedicalactiv.class).add(Restrictions.eq("nomCategorie", nameC)).list();
		return TypeTae;
	}
}
