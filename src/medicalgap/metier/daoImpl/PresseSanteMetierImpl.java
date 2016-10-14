package medicalgap.metier.daoImpl;

import java.util.List;

import medicalgap.dao.DaoInterface.PresseSanteInterface;
import medicalgap.dao.entity.PresseSante;
import medicalgap.metier.daoInterface.PresseSanteInterfaceMetier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class PresseSanteMetierImpl implements PresseSanteInterfaceMetier {

	@Autowired
	private PresseSanteInterface presseSanteDAO;

	public void setPresseSanteDAO(PresseSanteInterface presseSanteDAO) {
		this.presseSanteDAO = presseSanteDAO;
	}

	@Override
	public PresseSante addPresseSante(PresseSante presseSante) {
		return presseSanteDAO.addPresseSante(presseSante);
	}

	@Override
	public void deletePresseSante(PresseSante presseSante) {
		presseSanteDAO.deletePresseSante(presseSante);
	}

	@Override
	public PresseSante updatePresseSante(PresseSante presseSante) {
		return presseSanteDAO.updatePresseSante(presseSante);
	}

	@Override
	public PresseSante getPresseSante(long id_presseSante) {
		return presseSanteDAO.getPresseSante(id_presseSante);
	}

	@Override
	public List<PresseSante> getAllPresseSantes() {
		return presseSanteDAO.getAllPresseSantes();
	}

	@Override
	public List<PresseSante> getAllPresseSantes(String categorie) {
		return presseSanteDAO.getAllPresseSantes(categorie);
	}

	@Override
	public List<PresseSante> getAllPresseSantes(String categorie, String type) {
		return presseSanteDAO.getAllPresseSantes(categorie, type);
	}


}
