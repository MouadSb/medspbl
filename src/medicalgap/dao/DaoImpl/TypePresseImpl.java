package medicalgap.dao.DaoImpl;

import java.util.List;



import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import medicalgap.dao.DaoInterface.PresseTypeInterface;
import medicalgap.dao.entity.TypePresse;

@Repository("presseSantetDAO")
@Transactional
public class TypePresseImpl implements PresseTypeInterface {

	@Autowired
    private SessionFactory sessionFactory;
 
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

	@Override
	public TypePresse addPresseSante(TypePresse presseSante) {
		sessionFactory.getCurrentSession().save(presseSante);
		return presseSante;
	}

	@Override
	public void deletePresseSante(TypePresse presseSante) {
		sessionFactory.getCurrentSession().delete(presseSante);
	}

	@Override
	public TypePresse updatePresseSante(TypePresse presseSante) {
		sessionFactory.getCurrentSession().update(presseSante);
		return presseSante;
	}

	@Override
	public TypePresse getPresseSante(int id_presseSante) {
		return (TypePresse) sessionFactory.getCurrentSession().get(TypePresse.class,id_presseSante );
	}

	@Override
	public List<TypePresse> getAllPresseSantes() {
		@SuppressWarnings("unchecked")
		List<TypePresse> presseSante = sessionFactory.getCurrentSession().createCriteria(TypePresse.class).list();
		return presseSante;
	}
	
	@Override
	public List<TypePresse> getAllPresseSantesC(String nameC) {
		@SuppressWarnings("unchecked")
		List<TypePresse> presseSante = sessionFactory.getCurrentSession().createCriteria(TypePresse.class).add(Restrictions.eq("nomCategorie", nameC)).list();
		return presseSante;
	}

}
