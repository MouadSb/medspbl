package medicalgap.dao.DaoImpl;

import java.util.List;


import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import medicalgap.dao.DaoInterface.CongresseTypeInterface;
import medicalgap.dao.entity.Typecongresse;

@Repository("congressestDAO")
@Transactional
public class TypeCongressesImpl implements CongresseTypeInterface {

	@Autowired
    private SessionFactory sessionFactory;
 
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
	
	@Override
	public Typecongresse addCongresse(Typecongresse congresse) {
		sessionFactory.getCurrentSession().save(congresse);
		return congresse;
	}

	@Override
	public void deleteCongresse(Typecongresse congresse) {
		sessionFactory.getCurrentSession().delete(congresse);
	}

	@Override
	public Typecongresse updateCongresse(Typecongresse congresse) {
		sessionFactory.getCurrentSession().update(congresse);
		return congresse;
	}

	@Override
	public Typecongresse getCongresse(int id_congresse) {
		return (Typecongresse) sessionFactory.getCurrentSession().get(Typecongresse.class,id_congresse );
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Typecongresse> getAllCongresses() {
		List<Typecongresse> Typecongresse = sessionFactory.getCurrentSession().createCriteria(Typecongresse.class).list();
		return Typecongresse;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Typecongresse> getAllCongressesC(String nameC) {

		List<Typecongresse> Typecongresse = sessionFactory.getCurrentSession().createCriteria(Typecongresse.class)
				.add(Restrictions.eq("nomCategorie", nameC)).list();
		return Typecongresse;
	}

}
