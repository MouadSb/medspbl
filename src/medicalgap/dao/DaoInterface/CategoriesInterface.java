package medicalgap.dao.DaoInterface;

import java.util.List;

import medicalgap.dao.entity.Categories;

public interface CategoriesInterface {

	public Categories addCategories(Categories categories);
	public void deleteCategories(Categories categories);
	public Categories updateCategories(Categories categories);
	public Categories getCategories(int id_categories);
	public List<Categories> getAllCCategories();
}
