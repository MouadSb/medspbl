package medicalgap.metier.daoInterface;

import java.util.List;

import medicalgap.dao.entity.User;
import medicalgap.dao.entity.UserRole;

public interface UserRolesInterfaceMetier {

	public UserRole addUserRole(UserRole userRole);

	public void deleteUserRole(UserRole userRole);

	public UserRole updateUserRole(UserRole userRole);

	public UserRole getUserRole(long id_userRole);

	public List<UserRole> getAllUserRole();
	
	public List<String> getAllRoles();
	
	public UserRole getUserRoled(User user);

}
