package medicalgap.dao.DaoImpl;

import java.util.List;



import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import medicalgap.dao.DaoInterface.CongressesInterface;
import medicalgap.dao.entity.Congresses;

@Repository("congressesDAO")
@Transactional
public class CongressesImpl implements CongressesInterface {

	@Autowired
    private SessionFactory sessionFactory;
 
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

	@Override
	public Congresses addCongresse(Congresses congresse) {
		sessionFactory.getCurrentSession().save(congresse);
		return congresse;
	}

	@Override
	public void deleteCongresse(Congresses congresse) {
		sessionFactory.getCurrentSession().delete(congresse);
	}

	@Override
	public Congresses updateCongresse(Congresses congresse) {
		sessionFactory.getCurrentSession().update(congresse);
		return congresse;
	}

	@Override
	public Congresses getCongresse(long id_congresse) {
		return (Congresses) sessionFactory.getCurrentSession().get(Congresses.class,id_congresse );

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Congresses> getAllCongresses() {
		List<Congresses> congresses = sessionFactory.getCurrentSession().createCriteria(Congresses.class).list();
		return congresses;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Congresses> getAllCongresses(String categorie) {
		List<Congresses> congresses = sessionFactory.getCurrentSession().createCriteria(Congresses.class).add(Restrictions.eq("categorie", categorie)).list();
		return congresses;

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Congresses> getAllCongresses(String type, String categorie) {
		Criterion categoriec = Restrictions.ilike("categorie", categorie);
		Criterion typec = Restrictions.ilike("type",type);
		LogicalExpression andExp = Restrictions.and(categoriec, typec);
		List<Congresses> Congresses = sessionFactory.getCurrentSession().createCriteria(Congresses.class).add(andExp).list();
		return Congresses;
	}



}
