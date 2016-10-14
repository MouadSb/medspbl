package medicalgap.metier.daoImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import medicalgap.dao.DaoInterface.UserInterface;
import medicalgap.dao.entity.User;
import medicalgap.metier.daoInterface.UserInterfaceMetier;

@Component
public class UserMetierImpl implements UserInterfaceMetier {

	@Autowired
	private UserInterface userDAO;
	
	public void setUserDAO(UserInterface userDAO) {
		this.userDAO = userDAO;
	}

	@Override
	public User addUser(User user) {
		return userDAO.addUser(user);
	}

	@Override
	public void deleteUser(User user) {
		userDAO.deleteUser(user);
	}

	@Override
	public User updateUser(User user) {
		return userDAO.updateUser(user);
	}

	@Override
	public User getUser(String id_user) {
		return userDAO.getUser(id_user);
	}

	@Override
	public List<User> getAllUser() {
		return userDAO.getAllUser();
	}

}
