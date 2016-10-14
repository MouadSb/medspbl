package medicalgap.controller;

import javax.servlet.http.HttpServletRequest;
import medicalgap.dao.entity.Categories;
import medicalgap.metier.daoInterface.CategorieInterfaceMetier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/categorie")
public class CategoriesController {

	@Autowired
	private CategorieInterfaceMetier categorieMetier;

	@RequestMapping(value = "/Categorie", method = RequestMethod.POST)
	public String redirectCat(Model model, HttpServletRequest request) {

		String cat = request.getParameter("cat");
		model.addAttribute("cat", cat);
		return "index";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addCongresses(
			@ModelAttribute("categorie") Categories categories
			) {

		Integer x = null;
		categories.setId_categorie(x);
		this.categorieMetier.addCategories(categories);

		return "Test";

	}

}
