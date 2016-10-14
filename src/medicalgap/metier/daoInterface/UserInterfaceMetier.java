package medicalgap.metier.daoInterface;

import java.util.List;

import medicalgap.dao.entity.User;

public interface UserInterfaceMetier {

	public User addUser(User user);

	public void deleteUser(User user);

	public User updateUser(User user);

	public User getUser(String id);

	public List<User> getAllUser();
}
