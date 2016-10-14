package medicalgap.metier.daoImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import medicalgap.dao.DaoInterface.CategoriesInterface;
import medicalgap.dao.entity.Categories;
import medicalgap.metier.daoInterface.CategorieInterfaceMetier;

@Component
public class CategoriesMetierImpl implements CategorieInterfaceMetier{
	
	@Autowired
	private CategoriesInterface categorieDAO;

	public void setCategorieDAO(CategoriesInterface categorieDAO) {
		this.categorieDAO = categorieDAO;
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

}
