package medicalgap.metier.daoImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import medicalgap.dao.DaoInterface.CategoriesInterface;
import medicalgap.dao.DaoInterface.CongresseTypeInterface;
import medicalgap.dao.DaoInterface.GuidelinesTypeInterface;
import medicalgap.dao.DaoInterface.MedicalTypeInterface;
import medicalgap.dao.DaoInterface.PresseTypeInterface;
import medicalgap.dao.DaoInterface.RegistreTypeInterface;
import medicalgap.dao.DaoInterface.TaeTypeInterface;
import medicalgap.dao.entity.Categories;
import medicalgap.dao.entity.TypeGuideline;
import medicalgap.dao.entity.TypeMedicalactiv;
import medicalgap.dao.entity.TypePresse;
import medicalgap.dao.entity.TypeRegistre;
import medicalgap.dao.entity.TypeTae;
import medicalgap.dao.entity.Typecongresse;
import medicalgap.metier.daoInterface.AdministrationMetier;

@Component
public class AdminService implements AdministrationMetier {

	@Autowired
	private CategoriesInterface categorieDAO;
	@Autowired
	private CongresseTypeInterface congressestDAO;
	@Autowired
	private GuidelinesTypeInterface guidelinestDAO;
	@Autowired
	private MedicalTypeInterface medicaleActivitiestDAO;
	@Autowired
	private PresseTypeInterface presseSantetDAO;
	@Autowired
	private RegistreTypeInterface registresDesCancerstDAO;
	@Autowired
	private TaeTypeInterface taetDAO;

	public void setTaetDAO(TaeTypeInterface taetDAO) {
		this.taetDAO = taetDAO;
	}

	public void setRegistresDesCancerstDAO(
			RegistreTypeInterface registresDesCancerstDAO) {
		this.registresDesCancerstDAO = registresDesCancerstDAO;
	}

	public void setMedicaleActivitiestDAO(
			MedicalTypeInterface medicaleActivitiestDAO) {
		this.medicaleActivitiestDAO = medicaleActivitiestDAO;
	}

	public void setGuidelinestDAO(GuidelinesTypeInterface guidelinestDAO) {
		this.guidelinestDAO = guidelinestDAO;
	}

	public void setCongressestDAO(CongresseTypeInterface congressestDAO) {
		this.congressestDAO = congressestDAO;
	}

	public void setCategorieDAO(CategoriesInterface categorieDAO) {
		this.categorieDAO = categorieDAO;
	}

	public void setPresseSantetDAO(PresseTypeInterface presseSantetDAO) {
		this.presseSantetDAO = presseSantetDAO;
	}

	@Override
	public TypeTae addTypeTae(TypeTae tae) {
		return taetDAO.addTypeTae(tae);
	}

	@Override
	public void deleteTypeTae(TypeTae tae) {
		taetDAO.deleteTypeTae(tae);
	}

	@Override
	public TypeTae updateTypeTae(TypeTae tae) {
		return taetDAO.updateTypeTae(tae);
	}

	@Override
	public TypeTae getTypeTae(int id_tae) {
		return taetDAO.getTypeTae(id_tae);
	}

	@Override
	public List<TypeTae> getAllTaes() {
		return taetDAO.getAllTaes();
	}

	@Override
	public TypeRegistre addTypeRegistre(TypeRegistre rg) {
		return registresDesCancerstDAO.addTypeRegistre(rg);
	}

	@Override
	public void deleteTypeRegistre(TypeRegistre rg) {
		registresDesCancerstDAO.deleteTypeRegistre(rg);
	}

	@Override
	public TypeRegistre updateTypeRegistre(TypeRegistre rg) {
		return registresDesCancerstDAO.updateTypeRegistre(rg);
	}

	@Override
	public TypeRegistre getTypeRegistre(int id_rg) {
		return registresDesCancerstDAO.getTypeRegistre(id_rg);
	}

	@Override
	public List<TypeRegistre> getAllTypeRegistres() {
		return registresDesCancerstDAO.getAllTypeRegistres();
	}

	@Override
	public TypeMedicalactiv addTypeMedicalactiv(TypeMedicalactiv tm) {
		return medicaleActivitiestDAO.addTypeMedicalactiv(tm);
	}

	@Override
	public void deleteTypeMedicalactiv(TypeMedicalactiv tm) {
		medicaleActivitiestDAO.deleteTypeMedicalactiv(tm);
	}

	@Override
	public TypeMedicalactiv updateTypeMedicalactiv(TypeMedicalactiv tm) {
		return medicaleActivitiestDAO.updateTypeMedicalactiv(tm);
	}

	@Override
	public TypeMedicalactiv getTypeMedicalactiv(int id_tm) {
		return medicaleActivitiestDAO.getTypeMedicalactiv(id_tm);
	}

	@Override
	public List<TypeMedicalactiv> getAllTypeMedicalactiv() {
		return medicaleActivitiestDAO.getAllTypeMedicalactiv();
	}

	@Override
	public TypeGuideline addGuideline(TypeGuideline guideline) {
		return guidelinestDAO.addGuideline(guideline);
	}

	@Override
	public void deleteGuideline(TypeGuideline guideline) {
		guidelinestDAO.deleteGuideline(guideline);
	}

	@Override
	public TypeGuideline updateGuideline(TypeGuideline guideline) {
		return guidelinestDAO.updateGuideline(guideline);
	}

	@Override
	public TypeGuideline getGuideline(int id_guideline) {
		return guidelinestDAO.getGuideline(id_guideline);
	}

	@Override
	public List<TypeGuideline> getAllGuidelines() {
		return guidelinestDAO.getAllGuidelines();
	}

	@Override
	public Typecongresse addCongresse(Typecongresse congresse) {
		return congressestDAO.addCongresse(congresse);
	}

	@Override
	public void deleteCongresse(Typecongresse congresse) {
		congressestDAO.deleteCongresse(congresse);
	}

	@Override
	public Typecongresse updateCongresse(Typecongresse congresse) {
		return congressestDAO.updateCongresse(congresse);
	}

	@Override
	public Typecongresse getCongresse(int id_congresse) {
		return congressestDAO.getCongresse(id_congresse);
	}

	@Override
	public List<Typecongresse> getAllCongresses() {
		return congressestDAO.getAllCongresses();
	}

	@Override
	public TypePresse addPresseSante(TypePresse presseSante) {
		return presseSantetDAO.addPresseSante(presseSante);
	}

	@Override
	public void deletePresseSante(TypePresse presseSante) {
		presseSantetDAO.deletePresseSante(presseSante);
	}

	@Override
	public TypePresse updatePresseSante(TypePresse presseSante) {
		return presseSantetDAO.updatePresseSante(presseSante);
	}

	@Override
	public TypePresse getPresseSante(int id_presseSante) {
		return presseSantetDAO.getPresseSante(id_presseSante);
	}

	@Override
	public List<TypePresse> getAllPresseSantes() {
		return presseSantetDAO.getAllPresseSantes();
	}

	@Override
	public Categories addCategories(Categories categories) {
		return categorieDAO.addCategories(categories);
	}

	@Override
	public void deleteCategories(Categories categories) {
		categorieDAO.deleteCategories(categories);
	}

	@Override
	public Categories updateCategories(Categories categories) {
		return categorieDAO.updateCategories(categories);
	}

	@Override
	public Categories getCategories(int id_categories) {
		return categorieDAO.getCategories(id_categories);
	}

	@Override
	public List<Categories> getAllCCategories() {
		return categorieDAO.getAllCCategories();
	}

	@Override
	public List<TypeTae> getAllTaesC(String nameC) {
		return taetDAO.getAllTaesC(nameC);
	}

	@Override
	public List<TypeRegistre> getAllTypeRegistresC(String nameC) {
		return registresDesCancerstDAO.getAllTypeRegistresC(nameC);
	}

	@Override
	public List<TypePresse> getAllPresseSantesC(String nameC) {
		return presseSantetDAO.getAllPresseSantesC(nameC);
	}

	@Override
	public List<TypeMedicalactiv> getAllTypeMedicalactivC(String nameC) {
		return medicaleActivitiestDAO.getAllTypeMedicalactivC(nameC);
	}

	@Override
	public List<TypeGuideline> getAllGuidelinesC(String nameC) {
		return guidelinestDAO.getAllGuidelinesC(nameC);
	}

	@Override
	public List<Typecongresse> getAllCongressesC(String nameC) {
		return congressestDAO.getAllCongressesC(nameC);
	}

}
