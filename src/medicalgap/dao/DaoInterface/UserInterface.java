package medicalgap.dao.DaoInterface;

import java.util.List;

import medicalgap.dao.entity.User;

public interface UserInterface {

	public User addUser(User user);

	public void deleteUser(User user);

	public User updateUser(User user);

	public User getUser(String id_user);

	public List<User> getAllUser();
}
