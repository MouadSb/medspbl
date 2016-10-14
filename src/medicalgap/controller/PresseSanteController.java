package medicalgap.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import medicalgap.dao.entity.PresseSante;
import medicalgap.metier.daoInterface.AdministrationMetier;
import medicalgap.metier.daoInterface.PresseSanteInterfaceMetier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
@RequestMapping("/pressesantes")
public class PresseSanteController {
	
	@Autowired
	private PresseSanteInterfaceMetier presseSanteMetier;

	
	@Autowired
	private AdministrationMetier adminMetier;

	@RequestMapping(value = "/pressesantes", method = RequestMethod.GET)
	public String listPressesantes(Model model,HttpSession session) {
		
		String categorie = (String) session.getAttribute("categorieSession");

		model.addAttribute("listtypeps", adminMetier.getAllPresseSantesC(categorie));
		model.addAttribute("pressesantes", new PresseSante());
		model.addAttribute("listpresseSantes",
				this.presseSanteMetier.getAllPresseSantes(categorie));
		return "pressesantes";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addPressesantes(
			@ModelAttribute("pressesantes") PresseSante presseSante, HttpSession session, Model model) {
		Long x = null;
		String categorie = (String) session.getAttribute("categorieSession");
		presseSante.setCategorie(categorie);
		presseSante.setIdPresse(x);
		this.presseSanteMetier.addPresseSante(presseSante);
		model.addAttribute("pressesantes", new PresseSante());
		model.addAttribute("listpresseSantes",
				this.presseSanteMetier.getAllPresseSantes(categorie));
		return "redirect:/pressesantes/pressesantes";
	}

	@RequestMapping(value="/remove/{idPresse}",method= RequestMethod.DELETE)
	public String removePressesantes(@PathVariable("idPresse") int id, Model model, HttpSession session) {
		String categorie = (String) session.getAttribute("categorieSession");

		PresseSante presseSante = this.presseSanteMetier.getPresseSante(id);
		this.presseSanteMetier.deletePresseSante(presseSante);
		model.addAttribute("pressesantes", new PresseSante());
		model.addAttribute("listpresseSantes",
				this.presseSanteMetier.getAllPresseSantes(categorie));
		return "redirect:/pressesantes/pressesantes";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String editPressesantes(@RequestParam String idPresse,
			@RequestParam String auteur, @RequestParam String titre,
			@RequestParam String produit, @RequestParam String impact,
			@RequestParam String reference,@RequestParam String date,@RequestParam String type,
			@RequestParam String gapsInsightReco, @RequestParam String conclusion, @RequestParam String compagny,
			@RequestParam String responsable, HttpSession session, Model model
			) throws ParseException {
		String categorie = (String) session.getAttribute("categorieSession");
		PresseSante p = this.presseSanteMetier.getPresseSante(Long.parseLong(idPresse));
		p.setAuteur(auteur);
		p.setTitre(titre);
		p.setProduit(produit);
		p.setImpact(impact);
		p.setReference(reference);
		p.setDate(new SimpleDateFormat("yyyy-MM-dd").parse(date));
		p.setGapsInsightReco(gapsInsightReco);
		p.setConclusion(conclusion);
		p.setResponsable(responsable);
		p.setCompagny(compagny);
		p.setType(type);
		presseSanteMetier.updatePresseSante(p);
		model.addAttribute("pressesantes",
				new PresseSante());
		model.addAttribute("listPressesantes",
				this.presseSanteMetier.getAllPresseSantes(categorie));
		return "redirect:/pressesantes/pressesantes";
	}
	
	

}
