package medicalgap.dao.DaoImpl;

import java.util.List;


import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import medicalgap.dao.DaoInterface.RegistresDesCancersInterface;
import medicalgap.dao.entity.RegistresDesCancers;

@Repository("registresDesCancersDAO")
@Transactional
public class RegistresDesCancersImpl implements RegistresDesCancersInterface {

	@Autowired
    private SessionFactory sessionFactory;
 
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

	@Override
	public RegistresDesCancers addRegistre(
			RegistresDesCancers rg) {
		sessionFactory.getCurrentSession().save(rg);
		return rg;
	}

	@Override
	public void deleteRegistre(medicalgap.dao.entity.RegistresDesCancers rg) {
		sessionFactory.getCurrentSession().delete(rg);
	}

	@Override
	public medicalgap.dao.entity.RegistresDesCancers updateRegistre(
			medicalgap.dao.entity.RegistresDesCancers rg) {
		sessionFactory.getCurrentSession().update(rg);
		return rg;
	}

	@Override
	public medicalgap.dao.entity.RegistresDesCancers getRegistre(long id_rg) {
		return (medicalgap.dao.entity.RegistresDesCancers) sessionFactory.getCurrentSession().get(medicalgap.dao.entity.RegistresDesCancers.class,id_rg );
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<medicalgap.dao.entity.RegistresDesCancers> getAllRegistres(
			String categorie) {
		List<medicalgap.dao.entity.RegistresDesCancers> rg = sessionFactory.getCurrentSession().createCriteria(medicalgap.dao.entity.RegistresDesCancers.class)
				.add(Restrictions.eq("categorie", categorie)).list();
		return rg;

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RegistresDesCancers> getAllRegistres(
			String type, String categorie) {
		
		Criterion categoriec = Restrictions.ilike("categorie", categorie);
		Criterion typec = Restrictions.ilike("type",type);
		LogicalExpression andExp = Restrictions.and(categoriec, typec);
		List<RegistresDesCancers> rg = sessionFactory.getCurrentSession().createCriteria(RegistresDesCancers.class).add(andExp).list();


		return rg;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<medicalgap.dao.entity.RegistresDesCancers> getAllRegistres(
			String type, String categorie, String ville) {
		
		List<RegistresDesCancers> rg = sessionFactory.getCurrentSession().createCriteria(RegistresDesCancers.class)
				.add(Restrictions.ilike("categorie", categorie))
				.add(Restrictions.ilike("type",type))
				.add(Restrictions.ilike("ville",ville)).list();

		return rg;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllCategories() {
		Query query=sessionFactory.getCurrentSession().createQuery("SELECT DISTINCT rg.categorie FROM RegistresDesCancers rg");
		List<String> cat = query.list();
		return cat;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllTypes() {
		Query query=sessionFactory.getCurrentSession().createQuery("SELECT DISTINCT rg.type FROM RegistresDesCancers rg ");
		List<String> type = query.list();
		return type;

	}
	

}
