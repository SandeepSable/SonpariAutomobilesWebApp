package com.ibm.app.controller;

import java.sql.Timestamp;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.h2.tools.Backup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.WebRequest;

import com.ibm.app.model.User;
import com.ibm.app.model.UserProfile;
import com.ibm.app.service.UserProfileService;
import com.ibm.app.service.UserService;

@Controller
@SessionAttributes("roles")
public class AppController {

	@Autowired
	UserService userService;
	@Autowired
	UserProfileService userProfileService;
	@Autowired
	MessageSource messageSource;
	@Autowired
	PersistentTokenBasedRememberMeServices persistentTokenBasedRememberMeServices;
	@Autowired
	AuthenticationTrustResolver authenticationTrustResolver;

	@RequestMapping(value = "/getUserName", method = RequestMethod.GET)
	public static String getLoggedInUserName()
	{
		return getPrincipal();
	}
	
	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model) {
		model.addAttribute("loggedinuser", getPrincipal());
		return "accessDenied";
	}


	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String visitHomePageNow(WebRequest req) {
	  return "/home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(WebRequest req) {
		System.out.println("AppController.loginPage()........");
		if (isCurrentAuthenticationAnonymous()) {
			return "login";
		} else {
			return "redirect:/home";
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("AppController.logoutPage().........");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
			persistentTokenBasedRememberMeServices.logout(request, response, auth);
			SecurityContextHolder.getContext().setAuthentication(null);
		}
		return "redirect:/login?logout";
	}

	@RequestMapping(value = { "/", "/welcome", "/index", "register_success" }, method = RequestMethod.GET)
	public String welcomeRequestHandle(ModelMap model) {
		System.out.println("AppController.welcome().......");
		String userName = getPrincipal();
		System.out.println("username::" + userName);
		if (userName == null || userName.equalsIgnoreCase("anonymousUser")) {
			return "/voltage";
		} else {
			Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
			Timestamp expiryTimestamp = new Timestamp(1514678400);
			if (currentTimestamp.before(expiryTimestamp)) {
				System.err.println("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
				return "/licence-expiry";
			} else {
				System.err.println("YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY");
				return "/home";
			}
		}
	}

	@RequestMapping(value = { "/maintenance" }, method = RequestMethod.GET)
	public String maintenance(ModelMap model) {
		System.out.println("AppController.maintenance()......");
		return "maintenance";
	}

	@RequestMapping(value = { "/userList" }, method = RequestMethod.GET)
	public String listUsers(ModelMap model) {
		System.out.println("AppController.listUsers()........");
		List<User> users = userService.findAllUsers();
		model.addAttribute("users", users);
		model.addAttribute("loggedinuser", getPrincipal());
		return "/user-list";
	}

	@RequestMapping(value = { "/new-user" }, method = RequestMethod.GET)
	public String newUser(ModelMap model) {
		System.out.println("AppController.newUser().........");
		User user = new User();
		model.addAttribute("user", user);
		model.addAttribute("edit", false);
		model.addAttribute("loggedinuser", getPrincipal());
		return "/add-user";
	}

	@RequestMapping(value = { "/upcoming" }, method = RequestMethod.GET)
	public String commingSoonPage() {
		return "comming-soon";
	}

	@RequestMapping(value = { "/new-user" }, method = RequestMethod.POST)
	public String saveUser(@Valid User user, BindingResult result, ModelMap model) {

		System.out.println("AppController.saveUser()............");
		if (result.hasErrors()) {
			return "/add-user";
		}

		/*
		 * Preferred way to achieve uniqueness of field [sso] should be implementing
		 * custom @Unique annotation and applying it on field [sso] of Model class
		 * [User].
		 * 
		 * Below mentioned peace of code [if block] is to demonstrate that you can fill
		 * custom errors outside the validation framework as well while still using
		 * internationalized messages.
		 * 
		 */
		if (!userService.isUserSSOUnique(user.getId(), user.getSsoId())) {
			FieldError ssoError = new FieldError("user", "ssoId", messageSource.getMessage("non.unique.ssoId",
					new String[] { user.getSsoId() }, Locale.getDefault()));
			result.addError(ssoError);
			return "/add-user";
		}

		userService.saveUser(user);

		model.addAttribute("success","yaujar \'" + user.getFirstName() + " "+ user.getLastName() + "\' tyaar krNyaat Aalaa Aaho.");
		model.addAttribute("loggedinuser", getPrincipal());
		return "/success-page";
	}

	@RequestMapping(value = { "/edit-user-{ssoId}" }, method = RequestMethod.GET)
	public String editUser(@PathVariable String ssoId, ModelMap model) {
		User user = userService.findBySSO(ssoId);
		model.addAttribute("user", user);
		model.addAttribute("edit", true);
		model.addAttribute("loggedinuser", getPrincipal());
		return "/add-user";
	}

	@RequestMapping(value = { "/edit-user-{ssoId}" }, method = RequestMethod.POST)
	public String updateUser(@Valid User user, BindingResult result, ModelMap model, @PathVariable String ssoId) {

		if (result.hasErrors()) {
			return "add-user";
		}

		/*
		 * //Uncomment below 'if block' if you WANT TO ALLOW UPDATING SSO_ID in UI which
		 * is a unique key to a User. if(!userService.isUserSSOUnique(user.getId(),
		 * user.getSsoId())){ FieldError ssoError =new
		 * FieldError("user","ssoId",messageSource.getMessage( "non.unique.ssoId", new
		 * String[]{user.getSsoId()}, Locale.getDefault())); result.addError(ssoError);
		 * return "registration"; }
		 */

		userService.updateUser(user);

		model.addAttribute("success","yaujar " + user.getFirstName() + " " + user.getLastName() + " maQyao badla krNyaat Aalaa Aaho.");
		model.addAttribute("loggedinuser", getPrincipal());
		return "/registrationSuccess";
	}

	@RequestMapping(value = { "/delete-user-{ssoId}" }, method = RequestMethod.GET)
	public String deleteUser(@PathVariable String ssoId) {
		userService.deleteUserBySSO(ssoId);
		return "redirect:/userList";
	}

	@ModelAttribute("roles")
	public List<UserProfile> initializeProfiles() {
		return userProfileService.findAll();
	}

	// Below methods are no need to change.
	private static String getPrincipal() {
		System.out.println("AppController.getPrincipal().........");
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}

	private boolean isCurrentAuthenticationAnonymous() {
		System.out.println("AppController.isCurrentAuthenticationAnonymous()...........");
		final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		return authenticationTrustResolver.isAnonymous(authentication);
	}

	private void takeH2DatabaseBackup() throws Exception 
	{

		Backup.execute("C:\\sonapari\\a", "ac", "d",true);
		
	}

	private void restoreDatabaseBackup() {
		//Restore.execute(arg0, arg1, arg2, arg3);
	}
}