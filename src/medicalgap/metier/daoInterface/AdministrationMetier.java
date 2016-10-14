package medicalgap.metier.daoInterface;

import java.util.List;

import medicalgap.dao.entity.Categories;
import medicalgap.dao.entity.TypeGuideline;
import medicalgap.dao.entity.TypeMedicalactiv;
import medicalgap.dao.entity.TypePresse;
import medicalgap.dao.entity.TypeRegistre;
import medicalgap.dao.entity.TypeTae;
import medicalgap.dao.entity.Typecongresse;

public interface AdministrationMetier {

	public TypeTae addTypeTae(TypeTae tae);

	public void deleteTypeTae(TypeTae tae);

	public TypeTae updateTypeTae(TypeTae tae);

	public TypeTae getTypeTae(int id_tae);

	public List<TypeTae> getAllTaes();

	public TypeRegistre addTypeRegistre(TypeRegistre rg);

	public void deleteTypeRegistre(TypeRegistre rg);

	public TypeRegistre updateTypeRegistre(TypeRegistre rg);

	public TypeRegistre getTypeRegistre(int id_rg);

	public List<TypeRegistre> getAllTypeRegistres();

	public TypeMedicalactiv addTypeMedicalactiv(TypeMedicalactiv tm);

	public void deleteTypeMedicalactiv(TypeMedicalactiv tm);

	public TypeMedicalactiv updateTypeMedicalactiv(TypeMedicalactiv tm);

	public TypeMedicalactiv getTypeMedicalactiv(int id_tm);

	public List<TypeMedicalactiv> getAllTypeMedicalactiv();

	public TypeGuideline addGuideline(TypeGuideline guideline);

	public void deleteGuideline(TypeGuideline guideline);

	public TypeGuideline updateGuideline(TypeGuideline guideline);

	public TypeGuideline getGuideline(int id_guideline);

	public List<TypeGuideline> getAllGuidelines();

	public Typecongresse addCongresse(Typecongresse congresse);

	public void deleteCongresse(Typecongresse congresse);

	public Typecongresse updateCongresse(Typecongresse congresse);

	public Typecongresse getCongresse(int id_congresse);

	public List<Typecongresse> getAllCongresses();

	public TypePresse addPresseSante(TypePresse presseSante);

	public void deletePresseSante(TypePresse presseSante);

	public TypePresse updatePresseSante(TypePresse presseSante);

	public TypePresse getPresseSante(int id_presseSante);

	public List<TypePresse> getAllPresseSantes();

	public Categories addCategories(Categories categories);

	public void deleteCategories(Categories categories);

	public Categories updateCategories(Categories categories);

	public Categories getCategories(int id_categories);

	public List<Categories> getAllCCategories();
	
	public List<TypeTae> getAllTaesC(String nameC);

	public List<TypeRegistre> getAllTypeRegistresC(String nameC);

	public List<TypePresse> getAllPresseSantesC(String nameC);

	public List<TypeMedicalactiv> getAllTypeMedicalactivC(String nameC);

	public List<TypeGuideline> getAllGuidelinesC(String nameC);

	public List<Typecongresse> getAllCongressesC(String nameC);

	

}
