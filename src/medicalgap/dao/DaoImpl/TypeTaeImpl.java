package medicalgap.dao.DaoImpl;

import java.util.List;


import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import medicalgap.dao.DaoInterface.TaeTypeInterface;
import medicalgap.dao.entity.TypeTae;

@Repository("taetDAO")
@Transactional
public class TypeTaeImpl implements TaeTypeInterface {

	@Autowired
    private SessionFactory sessionFactory;
 
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
	
	
	@Override
	public TypeTae addTypeTae(TypeTae tae) {
		sessionFactory.getCurrentSession().save(tae);
		return tae;
	}

	@Override
	public void deleteTypeTae(TypeTae tae) {
		sessionFactory.getCurrentSession().delete(tae);
	}

	@Override
	public TypeTae updateTypeTae(TypeTae tae) {
		sessionFactory.getCurrentSession().update(tae);
		return tae;
	}

	@Override
	public TypeTae getTypeTae(int id_tae) {
		return (TypeTae) sessionFactory.getCurrentSession().get(TypeTae.class,id_tae );
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TypeTae> getAllTaes() {
		List<TypeTae> TypeTae = sessionFactory.getCurrentSession().createCriteria(TypeTae.class).list();
		return TypeTae;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<TypeTae> getAllTaesC(String nameC) {

		List<TypeTae> TypeTae = sessionFactory.getCurrentSession().createCriteria(TypeTae.class)
				.add(Restrictions.eq("nomCategorie", nameC)).list();
		return TypeTae;
	}

}
