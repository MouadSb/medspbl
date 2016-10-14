package medicalgap.dao.DaoImpl;


import java.util.List;


import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import medicalgap.dao.DaoInterface.GuidelinesInterface;
import medicalgap.dao.entity.Guidelines;

@Repository("guidelinesDAO")
@Transactional
public class GuidelinesImpl implements GuidelinesInterface {

	@Autowired
    private SessionFactory sessionFactory;
 
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
	
	@Override
	public Guidelines addGuideline(Guidelines guideline) {
		sessionFactory.getCurrentSession().save(guideline);
		return guideline;
	}

	@Override
	public void deleteGuideline(Guidelines guideline) {
		sessionFactory.getCurrentSession().delete(guideline);
	}

	@Override
	public Guidelines updateGuideline(Guidelines guideline) {
		sessionFactory.getCurrentSession().update(guideline);
		return guideline;
	}

	@Override
	public Guidelines getGuideline(long id_guideline) {
		return (Guidelines) sessionFactory.getCurrentSession().get(Guidelines.class,id_guideline );
	}

	@Override
	public List<Guidelines> getAllGuidelines() {
		@SuppressWarnings("unchecked")
		List<Guidelines> guidelines = sessionFactory.getCurrentSession().createCriteria(Guidelines.class).list();
		return guidelines;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Guidelines> getAllGuidelines(String categorie) {
		List<Guidelines> Guidelines = sessionFactory.getCurrentSession().createCriteria(Guidelines.class)
				.add(Restrictions.eq("categorie", categorie)).list();
		return Guidelines;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Guidelines> getAllGuidelines(String categorie, String type) {
		Criterion categoriec = Restrictions.ilike("categorie", categorie);
		Criterion typec = Restrictions.ilike("type",type);
		LogicalExpression andExp = Restrictions.and(categoriec, typec);
		List<Guidelines> Guidelines = sessionFactory.getCurrentSession().createCriteria(Guidelines.class).add(andExp).list();

		return Guidelines;
	}
	

	
}
