package medicalgap.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;


import javax.servlet.http.HttpSession;

import medicalgap.dao.entity.RegistresDesCancers;
import medicalgap.metier.daoInterface.AdministrationMetier;
import medicalgap.metier.daoInterface.RegistresDesCancersInterfaceMetier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("typeRegistre")
@RequestMapping("/registres")
public class RegistresDesCancersController {

	@Autowired
	private RegistresDesCancersInterfaceMetier registresDesCancersMetier;

	
	@Autowired
	private AdministrationMetier adminMetier;

	
	@RequestMapping(value = "/registre", method = RequestMethod.GET)
	public String rredirectRegistres(ModelMap model,HttpSession session) {

		String categorie = (String) session.getAttribute("categorieSession");
		model.addAttribute("typeregistre",adminMetier.getAllTypeRegistresC(categorie));
		model.addAttribute("registredescancers", new RegistresDesCancers());
		model.addAttribute("listRegistres",
				this.registresDesCancersMetier.getAllRegistres(categorie));
		return "registresdescancers";
	}
	
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addRegistresdescancers(
			@ModelAttribute("registredescancers") RegistresDesCancers rg,
			HttpSession session, Model model) {
		
		Long x = null;
		String categorie = (String) session.getAttribute("categorieSession");
		//String type = (String) session.getAttribute("typeRegistre");
		rg.setIdRegistre(x);
		rg.setCategorie(categorie);
		this.registresDesCancersMetier.addRegistre(rg);
		return "redirect:/registres/registre";
	}

	@RequestMapping(value="/remove/{idRegistre}",method= RequestMethod.DELETE)
	public String removeRegistresdescancers(@PathVariable("idRegistre") int id,Model model,HttpSession session) {
		String categorie = (String) session.getAttribute("categorieSession");

		RegistresDesCancers rg = this.registresDesCancersMetier.getRegistre(id);
		this.registresDesCancersMetier.deleteRegistre(rg);
		model.addAttribute("registredescancers",
				new RegistresDesCancers());
		model.addAttribute("listRegistres",
				this.registresDesCancersMetier.getAllRegistres(categorie));
		return "redirect:/registres/registre";
	}

	@RequestMapping(value= "/edit", method=RequestMethod.POST)
	public String editRegistresdescancers(@RequestParam String idRegistre, @RequestParam String date,
			@RequestParam String ageMedian_m, @RequestParam String nbrePopulation_m,
			@RequestParam String incidence_m, @RequestParam String stade_m,
			@RequestParam String typeHisto_m, @RequestParam String sourceLien_m,
			@RequestParam String conclusion_m, @RequestParam String ville_m, @RequestParam String type_m,
			@RequestParam String gapsInsightReco_m,
			@RequestParam String responsable_m, HttpSession session, Model model) throws ParseException {
		String categorie = (String) session.getAttribute("categorieSession");
		String type = (String) session.getAttribute("typeRegistre");
		RegistresDesCancers r = this.registresDesCancersMetier.getRegistre(Long.parseLong(idRegistre));		
		r.setDate(new SimpleDateFormat("yyyy-MM-dd").parse(date));
		r.setAgeMedian(Float.parseFloat(ageMedian_m));
		r.setNbrePopulation(Float.parseFloat(nbrePopulation_m));
		r.setIncidence(incidence_m);
		r.setStade(stade_m);
		r.setTypeHisto(typeHisto_m);
		r.setSourceLien(sourceLien_m);
		r.setConclusion(conclusion_m);
		r.setVille(ville_m);
		r.setGapsInsightReco(gapsInsightReco_m);
		r.setResponsable(responsable_m);
		r.setType(type_m);
		//typesregistres typesregistre = new typesregistres();
		
		//typesregistre.setId(9);
		//typesregistre.setName(type);
		this.registresDesCancersMetier.updateRegistre(r);
		model.addAttribute("registredescancers",
				new RegistresDesCancers());
		model.addAttribute("listRegistres",
				this.registresDesCancersMetier.getAllRegistres(type,categorie));
		//model.addAttribute("typesregistres", typesregistre);
		
		return "redirect:/registres/registre";
	}

}
