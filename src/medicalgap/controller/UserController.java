package medicalgap.controller;

import java.sql.Timestamp;

import java.util.ArrayList;
import java.util.List;


import medicalgap.dao.DaoInterface.TaeTypeInterface;
import medicalgap.dao.entity.Categories;
import medicalgap.dao.entity.TypeGuideline;
import medicalgap.dao.entity.TypeMedicalactiv;
import medicalgap.dao.entity.TypePresse;
import medicalgap.dao.entity.TypeRegistre;
import medicalgap.dao.entity.TypeTae;
import medicalgap.dao.entity.Typecongresse;
import medicalgap.dao.entity.User;
import medicalgap.dao.entity.UserModel;
import medicalgap.dao.entity.UserRole;
import medicalgap.metier.daoInterface.AdministrationMetier;
import medicalgap.metier.daoInterface.CongressesInterfaceMetier;
import medicalgap.metier.daoInterface.GuidelinesInterfaceMetier;
import medicalgap.metier.daoInterface.MedicaleActivitiesInterfaceMetier;
import medicalgap.metier.daoInterface.PresseSanteInterfaceMetier;
import medicalgap.metier.daoInterface.RegistresDesCancersInterfaceMetier;
import medicalgap.metier.daoInterface.TaeInterfaceMetier;
import medicalgap.metier.daoInterface.UserInterfaceMetier;
import medicalgap.metier.daoInterface.UserRolesInterfaceMetier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin")
public class UserController {

	@Autowired
	private TaeTypeInterface tl;

	@Autowired
	private UserInterfaceMetier userMetier;

	@Autowired
	private UserRolesInterfaceMetier userRoleDAO;

	@Autowired
	private CongressesInterfaceMetier congressesMetier;


	@Autowired
	private GuidelinesInterfaceMetier guidelinesMetier;


	@Autowired
	private MedicaleActivitiesInterfaceMetier medicalActivitiesMetier;


	@Autowired
	private PresseSanteInterfaceMetier presseSanteMetier;


	@Autowired
	private RegistresDesCancersInterfaceMetier registresDesCancersMetier;


	@Autowired
	private TaeInterfaceMetier taeMetier;


	@Autowired
	private AdministrationMetier adminMetier;


	@RequestMapping(value = "/admin")
	public String indexAdmin(Model model) {

		List<String> l = userRoleDAO.getAllRoles();

		for (int i = 0; i < l.size(); i++) {
			if (l.get(i).compareTo("ROLE_ADMIN") == 0) {
				l.set(i, "Administrateur");
			} else if (l.get(i).toString().compareTo("ROLE_USER") == 0) {
				l.set(i, "Utilisateur");
			}
		}
		model.addAttribute("congresse", new Typecongresse());
		model.addAttribute("listCongresses", adminMetier.getAllCongresses());
		model.addAttribute("registre", new TypeRegistre());
		model.addAttribute("registrex", new TypeRegistre());
		model.addAttribute("listRegistres", adminMetier.getAllTypeRegistres());
		model.addAttribute("Guideline", new TypeGuideline());
		model.addAttribute("listGuidline", adminMetier.getAllGuidelines());
		model.addAttribute("tae", new TypeTae());
		model.addAttribute("listTae", adminMetier.getAllTaes());
		model.addAttribute("ma", new TypeMedicalactiv());
		model.addAttribute("listMa", adminMetier.getAllTypeMedicalactiv());
		model.addAttribute("presse", new TypePresse());
		model.addAttribute("listPresse", adminMetier.getAllPresseSantes());
		model.addAttribute("categorie", new Categories());
		model.addAttribute("listCategorie", adminMetier.getAllCCategories());

		List<UserModel> usersM = new ArrayList<UserModel>();

		List<User> users = userMetier.getAllUser();
		List<UserRole> userR = userRoleDAO.getAllUserRole();

		for (User user : users) {
			UserModel usermodel = new UserModel();
			for (UserRole userRole : userR) {
				System.out.println(" ============= "+ userRole.getUser().getUsername());
				if (userRole.getUser().getUsername()
						.compareTo(user.getUsername()) == 0) {
					if (userRole.getRole().compareTo("ROLE_ADMIN") == 0) {
						usermodel.setRole("Administrateur");
					} else if (userRole.getRole().compareTo("ROLE_USER") == 0) {
						usermodel.setRole("Utilisateur");
					}
				}
			}

			usermodel.setUsername(user.getUsername());
			usermodel.setNom(user.getNom());
			usermodel.setPrenom(user.getPrenom());
			usermodel.setTelephone(user.getTelephone());
			usermodel.setEmail(user.getEmail());
			usermodel.setFonction(user.getFonction());
			usermodel.setEnabled(user.getEnabled());

			usersM.add(usermodel);
		}

		model.addAttribute("user", new User());
		model.addAttribute("usersM", usersM);
		model.addAttribute("roles", l);
		model.addAttribute("users", userMetier.getAllUser());
		model.addAttribute("userM", new UserModel());
		model.addAttribute("rolex", new UserRole());
		return "admin";
	}

	
	// **** Administration - Add **** //

	@RequestMapping(value = "/addCongresses", method = RequestMethod.POST)
	public String addCongresses(
			@ModelAttribute("congresse") Typecongresse congresse, Model model) {
		model.addAttribute("navchoix", "cg");
		if (congresse.getCongresseType().length() < 2) {
			model.addAttribute("errorAdd","btn_addco");
			model.addAttribute("eltnc", "Le nom de congresse est trop court.");
			return "redirect:/admin/admin";
		} else if (congresse.getCongresseType().length() > 200) {
			model.addAttribute("errorAdd","btn_addco");
			model.addAttribute("eltnc", "Le nom de congresse est trop long.");
			return "redirect:/admin/admin";
		} else {
			
			boolean exist = congresseExist(congresse.getCongresseType(), congresse.getNomCategorie());
			if(exist == true){
				model.addAttribute("errorAdd","btn_addco");
				model.addAttribute("eltnc", "Le nom de congresse choisie existe dans cette cat�gorie, veuillez choisir un autre nom.");
				return "redirect:/admin/admin";
			}else{
				Typecongresse c = new Typecongresse();
				c.setCongresseType(congresse.getCongresseType());
				c.setNomCategorie(congresse.getNomCategorie());
				adminMetier.addCongresse(c);
			}
			
			
		}

		return "redirect:/admin/admin";
	}

	@RequestMapping(value = "/addGuidelines", method = RequestMethod.POST)
	public String addGuidelines(
			@ModelAttribute("Guideline") TypeGuideline guidelines, Model model) {
		model.addAttribute("navchoix", "gu");
		if (guidelines.getGuidelinesType().length() < 2) {
			model.addAttribute("errorAdd","btn_addg");
			model.addAttribute("eltng", "Le nom de guideline est trop court.");
			return "redirect:/admin/admin";
		} else if (guidelines.getGuidelinesType().length() > 200) {
			model.addAttribute("errorAdd","btn_addg");
			model.addAttribute("eltng", "Le nom de guideline est trop long.");
			return "redirect:/admin/admin";
		} else {
			boolean exist = guidelineExist(guidelines.getGuidelinesType(), guidelines.getNomCategorie());
			if(exist == true){
				model.addAttribute("errorAdd","btn_addg");
				model.addAttribute("eltng", "Le nom de guideline choisie existe dans cette cat�gorie, veuillez choisir un autre nom.");
				return "redirect:/admin/admin";
			}else{
			TypeGuideline t = new TypeGuideline();
			t.setGuidelinesType(guidelines.getGuidelinesType());
			t.setNomCategorie(guidelines.getNomCategorie());
			adminMetier.addGuideline(t);}
		}
		return "redirect:/admin/admin";
	}

	@RequestMapping(value = "/addMedicale", method = RequestMethod.POST)
	public String addmedicales(@ModelAttribute("ma") TypeMedicalactiv ma,
			Model model) {
		model.addAttribute("navchoix", "ma");
		if (ma.getTypeMedical().length() < 2) {
			model.addAttribute("errorAdd","btn_addm");
			model.addAttribute("eltnm",
					"Le nom de medical activit� est trop court.");
			return "redirect:/admin/admin";
		} else if (ma.getTypeMedical().length() > 200) {
			model.addAttribute("errorAdd","btn_addm");
			model.addAttribute("eltnm",
					"Le nom de medical activit� est trop long.");
			return "redirect:/admin/admin";
		} else {
			boolean exist = medicalExist(ma.getTypeMedical(), ma.getNomCategorie());
			if(exist == true){
				model.addAttribute("errorAdd","btn_addm");
				model.addAttribute("eltnm", "Le nom de medicale activit�s choisie existe dans cette cat�gorie, veuillez choisir un autre nom.");
				return "redirect:/admin/admin";
			}else{
			TypeMedicalactiv m = new TypeMedicalactiv();
			m.setNomCategorie(ma.getNomCategorie());
			m.setTypeMedical(ma.getTypeMedical());
			adminMetier.addTypeMedicalactiv(m);}
		}
		return "redirect:/admin/admin";
	}

	@RequestMapping(value = "/addPresse", method = RequestMethod.POST)
	public String addPresse(@ModelAttribute("presse") TypePresse presseSante,
			Model model) {
		model.addAttribute("navchoix", "ps");
		if (presseSante.getTypePresse().length() < 2) {
			model.addAttribute("errorAdd","btn_addp");
			model.addAttribute("eltnp",
					"Le nom de medical activit� est trop court.");
			return "redirect:/admin/admin";
		} else if (presseSante.getTypePresse().length() > 200) {
			model.addAttribute("errorAdd","btn_addp");
			model.addAttribute("eltnp",
					"Le nom de medical activit� est trop long.");
			return "redirect:/admin/admin";
		} else {
			boolean exist = presseExist(presseSante.getTypePresse(), presseSante.getNomCategorie());
			if(exist == true){
				model.addAttribute("errorAdd","btn_addp");
				model.addAttribute("eltnp", "Le nom de presse de sant� choisie existe dans cette cat�gorie, veuillez choisir un autre nom.");
				return "redirect:/admin/admin";
			}else{
			TypePresse t = new TypePresse();
			t.setNomCategorie(presseSante.getNomCategorie());
			t.setTypePresse(presseSante.getTypePresse());
			adminMetier.addPresseSante(t);}
		}
		return "redirect:/admin/admin";
	}

	@RequestMapping(value = "/addRegistre", method = RequestMethod.POST)
	public String addRegistre(
			@ModelAttribute("registre") TypeRegistre TypeRegistre, Model model) {

		model.addAttribute("navchoix", "rg");
		if (TypeRegistre.getTypeRegistre().length() < 2) {
			model.addAttribute("errorAdd","btn_add");
			model.addAttribute("eltnr", "Le nom de registre est trop court.");
			return "redirect:/admin/admin";
		} else if (TypeRegistre.getTypeRegistre().length() > 200) {
			model.addAttribute("errorAdd","btn_add");
			model.addAttribute("eltnr", "Le nom de registre est trop long.");
			return "redirect:/admin/admin";
		} else {
			boolean exist = registreExist(TypeRegistre.getTypeRegistre(), TypeRegistre.getNomCategorie());
			if(exist == true){
				model.addAttribute("errorAdd","btn_add");
				model.addAttribute("eltnr", "Le nom de registre choisie existe dans cette cat�gorie, veuillez choisir un autre nom.");
				return "redirect:/admin/admin";
			}else{
			TypeRegistre tr = new TypeRegistre();
			tr.setNomCategorie(TypeRegistre.getNomCategorie());
			tr.setTypeRegistre(TypeRegistre.getTypeRegistre());
			adminMetier.addTypeRegistre(tr);}
		}
		return "redirect:/admin/admin";
	}

	@RequestMapping(value = "/addTae", method = RequestMethod.POST)
	public String addTTae(@ModelAttribute("tae") TypeTae tae, Model model) {
		model.addAttribute("navchoix", "tae");
		if (tae.getTypeTae().length() < 2) {
			model.addAttribute("errorAdd","btn_addt");
			model.addAttribute("eltntt", "Le nom de TAE est trop court.");
			
			return "redirect:/admin/admin";
		} else if (tae.getTypeTae().length() > 200) {
			model.addAttribute("errorAdd","btn_addt");
			model.addAttribute("eltntt", "Le nom de TAE est trop long.");

			return "redirect:/admin/admin";
		} else {
			boolean exist = taeExist(tae.getTypeTae(), tae.getNomCategorie());
			if(exist == true){
				model.addAttribute("errorAdd","btn_addt");
				model.addAttribute("eltntt", "Le nom de tae choisie existe dans cette cat�gorie, veuillez choisir un autre nom.");
				return "redirect:/admin/admin";
			}else{
			TypeTae c = new TypeTae();
			c.setTypeTae(tae.getTypeTae());
			c.setNomCategorie(tae.getNomCategorie());
			adminMetier.addTypeTae(c);}
		}
		return "redirect:/admin/admin";
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("user") UserModel userm, Model model) {
		model.addAttribute("navchoix", "user");
		if (userm.getUsername().length() < 2) {
			model.addAttribute("errorAdd","btn_addu");
			model.addAttribute("eltnuuu", "Le nom d'utilisateur est trop court.");
			return "redirect:/admin/admin";
		} else if (userm.getUsername().length() > 200) {
			model.addAttribute("errorAdd","btn_addu");
			model.addAttribute("eltnuuu", "Le nom d'utilisateur est trop long.");
			return "redirect:/admin/admin";
		} else if (userm.getNom().length() < 2) {
			model.addAttribute("errorAdd","btn_addu");
			model.addAttribute("eltnn", "Le nom est trop court.");
			return "redirect:/admin/admin";
		} else if (userm.getNom().length() > 200) {
			model.addAttribute("errorAdd","btn_addu");
			model.addAttribute("eltnn", "Le nom est trop long.");
			return "redirect:/admin/admin";
		} else if (userm.getPrenom().length() < 2) {
			model.addAttribute("errorAdd","btn_addu");
			model.addAttribute("eltnp", "Le prenom est trop court.");
			return "redirect:/admin/admin";
		} else if (userm.getPrenom().length() > 200) {
			model.addAttribute("errorAdd","btn_addu");
			model.addAttribute("eltnp", "Le prenom est trop long.");
			return "redirect:/admin/admin";
		} else if (userm.getFonction().length() < 2) {
			model.addAttribute("errorAdd","btn_addu");
			model.addAttribute("eltnf",
					"La longueur du champ fonction est trop courte.");
			return "redirect:/admin/admin";
		} else if (userm.getFonction().length() > 200) {
			model.addAttribute("errorAdd","btn_addu");
			model.addAttribute("eltnf",
					"La longueur du champ fonction est trop long.");
			return "redirect:/admin/admin";
		} else if (userm.getTelephone().length() < 2) {
			model.addAttribute("errorAdd","btn_addu");
			model.addAttribute("eltnt",
					"Le numero du t�l�phone est trop court.");
			return "redirect:/admin/admin";
		} else if (userm.getTelephone().length() > 200) {
			model.addAttribute("errorAdd","btn_addu");
			model.addAttribute("eltnt",
					"Le numero du t�l�phone est trop long.");
			return "redirect:/admin/admin";
		} else if (userm.getEmail().length() < 2) {
			model.addAttribute("errorAdd","btn_addu");
			model.addAttribute("eltne", "Email incorrecte.");
			return "redirect:/admin/admin";
		} else if (userm.getEmail().length() > 200) {
			model.addAttribute("errorAdd","btn_addu");
			model.addAttribute("eltne", "Email incorrecte.");
			return "redirect:/admin/admin";
		} else if (userm.getPassword().length() < 4) {
			model.addAttribute("errorAdd","btn_addu");
			model.addAttribute("eltnpa",
					"Le mot de passe saisie est trop court.");
			return "redirect:/admin/admin";
		} else if (userm.getPassword().length() > 200) {
			model.addAttribute("errorAdd","btn_addu");
			model.addAttribute("eltnpa",
					"Le mot de passe saisie est trop long.");
			return "redirect:/admin/admin";
		} else {
			boolean exist = userExist(userm.getUsername());
			if(exist == true){
				model.addAttribute("errorAdd","btn_addu");
				model.addAttribute("eltnuuu", "Le nom d'utilisateur choisie existe, veuillez choisir un autre nom.");
				return "redirect:/admin/admin";
			}else{
			String role = "";
			User user = new User();
			UserRole userR = new UserRole();
			java.util.Date date = new java.util.Date();
			user.setDateInsciption(new Timestamp(date.getTime()));
			user.setEnabled((byte) 1);
			user.setEmail(userm.getEmail());
			user.setFonction(userm.getFonction());
			user.setNom(userm.getNom());
			user.setPassword(userm.getPassword());
			user.setPrenom(userm.getPrenom());
			user.setTelephone(userm.getTelephone());
			user.setUsername(userm.getUsername());
			this.userMetier.addUser(user);

			if (userm.getRole().compareTo("Administrateur") == 0) {
				role = "ROLE_ADMIN";
			} else {
				role = "ROLE_USER";
			}

			userR.setRole(role);
			userR.setUser(user);
			this.userRoleDAO.addUserRole(userR);}

			return "redirect:/admin/admin";
		}
	}

	@RequestMapping(value = "/addCategorie", method = RequestMethod.POST)
	public String addCategorie(
			@ModelAttribute("categorie") Categories categories, Model model) {
		model.addAttribute("navchoix", "ca");
		if (categories.getName().length() < 2) {
			model.addAttribute("errorAdd","btn_addca");
			model.addAttribute("elnc", "Le nom de la cat�gorie est trop court.");
			return "redirect:/admin/admin";
		} else if (categories.getName().length() > 200) {
			model.addAttribute("errorAdd","btn_addca");
			model.addAttribute("elnc", "Le nom de la cat�gorie est trop long.");
			return "redirect:/admin/admin";
		} else {
			boolean isExist = categorieExist(categories.getName());
			if(isExist == true){
				model.addAttribute("errorAdd","btn_addca");
				model.addAttribute("elnc", "Le nom de cat�gorie choisie existe, veuillez choisir un autre nom.");
				return "redirect:/admin/admin";
			}else{
			Categories c = new Categories();
			c.setName(categories.getName());
			adminMetier.addCategories(c);
			return "redirect:/admin/admin";}
		}
		
	}

	// **** Administration - Remove **** //

	@RequestMapping(value = "/removeCongresse/{idCongresses}", method = RequestMethod.DELETE)
	public String removeCongresses(@PathVariable("idCongresses") int id,
			Model model) {
		Typecongresse c = adminMetier.getCongresse(id);
		adminMetier.deleteCongresse(c);
		return "redirect:/admin/admin";
	}

	@RequestMapping(value = "/removeTae/{idTae}", method = RequestMethod.DELETE)
	public String removeTae(@PathVariable("idTae") int id, Model model) {
		TypeTae c = adminMetier.getTypeTae(id);
		adminMetier.deleteTypeTae(c);
		return "redirect:/admin/admin";
	}

	@RequestMapping(value = "/removeRegistre/{idRegistre}", method = RequestMethod.DELETE)
	public String removeRegistre(@PathVariable("idRegistre") int id, Model model) {
		TypeRegistre c = adminMetier.getTypeRegistre(id);
		adminMetier.deleteTypeRegistre(c);
		return "redirect:/admin/admin";
	}

	@RequestMapping(value = "/removePresse/{idPresse}", method = RequestMethod.DELETE)
	public String removePresse(@PathVariable("idPresse") int id, Model model) {
		TypePresse c = adminMetier.getPresseSante(id);
		adminMetier.deletePresseSante(c);
		return "redirect:/admin/admin";
	}

	@RequestMapping(value = "/removeGuidlines/{idGuidlines}", method = RequestMethod.DELETE)
	public String removeGuidlines(@PathVariable("idGuidlines") int id,
			Model model) {
		TypeGuideline c = adminMetier.getGuideline(id);
		adminMetier.deleteGuideline(c);
		return "redirect:/admin/admin";
	}

	@RequestMapping(value = "/removeMedical/{idMa}", method = RequestMethod.DELETE)
	public String removeMedical(@PathVariable("idMa") int id, Model model) {
		TypeMedicalactiv c = adminMetier.getTypeMedicalactiv(id);
		adminMetier.deleteTypeMedicalactiv(c);
		return "redirect:/admin/admin";
	}

	@RequestMapping(value = "/removeCategorie/{idCa}", method = RequestMethod.DELETE)
	public String removeCategorie(@PathVariable("idCa") int id, Model model) {
		Categories c = adminMetier.getCategories(id);
		adminMetier.deleteCategories(c);
		return "redirect:/admin/admin";
	}

	@RequestMapping(value = "/removeUser/{idUser}", method = RequestMethod.DELETE)
	public String removeTUser(@PathVariable("idUser") String id) {
		User user = this.userMetier.getUser(id);
		UserRole userR = userRoleDAO.getUserRoled(user);

		userRoleDAO.deleteUserRole(userR);
		this.userMetier.deleteUser(user);

		return "redirect:/admin/admin";
	}

	// **** Administration - Read All **** //

	@RequestMapping(value = "/listcongresses", method = RequestMethod.GET)
	public String listcongresses(Model model) {

		model.addAttribute("congresse", new Typecongresse());
		model.addAttribute("listCongresses", adminMetier.getAllCongresses());
		return "redirect:/admin/admin";
	}

	@RequestMapping(value = "/listTae", method = RequestMethod.GET)
	public String listTae(Model model) {

		model.addAttribute("tae", new Typecongresse());
		model.addAttribute("listTae", adminMetier.getAllTaes());
		return "redirect:/admin/admin";
	}

	@RequestMapping(value = "/listRegistre", method = RequestMethod.GET)
	public String listRegistre(Model model) {

		model.addAttribute("registre", new TypeRegistre());
		model.addAttribute("listRegistre", adminMetier.getAllTypeRegistres());
		return "redirect:/admin/admin";
	}

	@RequestMapping(value = "/listPresse", method = RequestMethod.GET)
	public String listPresse(Model model) {

		model.addAttribute("presse", new TypePresse());
		model.addAttribute("listPresse", adminMetier.getAllPresseSantes());
		return "redirect:/admin/admin";
	}

	@RequestMapping(value = "/listGuide", method = RequestMethod.GET)
	public String listGuide(Model model) {

		model.addAttribute("guideline", new TypeGuideline());
		model.addAttribute("listGuidelines", adminMetier.getAllGuidelines());
		return "redirect:/admin/admin";
	}

	@RequestMapping(value = "/listMa", method = RequestMethod.GET)
	public String listMa(Model model) {

		model.addAttribute("medicalactivities", new TypeMedicalactiv());
		model.addAttribute("listMedicalactivities",
				adminMetier.getAllTypeMedicalactiv());
		return "redirect:/admin/admin";
	}

	@RequestMapping(value = "/listCategorie", method = RequestMethod.GET)
	public String listCategorie(Model model) {

		model.addAttribute("categorie", new Categories());
		model.addAttribute("listcategorie", adminMetier.getAllCCategories());
		return "redirect:/admin/admin";
	}

	@RequestMapping(value = "/listUser", method = RequestMethod.GET)
	public String listUser(Model model) {

		model.addAttribute("user", new User());
		model.addAttribute("listUser", userMetier.getAllUser());
		return "redirect:/admin/";
	}

	// **** Administration Edit **** /
	@ResponseBody
	@RequestMapping(value = "/editRegistre", method = RequestMethod.POST)
	public String editRegistre(@RequestParam String id,
			@RequestParam String typeRegistre,
			@RequestParam String nomCategorie, Model model) {
		if (typeRegistre.length() < 2) {
			return "Le nom de registre est trop court.";
		} else if (typeRegistre.length() > 200) {
			return "Le nom de registre est trop long.";
		} else {
			boolean exist = registreExist(typeRegistre, nomCategorie);
			if(exist == true){
				return "Le nom de registre choisie existe dans cette cat�gorie, veuillez choisir un autre nom.";
				}else{
			TypeRegistre t = adminMetier.getTypeRegistre(Integer.parseInt(id));
			t.setNomCategorie(nomCategorie);
			t.setTypeRegistre(typeRegistre);
			adminMetier.updateTypeRegistre(t);}
			return "success";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/editCongresse", method = RequestMethod.POST)
	public String editCongresse(@RequestParam String id,
			@RequestParam String congresseType,
			@RequestParam String nomCategorie, Model model) {
		if (congresseType.length() < 2) {
			return "Le nom de congresse est trop court.";
		} else if (congresseType.length() > 200) {
			return "Le nom de congresse est trop long.";
		} else {boolean exist = congresseExist(congresseType, nomCategorie);
		if(exist == true){
			return "Le nom de congresse choisie existe dans cette cat�gorie, veuillez choisir un autre nom.";
		}else{
			Typecongresse c = adminMetier.getCongresse(Integer.parseInt(id));
			c.setNomCategorie(nomCategorie);
			c.setCongresseType(congresseType);
			adminMetier.updateCongresse(c);
			return "success";}
		}

	}

	@ResponseBody
	@RequestMapping(value = "/editTae", method = RequestMethod.POST)
	public String editTae(@RequestParam String id,
			@RequestParam String taeType, @RequestParam String nomCategorie,
			Model model) {

		if (taeType.length() < 2) {
			return "Le nom de TAE est trop court.";
		} else if (taeType.length() > 200) {
			return "Le nom de TAE est trop long.";
		} else {
			boolean exist = taeExist(taeType, nomCategorie);
			if(exist == true){
				return "Le nom de tae choisie existe dans cette cat�gorie, veuillez choisir un autre nom.";
				
			}else{
			TypeTae tt = adminMetier.getTypeTae(Integer.parseInt(id));
			tt.setNomCategorie(nomCategorie);
			tt.setTypeTae(taeType);
			adminMetier.updateTypeTae(tt);}
			return "success";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/editGuidline", method = RequestMethod.POST)
	public String editGuidline(@RequestParam String id,
			@RequestParam String guidlineType,
			@RequestParam String nomCategorie, Model model) {

		if (guidlineType.length() < 2) {
			return "Le nom de guidline est trop court.";
		} else if (guidlineType.length() > 200) {
			return "Le nom de guidline est trop long.";
		} else {
			boolean exist = guidelineExist(guidlineType, nomCategorie);
			if(exist == true){
				return "Le nom de guideline choisie existe dans cette cat�gorie, veuillez choisir un autre nom.";
			}else{
			TypeGuideline g = adminMetier.getGuideline(Integer.parseInt(id));
			g.setNomCategorie(nomCategorie);
			g.setGuidelinesType(guidlineType);
			adminMetier.updateGuideline(g);
			}
			return "success";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/editMedical", method = RequestMethod.POST)
	public String editMedical(@RequestParam String id,
			@RequestParam String medicalType,
			@RequestParam String nomCategorie, Model model) {
		if (medicalType.length() < 2) {
			return "Le nom de medicale activit� est trop court.";
		} else if (medicalType.length() > 200) {
			return "Le nom de medicale activit� est trop long.";
		} else {
			boolean exist = medicalExist(medicalType , nomCategorie);
			if(exist == true){
				return "Le nom de medicale activit�s choisie existe dans cette cat�gorie, veuillez choisir un autre nom.";

			}else{
			TypeMedicalactiv m = adminMetier.getTypeMedicalactiv(Integer
					.parseInt(id));

			m.setNomCategorie(nomCategorie);
			m.setTypeMedical(medicalType);
			adminMetier.updateTypeMedicalactiv(m);}

			return "success";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/editPresse", method = RequestMethod.POST)
	public String editPresse(@RequestParam String id,
			@RequestParam String presseType, @RequestParam String nomCategorie,
			Model model) {
		if (presseType.length() < 2) {
			return "Le nom de presse est trop court.";
		} else if (presseType.length() > 200) {
			return "Le nom de presse est trop long.";
		} else {
			boolean exist = presseExist(presseType, nomCategorie);
			if(exist == true){
				return "Le nom de presse de sant� choisie existe dans cette cat�gorie, veuillez choisir un autre nom.";
				}
			TypePresse p = adminMetier.getPresseSante(Integer.parseInt(id));
			p.setNomCategorie(nomCategorie);
			p.setTypePresse(presseType);
			adminMetier.updatePresseSante(p);
			return "success";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/editCategorie", method = RequestMethod.POST)
	public String editCategorie(@RequestParam String id,
			@RequestParam String namee, Model model) {
		if (namee.length() < 2) {
			return "Le nom de cat�gorie est trop court.";
		} else if (namee.length() > 200) {
			return "Le nom de cat�gorie est trop long.";
		} else {
			boolean isExist = categorieExist(namee);
			if(isExist == true){
				return "Le nom de cat�gorie choisie existe, veuillez choisir un autre nom.";
			}else{
			Categories c = adminMetier.getCategories(Integer.parseInt(id));
			c.setName(namee);

			adminMetier.updateCategories(c);
			return "success";}
		}
	}

	@ResponseBody
	@RequestMapping(value = "/editUser", method = RequestMethod.POST)
	public String editUser(@RequestParam String id, @RequestParam String role,
			@RequestParam String nom, @RequestParam String prenom,
			@RequestParam String telephone, @RequestParam String email,
			@RequestParam String fonction, @RequestParam String password,@RequestParam String enabled,
			Model model) {
		
		if (nom.length() < 2) {
			model.addAttribute("eltnun", "Le nom est trop court.");
			return "Le nom est trop court.";
		} else if (nom.length() > 200) {
			model.addAttribute("eltnun", "Le nom est trop long.");
			return "Le nom est trop long.";
		} else if (prenom.length() < 2) {
			model.addAttribute("eltnup", "Le prenom est trop court.");
			return "Le prenom est trop court.";
		} else if (prenom.length() > 200) {
			model.addAttribute("eltnup", "Le prenom est trop long.");
			return "Le prenom est trop long.";
		} else if (fonction.length() < 2) {
			model.addAttribute("eltnuf",
					"La longueur du champ fonction est trop courte.");
			return "La longueur du champ fonction est trop courte.";
		} else if (fonction.length() > 200) {
			model.addAttribute("eltnuf",
					"La longueur du champ fonction est trop long.");
			return "La longueur du champ fonction est trop long.";
		} else if (telephone.length() <= 9) {
			model.addAttribute("eltnut",
					"Le numero du t�l�phone est trop court.");
			return "Le numero du t�l�phone est trop court.";
		} else if (telephone.length() >= 11) {
			model.addAttribute("eltnut",
					"Le numero du t�l�phone est trop long.");
			return "Le numero du t�l�phone est trop long.";
		} else if (email.length() < 2) {
			model.addAttribute("eltnue", "Email incorrecte.");
			return "Email incorrecte.";
		} else if (email.length() > 200) {
			model.addAttribute("eltnue", "Email incorrecte.");
			return "Email incorrecte.";
		} else if (password.length() < 4) {
			model.addAttribute("eltnupa","Le mot de passe saisie est trop court.");
			return "Le mot de passe saisie est trop court.";
		} else if (password.length() > 200) {
			model.addAttribute("eltnupa","Le mot de passe saisie est trop long.");
			return "Le mot de passe saisie est trop long.";
		} else {
			User u = userMetier.getUser(id);
			List<UserRole> r = userRoleDAO.getAllUserRole();
			for (UserRole userRole : r) {
				if (userRole.getUser().getUsername().compareTo(u.getUsername()) == 0) {
					if (role.compareTo("Administrateur") == 0) {
						userRole.setRole("ROLE_ADMIN");
					} else if (role.compareTo("Utilisateur") == 0) {
						userRole.setRole("ROLE_USER");
					}
					userRoleDAO.updateUserRole(userRole);
				}
			}

			u.setNom(nom);
			u.setPrenom(prenom);
			u.setTelephone(telephone);
			u.setEmail(email);
			u.setFonction(fonction);
			
			u.setEnabled(Byte.valueOf(enabled));
			this.userMetier.updateUser(u);
			return "success";
		}
	}
	
	private boolean categorieExist(String categorie){
		boolean exist = false;
		List<Categories> listCategories = adminMetier.getAllCCategories();
		
		for (Categories categories : listCategories) {
			if(categories.getName().compareTo(categorie)==0){
				exist=true;
				break;}
		}
		return exist;
	}
	
	private boolean registreExist(String registre,String c){
		boolean exist = false;
		List<TypeRegistre> listCategories = adminMetier.getAllTypeRegistresC(c);
		
		for (TypeRegistre typeRegistre : listCategories) {
			if(typeRegistre.getTypeRegistre().compareTo(registre)==0){
				exist=true;
				break;}
			}
		

		return exist;
	}
	
	private boolean congresseExist(String congresse, String c){
		boolean exist = false;
		List<Typecongresse> listCategories = adminMetier.getAllCongressesC(c);
		
		for (Typecongresse typecongresse : listCategories) {
			if(typecongresse.getCongresseType().compareTo(congresse)==0){
				exist=true;
				break;}
			}
		
		
		return exist;
	}
	
	private boolean taeExist(String tae, String c){
		boolean exist = false;
		List<TypeTae> listCategories = adminMetier.getAllTaesC(c);
		
		for (TypeTae typeTae : listCategories) {
			if(typeTae.getTypeTae().compareTo(tae)==0){
				exist=true;
				break;
			}
		}
		return exist;
	}
	
	private boolean presseExist(String presse,String c){
		boolean exist = false;
		List<TypePresse> listCategories = adminMetier.getAllPresseSantesC(c);
		for (TypePresse typePresse : listCategories) {
			if(typePresse.getTypePresse().compareTo(presse)==0){
				exist=true;
				break;
			}
		}
		return exist;
	}
	
	private boolean guidelineExist(String guidline, String c){
		boolean exist = false;
		List<TypeGuideline> listCategories = adminMetier.getAllGuidelinesC(c);
		
		for (TypeGuideline typeGuideline : listCategories) {
			if(typeGuideline.getGuidelinesType().compareTo(guidline)==0){
				exist=true;
				break;
			}
		}
		
		return exist;
	}
	
	private boolean medicalExist(String medical, String c){
		boolean exist = false;
		List<TypeMedicalactiv> listCategories = adminMetier.getAllTypeMedicalactivC(c);
		
		for (TypeMedicalactiv typeMedicalactiv : listCategories) {
			if(typeMedicalactiv.getTypeMedical().compareTo(medical)==0){
				exist=true;
				break;
			}
		}
		
		return exist;
	}
	
	private boolean userExist(String username){
		boolean exist = false;
		List<User> listUser = userMetier.getAllUser();
		
		for (User user : listUser) {
			if(user.getUsername().compareTo(username)==0){
				exist=true;
				break;
			}
		}


		return exist;
	}
	
	
}
