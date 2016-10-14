package medicalgap.dao.DaoImpl;

import java.util.List;


import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import medicalgap.dao.DaoInterface.TaeInterface;
import medicalgap.dao.entity.Tae;

@Repository("taeDao")
@Transactional
public class TaeImpl implements TaeInterface {

	@Autowired
    private SessionFactory sessionFactory;
 
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

	@Override
	public Tae addTae(Tae tae) {
		sessionFactory.getCurrentSession().save(tae);
		return tae;
	}

	@Override
	public void deleteTae(Tae tae) {
		sessionFactory.getCurrentSession().delete(tae);
	}

	@Override
	public Tae updateTae(Tae tae) {
		sessionFactory.getCurrentSession().update(tae);
		return tae;
	}

	@Override
	public Tae getTae(long id_tae) {
		return (Tae) sessionFactory.getCurrentSession().get(Tae.class,id_tae );
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Tae> getAllTaes() {
		List<Tae> Tae = sessionFactory.getCurrentSession().createCriteria(Tae.class).list();
		return Tae;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Tae> getAllTaes(String categorie) {
		List<Tae> Tae = sessionFactory.getCurrentSession().createCriteria(Tae.class)
				.add(Restrictions.eq("categorie", categorie)).list();
		return Tae;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Tae> getAllTaes(String categorie, String type) {
		Criterion salary = Restrictions.ilike("categorie", categorie);
		Criterion name = Restrictions.ilike("type",type);
		LogicalExpression andExp = Restrictions.and(salary, name);
		
		List<Tae> Tae = sessionFactory.getCurrentSession().createCriteria(Tae.class).add(andExp).list();

		return Tae;
	}

	

}
