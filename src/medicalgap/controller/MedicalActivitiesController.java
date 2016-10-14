package medicalgap.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import medicalgap.dao.entity.MedicaleActivities;
import medicalgap.metier.daoInterface.AdministrationMetier;
import medicalgap.metier.daoInterface.MedicaleActivitiesInterfaceMetier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/medicaleactivities")
public class MedicalActivitiesController {

	@Autowired
	private AdministrationMetier adminMetier;

	
	@Autowired
	private MedicaleActivitiesInterfaceMetier medicalActivitiesMetier;

	public List<MedicaleActivities> listMedicaleactivities() {

		return this.medicalActivitiesMetier.getAllMedicaleActivities();
	}

	@RequestMapping(value = "/medicaleactivities", method = RequestMethod.GET)
	public String listMedicaleactivities(Model model, HttpSession session) {
		
		String categorie = (String) session.getAttribute("categorieSession");
		model.addAttribute("listtypema", adminMetier.getAllTypeMedicalactivC(categorie));
		model.addAttribute("medicaleactivities", new MedicaleActivities());
		model.addAttribute("listmas",
				this.medicalActivitiesMetier.getAllMedicaleActivities(categorie));
		return "medicaleactivities";
	}
	
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addMedicaleactivities(
			@ModelAttribute("medicaleactivities") MedicaleActivities ma,Model model,HttpSession session) {

		Long x = null;
		String categorie = (String) session.getAttribute("categorieSession");
		ma.setCategorie(categorie);
		ma.setIdMa(x);
		this.medicalActivitiesMetier.addMedicaleActivitie(ma);
		
		model.addAttribute("medicaleactivities", new MedicaleActivities());
		model.addAttribute("listmas",
				this.medicalActivitiesMetier.getAllMedicaleActivities(categorie));
		return "redirect:/medicaleactivities/medicaleactivities";
	}

	@RequestMapping(value="/remove/{idMa}",method= RequestMethod.DELETE)
	public String removeMedicaleactivities(@PathVariable("idMa") int id,Model model, HttpSession session) {
		String categorie = (String) session.getAttribute("categorieSession");
		MedicaleActivities ma = this.medicalActivitiesMetier.getMedicaleActivitie(id);
		this.medicalActivitiesMetier.deleteMedicaleActivitie(ma);
		
		model.addAttribute("medicaleactivities", new MedicaleActivities());
		model.addAttribute("listmas",
				this.medicalActivitiesMetier.getAllMedicaleActivities(categorie));
		return "redirect:/medicaleactivities/medicaleactivities";
	}

	@RequestMapping(value= "/edit", method=RequestMethod.POST)
	public String editMedicaleactivities(@RequestParam String idMa_m,
			@RequestParam String date, @RequestParam String auteur_m,
			@RequestParam String titre_m, @RequestParam String hcp_m,@RequestParam String type,
			@RequestParam String produit_m, @RequestParam String impact_m,
			@RequestParam String reference_m, @RequestParam String conclusion_m,
			@RequestParam String gapsInsightReco_m,
			@RequestParam String responsable_m, HttpSession session, Model model) throws ParseException {
		String categorie = (String) session.getAttribute("categorieSession");

		MedicaleActivities m = this.medicalActivitiesMetier.getMedicaleActivitie(Long.parseLong(idMa_m));
		
		m.setDate(new SimpleDateFormat("yyyy-MM-dd").parse(date));
		m.setAuteur(auteur_m);
		m.setTitre(titre_m);
		m.setHcp(hcp_m);
		m.setProduits(produit_m);
		m.setImpact(impact_m);
		m.setReference(reference_m);
		m.setConclusion(conclusion_m);
		m.setGapsInsightReco(gapsInsightReco_m);
		m.setResponsable(responsable_m);
		m.setType(type);
		
		this.medicalActivitiesMetier.updateMedicaleActivitie(m);
		
		model.addAttribute("medicaleactivities",
				new MedicaleActivities());
		model.addAttribute("listmas",
				this.medicalActivitiesMetier.getAllMedicaleActivities(categorie));
		return "medicalactivities";
	}

}
