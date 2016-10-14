package medicalgap.dao.DaoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import medicalgap.dao.DaoInterface.CategoriesInterface;
import medicalgap.dao.entity.Categories;

@Repository("categorieDAO")
@Transactional
public class CategoriesImpl implements CategoriesInterface {

	@Autowired
    private SessionFactory sessionFactory;
 
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

	@Override
	public Categories addCategories(Categories categories) {
		sessionFactory.getCurrentSession().save(categories);
		return categories;
	}

	@Override
	public void deleteCategories(Categories categories) {
		sessionFactory.getCurrentSession().delete(categories);
	}

	@Override
	public Categories updateCategories(Categories categories) {
		sessionFactory.getCurrentSession().update(categories);
		return categories;
	}

	@Override
	public Categories getCategories(int id_categories) {
		return (Categories) sessionFactory.getCurrentSession().get(Categories.class,id_categories );
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Categories> getAllCCategories() {
		List<Categories> categories = sessionFactory.getCurrentSession().createCriteria(Categories.class).list();
		return categories;
	}
	


}
