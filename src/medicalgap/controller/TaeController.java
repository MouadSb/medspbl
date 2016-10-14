package medicalgap.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import medicalgap.dao.entity.Tae;
import medicalgap.metier.daoInterface.AdministrationMetier;
import medicalgap.metier.daoInterface.TaeInterfaceMetier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/tae")
public class TaeController {

	@Autowired
	private TaeInterfaceMetier taeMetier;
	
	@Autowired
	private AdministrationMetier adminMetier;


	@RequestMapping(value = "/tae", method = RequestMethod.GET)
	public String listTae(Model model, HttpSession session) {

		String categorie = (String) session.getAttribute("categorieSession");
		
		model.addAttribute("listtypetae", adminMetier.getAllTaesC(categorie));
		model.addAttribute("tae", new Tae());
		model.addAttribute("listTae", this.taeMetier.getAllTaes(categorie));
		return "tae";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addTae(@ModelAttribute("tae") Tae tae, HttpSession session, Model model) {

		Long x = null;
		String categorie = (String) session.getAttribute("categorieSession");
		tae.setCategorie(categorie);
		tae.setIdTae(x);
		this.taeMetier.addTae(tae);
		model.addAttribute("tae", new Tae());
		model.addAttribute("listTae", this.taeMetier.getAllTaes(categorie));
		return "redirect:/tae/tae";

	}

	@RequestMapping(value="/remove/{idTae}",method= RequestMethod.DELETE)
	public String removeTae(@PathVariable("idTae") int id,Model model, HttpSession session) {
		Tae tae = this.taeMetier.getTae(id);
		String categorie = (String) session.getAttribute("categorieSession");
		this.taeMetier.deleteTae(tae);
		model.addAttribute("tae", new Tae());
		model.addAttribute("listTae", this.taeMetier.getAllTaes(categorie));
		return "redirect:/tae/tae";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String editTae(@RequestParam String idTae,
			@RequestParam String titreHcp_m,
			@RequestParam String proprietaire, @RequestParam String conclusion_m,
			@RequestParam String essaiClinique_m, @RequestParam String nbrePubBc_m,
			@RequestParam String nbreTot_m, @RequestParam String date,
			@RequestParam String gapsInsightReco_m, @RequestParam String type,
			@RequestParam String responsable_m, HttpSession session, Model model) throws ParseException{
		
		String categorie = (String) session.getAttribute("categorieSession");

		Tae t = this.taeMetier.getTae(Long
				.parseLong(idTae));
		t.setTitreHcp(titreHcp_m);
		t.setProprietaire(proprietaire);
		t.setConclusion(conclusion_m);
		t.setEssaiClinique(essaiClinique_m);
		t.setNbrePubBc(Float.parseFloat(nbrePubBc_m));
		t.setNbreTot(Float.parseFloat(nbreTot_m));
		t.setDate(new SimpleDateFormat("yyyy-MM-dd").parse(date));
		t.setGapsInsightReco(gapsInsightReco_m);
		t.setResponsable(responsable_m);
		t.setType(type);
		this.taeMetier.updateTae(t);
		
		model.addAttribute("tae", new Tae());
		model.addAttribute("listTae", this.taeMetier.getAllTaes(categorie));
		return "Test";
	}

}
