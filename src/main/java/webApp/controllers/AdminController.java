package webApp.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import webApp.DAO.AdminDAO;
import webApp.DAO.OrderDAO;
import webApp.DAO.UserDAO;
import webApp.constants.Common;
import webApp.models.Users;

@Controller
public class AdminController {

	@RequestMapping("/admin")
	public String Dashboard(Model model, HttpSession session) {
		if (session.getAttribute(Common.SESSION_ROLE) != null
				&& session.getAttribute(Common.SESSION_ROLE).equals("ADMIN")) {
			return "redirect:admin/dashboard";
		}
		return "redirect:admin/login";
	}

	@RequestMapping("/admin/dashboard")
	public String index(Model model, HttpSession session) {
		if (session.getAttribute(Common.SESSION_ROLE) != null
				&& session.getAttribute(Common.SESSION_ROLE).equals("ADMIN")) {
			model.addAttribute("data", new AdminDAO().countAll());
			return "admin/dashboard";
		}
		return "redirect:login";
	}

	@GetMapping("/admin/login")
	public String getLogin(HttpSession session) {
		if (session.getAttribute(Common.SESSION_ROLE) != null
				&& session.getAttribute(Common.SESSION_ROLE).equals("ADMIN")) {
			return "redirect:dashboard";
		}
		return "admin/login";
	}

	@PostMapping("/admin/login")
	public String postLogin(HttpSession session, HttpServletRequest req, Model model) {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		Users user = new UserDAO().Login(email, password, Common.ADMIN_ROLE);
		if (user != null) {
			session.setAttribute(Common.SESSION_USER, user);
			session.setAttribute(Common.SESSION_FULLNAME, user.getFullname());
			session.setAttribute(Common.SESSION_EMAIL, user.getEmail());
			session.setAttribute(Common.SESSION_ROLE, user.getRole());
			return "redirect:dashboard";
		}
		model.addAttribute("msg", "Email or password incorect!");
		return "admin/login";
	}

	@GetMapping("/admin/logout")
	public String Logout(HttpSession session) {
		session.removeAttribute(Common.SESSION_EMAIL);
		session.removeAttribute(Common.SESSION_FULLNAME);
		session.removeAttribute(Common.SESSION_USER);
		session.removeAttribute(Common.SESSION_ROLE);
		return "redirect:dashboard";
	}

	@GetMapping("/admin/users")
	public String getUser(HttpSession session, Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		if (session.getAttribute(Common.SESSION_ROLE) != null
				&& session.getAttribute(Common.SESSION_ROLE).equals("ADMIN")) {
			model.addAttribute("data", new UserDAO().getUsers(page, 8));
			return "admin/users";
		}
		return "redirect:/admin/login";
	}

	@GetMapping("admin/orders")
	public String getOrder(HttpSession session, Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		if (session.getAttribute(Common.SESSION_ROLE) != null
				&& session.getAttribute(Common.SESSION_ROLE).equals("ADMIN")) {
			model.addAttribute("data", new OrderDAO().getOrder(page, 8));
			return "admin/order";
		}
		return "redirect:/admin/login";
	}

	@GetMapping("admin/feedback")
	public String getFeedback(HttpSession session, Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		if (session.getAttribute(Common.SESSION_ROLE) != null
				&& session.getAttribute(Common.SESSION_ROLE).equals("ADMIN")) {
			model.addAttribute("data", new AdminDAO().getFeedback(page, 8));
			return "admin/feedback";
		}
		return "redirect:/admin/login";
	}
}
