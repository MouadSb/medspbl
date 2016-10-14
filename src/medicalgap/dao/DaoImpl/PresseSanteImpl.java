package medicalgap.dao.DaoImpl;


import java.util.List;



import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import medicalgap.dao.DaoInterface.PresseSanteInterface;
import medicalgap.dao.entity.PresseSante;

@Repository("presseSanteDAO")
@Transactional
public class PresseSanteImpl implements PresseSanteInterface {

	
	@Autowired
    private SessionFactory sessionFactory;
 
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
	
	@Override
	public PresseSante addPresseSante(PresseSante presseSante) {
		sessionFactory.getCurrentSession().save(presseSante);
		return presseSante;
	}

	@Override
	public void deletePresseSante(PresseSante presseSante) {
		sessionFactory.getCurrentSession().delete(presseSante);
	}

	@Override
	public PresseSante updatePresseSante(PresseSante presseSante) {
		sessionFactory.getCurrentSession().update(presseSante);
		return presseSante;
	}

	@Override
	public PresseSante getPresseSante(long id_presseSante) {
		return (PresseSante) sessionFactory.getCurrentSession().get(PresseSante.class,id_presseSante );
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PresseSante> getAllPresseSantes() {
		List<PresseSante> presseSante = sessionFactory.getCurrentSession().createCriteria(PresseSante.class).list();
		return presseSante;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PresseSante> getAllPresseSantes(String categorie) {

		List<PresseSante> PresseSante = sessionFactory.getCurrentSession().createCriteria(PresseSante.class)
				.add(Restrictions.eq("categorie", categorie)).list();
		return PresseSante;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PresseSante> getAllPresseSantes(String categorie, String type) {
		Criterion categoriec = Restrictions.ilike("categorie", categorie);
		Criterion typec = Restrictions.ilike("type",type);
		LogicalExpression andExp = Restrictions.and(categoriec, typec);
		List<PresseSante> PresseSante = sessionFactory.getCurrentSession().createCriteria(PresseSante.class).add(andExp).list();
		return PresseSante;
	}

}
