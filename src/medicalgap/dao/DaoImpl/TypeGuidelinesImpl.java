package medicalgap.dao.DaoImpl;

import java.util.List;


import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import medicalgap.dao.DaoInterface.GuidelinesTypeInterface;
import medicalgap.dao.entity.TypeGuideline;


@Repository("guidelinestDAO")
@Transactional
public class TypeGuidelinesImpl implements GuidelinesTypeInterface{

	@Autowired
    private SessionFactory sessionFactory;
 
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
	
	@Override
	public TypeGuideline addGuideline(TypeGuideline guideline) {
		sessionFactory.getCurrentSession().save(guideline);
		return guideline;
	}

	@Override
	public void deleteGuideline(TypeGuideline guideline) {
		sessionFactory.getCurrentSession().delete(guideline);
	}

	@Override
	public TypeGuideline updateGuideline(TypeGuideline guideline) {
		sessionFactory.getCurrentSession().update(guideline);
		return guideline;
	}

	@Override
	public TypeGuideline getGuideline(int id_guideline) {
		return (TypeGuideline) sessionFactory.getCurrentSession().get(TypeGuideline.class,id_guideline );
	}

	@Override
	public List<TypeGuideline> getAllGuidelines() {
		@SuppressWarnings("unchecked")
		List<TypeGuideline> congresses = sessionFactory.getCurrentSession().createCriteria(TypeGuideline.class).list();
		return congresses;
	}

	@Override
	public List<TypeGuideline> getAllGuidelinesC(String nameC) {
		@SuppressWarnings("unchecked")

		List<TypeGuideline> congresses = sessionFactory.getCurrentSession().createCriteria(TypeGuideline.class).add(Restrictions.eq("nomCategorie", nameC)).list();
		return congresses;
	}
	
}
