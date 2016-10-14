package medicalgap.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import medicalgap.dao.entity.Congresses;
import medicalgap.metier.daoInterface.AdministrationMetier;
import medicalgap.metier.daoInterface.CongressesInterfaceMetier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/congresses")
public class CongressesController {

	@Autowired
	private AdministrationMetier adminMetier;

	
	
	@Autowired
	private CongressesInterfaceMetier congressesMetier;

	

	@RequestMapping(value = "/congresses", method = RequestMethod.GET)
	public String listCongresses(Model model, HttpSession session) {

		String categorie = (String) session.getAttribute("categorieSession");

		model.addAttribute("typecongresses", adminMetier.getAllCongressesC(categorie));
		model.addAttribute("congresses", new Congresses());
		model.addAttribute("listcongresses",
				this.congressesMetier.getAllCongresses(categorie));
		return "congresses";
	}

	public List<Congresses> listCongresse() {

		return this.congressesMetier.getAllCongresses();

	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addCongresses(
			@ModelAttribute("congresses") Congresses congresse, Model model,
			HttpSession session) {

		Long x = null;
		String categorie = (String) session.getAttribute("categorieSession");
		congresse.setCategorie(categorie);
		congresse.setIdCongresses(x);
		this.congressesMetier.addCongresse(congresse);

		model.addAttribute("congresses", new Congresses());
		model.addAttribute("listcongresses",
				this.congressesMetier.getAllCongresses(categorie));

		return "redirect:/congresses/congresses";

	}

	@RequestMapping(value = "/remove/{idCongresses}", method = RequestMethod.DELETE)
	public String removeCongresses(@PathVariable("idCongresses") int id,
			Model model, HttpSession session) {
		String categorie = (String) session.getAttribute("categorieSession");

		Congresses congresses = this.congressesMetier.getCongresse(id);
		this.congressesMetier.deleteCongresse(congresses);
		model.addAttribute("congresses", new Congresses());
		model.addAttribute("listcongresses",
				this.congressesMetier.getAllCongresses(categorie));
		return "redirect:/congresses/congresses";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String editCongresses(@RequestParam String idCongresses,
			@RequestParam String auteur, @RequestParam String titre,
			@RequestParam String produit, @RequestParam String impact,
			@RequestParam String reference, @RequestParam String nbreTotalBc,
			@RequestParam String nbreTotal, @RequestParam String date,@RequestParam String type,
			@RequestParam String gapsInsightReco,
			@RequestParam String responsable, HttpSession session, Model model)
			throws ParseException {

		Congresses congresse = this.congressesMetier.getCongresse(Long
				.parseLong(idCongresses));
		String categorie = (String) session.getAttribute("categorieSession");
		congresse.setAuteur(auteur);
		congresse.setGapsInsightReco(gapsInsightReco);
		congresse.setImpact(impact);
		congresse.setNbreTotal(Long.parseLong(nbreTotal));
		congresse.setNbreTotalBc(Long.parseLong(nbreTotalBc));
		congresse.setProduit(produit);
		congresse.setReference(reference);
		congresse.setResponsable(responsable);
		congresse.setTitre(titre);
		congresse.setType(type);
		congresse.setDate(new SimpleDateFormat("yyyy-MM-dd").parse(date));
		this.congressesMetier.updateCongresse(congresse);
		model.addAttribute("congresses", new Congresses());
		model.addAttribute("listcongresses",
				this.congressesMetier.getAllCongresses(categorie));
		return "redirect:/congresses/congresses";
	}

}
