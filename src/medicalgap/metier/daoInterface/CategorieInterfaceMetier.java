package medicalgap.metier.daoInterface;

import java.util.List;

import medicalgap.dao.entity.Categories;

public interface CategorieInterfaceMetier {
	
	public Categories addCategories(Categories categories);
	public void deleteCategories(Categories categories);
	public Categories updateCategories(Categories categories);
	public Categories getCategories(int id_categories);
	public List<Categories> getAllCCategories();
}
