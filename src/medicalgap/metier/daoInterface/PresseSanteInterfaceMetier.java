package medicalgap.metier.daoInterface;


import java.util.List;



import medicalgap.dao.entity.PresseSante;

public interface PresseSanteInterfaceMetier {

	public PresseSante addPresseSante( PresseSante presseSante);
	public void deletePresseSante(PresseSante presseSante);
	public PresseSante updatePresseSante(PresseSante presseSante);
	public PresseSante getPresseSante(long id_presseSante);
	public List<PresseSante> getAllPresseSantes();
	public List<PresseSante> getAllPresseSantes(String categorie);
	public List<PresseSante> getAllPresseSantes(String categorie,String type);

	
}
