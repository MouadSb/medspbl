package medicalgap.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import medicalgap.dao.entity.Guidelines;
import medicalgap.metier.daoInterface.AdministrationMetier;
import medicalgap.metier.daoInterface.GuidelinesInterfaceMetier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/guidelines")
public class GuidelinesController {

	@Autowired
	private GuidelinesInterfaceMetier guidelinesMetier;
	
	@Autowired
	private AdministrationMetier adminMetier;


	@RequestMapping(value = "/guidelines", method = RequestMethod.GET)
	public String listGuidelines(Model model, HttpSession session) {
		String categorie = (String) session.getAttribute("categorieSession");

		model.addAttribute("listtypeguidlines", adminMetier.getAllGuidelinesC(categorie));
		model.addAttribute("guidelines", new Guidelines());
		model.addAttribute("listguidelines",
				this.guidelinesMetier.getAllGuidelines(categorie));
		return "guidelines";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addGuidelines(
			@ModelAttribute("guidelines") Guidelines guidelines,
			HttpSession session, Model model) {

		Long x = null;
		String categorie = (String) session.getAttribute("categorieSession");
		guidelines.setCategorie(categorie);
		guidelines.setIdGuideline(x);
		this.guidelinesMetier.addGuideline(guidelines);
		model.addAttribute("guidelines", new Guidelines());
		model.addAttribute("listguidelines",
				this.guidelinesMetier.getAllGuidelines(categorie));
		return "redirect:/guidelines/guidelines";

	}

	@RequestMapping(value = "/remove/{idGuideline}", method = RequestMethod.DELETE)
	public String removeGuidelines(@PathVariable("idGuideline") int id,
			Model model, HttpSession session) {
		Guidelines guidelines = this.guidelinesMetier.getGuideline(id);
		String categorie = (String) session.getAttribute("categorieSession");

		this.guidelinesMetier.deleteGuideline(guidelines);
		model.addAttribute("guidelines", new Guidelines());
		model.addAttribute("listguidelines",
				this.guidelinesMetier.getAllGuidelines(categorie));
		return "redirect:/guidelines/guidelines";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String editGuidelines(@RequestParam String idGuidelines,
			@RequestParam String auteur, @RequestParam String produit,
			@RequestParam String impact, @RequestParam String reference,@RequestParam String type,
			@RequestParam String date, @RequestParam String gapsInsightReco,
			@RequestParam String conclusion, @RequestParam String responsable,
			HttpSession session, Model model) throws ParseException {
		Guidelines guidlines = this.guidelinesMetier.getGuideline(Long
				.parseLong(idGuidelines));
		guidlines.setAuteur(auteur);
		guidlines.setProduit(produit);
		guidlines.setImpact(impact);
		guidlines.setReference(reference);
		guidlines.setConclusion(conclusion);
		guidlines.setDate(new SimpleDateFormat("yyyy-MM-dd").parse(date));
		guidlines.setGapsInsightReco(gapsInsightReco);
		guidlines.setResponsable(responsable);
		guidlines.setType(type);
		this.guidelinesMetier.updateGuideline(guidlines);
		model.addAttribute("guidelines", new Guidelines());
		model.addAttribute("listguidelines",
				this.guidelinesMetier.getAllGuidelines());
		return "redirect:/guidelines/guidelines";
	}

}
