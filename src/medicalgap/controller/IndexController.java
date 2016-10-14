package medicalgap.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import medicalgap.dao.entity.Categories;
import medicalgap.dao.entity.User;
import medicalgap.dao.entity.UserModel;
import medicalgap.dao.entity.UserRole;
import medicalgap.metier.daoImpl.AdminService;
import medicalgap.metier.daoInterface.CategorieInterfaceMetier;
import medicalgap.metier.daoInterface.RegistresDesCancersInterfaceMetier;
import medicalgap.metier.daoInterface.UserInterfaceMetier;
import medicalgap.metier.daoInterface.UserRolesInterfaceMetier;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;


@Controller
@SessionAttributes("categorieSession")
public class IndexController {

	Session session;
	
	@Autowired
	private RegistresDesCancersInterfaceMetier registresDesCancersMetier;
	@Autowired
	private CategorieInterfaceMetier categorieMetier;
	
	@Autowired
	private UserInterfaceMetier userMetier;

	@Autowired
	private UserRolesInterfaceMetier userRoleMetier;
	
	@Autowired
	private AdminService adminMetier;
	

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String listRegistres(Model model) {
		model.addAttribute("listCategories",
				this.categorieMetier.getAllCCategories());
		model.addAttribute("categorie",new Categories());
		return "categories";
	}
	
	@ResponseBody
	@RequestMapping(value = "/redirectCat" , method = RequestMethod.POST)
	public String redirectCat(
			@RequestParam String categorie, HttpServletResponse response
			, ModelMap model) throws IOException {		
		//System.out.println(categorie);
		model.put("categorieSession", categorie);
		return "200";
	}
	
	@RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
	public String defaultPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Login Form - Database Authentication");
		model.addObject("message", "This is default page!");
		model.setViewName("hello");
		
		return "redirect:/login";
	}

	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public ModelAndView adminPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Login Form - Database Authentication");
		model.addObject("message", "This page is for ROLE_ADMIN only!");
		model.setViewName("admin");

		return model;

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("login");

		return model;

	}
	
	
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied(@ModelAttribute("role") String categories) {

		ModelAndView model = new ModelAndView();
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);
		
			model.addObject("username", userDetail.getUsername());
			
		}
		
		model.setViewName("403");
		return model;

	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
	    return "redirect:/login?logout";
	}
	
	@RequestMapping(value="/passwordF", method = RequestMethod.GET)
	public String passwordForgot (HttpServletRequest request, HttpServletResponse response) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
	    return "redirect:/login?logout";
	}
	
	@RequestMapping(value = { "/test" }, method = RequestMethod.GET)
	public String defaulte() {

		return "Test";
	}


	@RequestMapping(value="/profil", method = RequestMethod.GET)
	public String profilPage (Model model) {
	    
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			User u = userMetier.getUser(userDetail.getUsername());
			UserRole ur = userRoleMetier.getUserRoled(u);
			String role="";
			if (ur.getRole().compareTo("ROLE_ADMIN") == 0) {
				role = "Administrateur";
			} else if (ur.getRole().compareTo("ROLE_USER") == 0) {
				role = "Utilisateur";
			}
				
			UserModel um = new UserModel(u.getFonction(), u.getUsername(), 
					u.getDateInsciption(), u.getEmail(), u.getEnabled(), u.getNom(), 
					"", u.getPrenom(), u.getTelephone(), role);
			um.setRole(role);
			model.addAttribute("userM",um);
			
		}
	    return "profil";
	}
	
	@ResponseBody
	@RequestMapping(value = "/profil/edit", method = RequestMethod.POST)
	public String editProfil(@RequestParam String usname,@RequestParam String telephonee,
			@RequestParam String emaile, @RequestParam String passworde,Model model) {
			
		
		if (telephonee.length() < 10) {
			model.addAttribute("elutelephone",
					"Le numero du téléphone est trop court.");
			return "Le numero du téléphone est trop court.";
		} else if (telephonee.length() >= 11) {
			model.addAttribute("elutelephone",
					"Le numero du téléphone est trop long.");
			return "Le numero du téléphone est trop long.";
		} else if (emaile.length() < 8) {
			model.addAttribute("elue", "Email incorrecte.");
			return "Email incorrecte.";
		} else if (emaile.length() > 200) {
			model.addAttribute("elue", "Email incorrecte.");
			return "Email incorrecte.";
		}else if (passworde.length() < 4) {
			model.addAttribute("eluppp","Le mot de passe saisie est trop court.");
			return "Le mot de passe saisie est trop court.";
		} else if (passworde.length() > 200) {
			model.addAttribute("eluppp","Le mot de passe saisie est trop long.");
			return "Le mot de passe saisie est trop long.";
		}
		
		else{
			User user = userMetier.getUser(usname);
			user.setEmail(emaile);
			user.setTelephone(telephonee);
			user.setPassword(passworde);
			userMetier.updateUser(user);
		
			return "success";}
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/passwordforget", method = RequestMethod.POST)
	public String forgetPassword(@RequestParam String usname,
			@RequestParam String emaile, Model model) {
			String data="success";
			try{
				User user = userMetier.getUser(usname);
				if(user.getUsername().isEmpty()){
					data="Nom d'utilisateur introuvable.";
				}else if(user.getUsername().compareTo(usname)!=0||user.getEmail().compareTo(emaile)!=0){
					data="Nom d'utilisateur ou email incorrecte.";
				}
			}catch(Exception e){
				data="error";
			}
			
			
			if(data.compareTo("success")==0){
				
			}
			
			return data;
		
	}
	
}
