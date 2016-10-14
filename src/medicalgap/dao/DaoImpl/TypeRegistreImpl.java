package medicalgap.dao.DaoImpl;

import java.util.List;


import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import medicalgap.dao.DaoInterface.RegistreTypeInterface;
import medicalgap.dao.entity.TypeRegistre;

@Repository("registresDesCancerstDAO")
@Transactional
public class TypeRegistreImpl implements RegistreTypeInterface {

	@Autowired
    private SessionFactory sessionFactory;
 
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
	
	
	@Override
	public TypeRegistre addTypeRegistre(TypeRegistre rg) {
		sessionFactory.getCurrentSession().save(rg);
		return rg;
	}

	@Override
	public void deleteTypeRegistre(TypeRegistre rg) {
		sessionFactory.getCurrentSession().delete(rg);
	}

	@Override
	public TypeRegistre updateTypeRegistre(TypeRegistre rg) {
		sessionFactory.getCurrentSession().update(rg);
		return rg;
	}

	@Override
	public TypeRegistre getTypeRegistre(int id_rg) {
		return (TypeRegistre) sessionFactory.getCurrentSession().get(TypeRegistre.class,id_rg );
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TypeRegistre> getAllTypeRegistres() {
		List<TypeRegistre> TypeRegistre = sessionFactory.getCurrentSession().createCriteria(TypeRegistre.class).list();
		return TypeRegistre;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<TypeRegistre> getAllTypeRegistresC(String nameC) {

		List<TypeRegistre> TypeRegistre = sessionFactory.getCurrentSession().createCriteria(TypeRegistre.class).add(Restrictions.ilike("nomCategorie", nameC)).list();

		return TypeRegistre;
	}

}
