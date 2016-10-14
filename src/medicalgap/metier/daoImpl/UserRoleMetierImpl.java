package medicalgap.metier.daoImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import medicalgap.dao.DaoInterface.UserRoleInterface;
import medicalgap.dao.entity.User;
import medicalgap.dao.entity.UserRole;
import medicalgap.metier.daoInterface.UserRolesInterfaceMetier;

@Component
public class UserRoleMetierImpl implements UserRolesInterfaceMetier {

	@Autowired
	private UserRoleInterface userRoleDAO;
	
	public void setUserRoleDAO(UserRoleInterface userRoleDAO) {
		this.userRoleDAO = userRoleDAO;
	}

	@Override
	public UserRole addUserRole(UserRole userRole) {
		return userRoleDAO.addUserRole(userRole);
	}

	@Override
	public void deleteUserRole(UserRole userRole) {
		userRoleDAO.deleteUserRole(userRole);
	}

	@Override
	public UserRole updateUserRole(UserRole userRole) {
		return userRoleDAO.updateUserRole(userRole);
	}

	@Override
	public UserRole getUserRole(long id_userRole) {
		return userRoleDAO.getUserRole(id_userRole);
	}

	@Override
	public List<UserRole> getAllUserRole() {
		return userRoleDAO.getAllUserRole();
	}

	@Override
	public List<String> getAllRoles() {
		return userRoleDAO.getAllRoles();
	}

	@Override
	public UserRole getUserRoled(User user) {
		return userRoleDAO.getUserRoled(user);
	}

}
