package medicalgap.dao.DaoImpl;

import java.util.List;



import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import medicalgap.dao.DaoInterface.UserInterface;
import medicalgap.dao.entity.User;

@Repository("userDAO")
@Transactional
public class UserImpl implements UserInterface {

	@Autowired
    private SessionFactory sessionFactory;
 
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
	
	@Override
	public User addUser(User user) {
		sessionFactory.getCurrentSession().save(user);
		return user;
	}

	@Override
	public void deleteUser(User user) {
		sessionFactory.getCurrentSession().delete(user);
	}

	@Override
	public User updateUser(User user) {
		sessionFactory.getCurrentSession().update(user);
		return user;
	}

	@Override
	public User getUser(String id_user) {
		return (User) sessionFactory.getCurrentSession().get(User.class,id_user );
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAllUser() {
		List<User> user = sessionFactory.getCurrentSession().createCriteria(User.class).list();
		return user;
	}

}
