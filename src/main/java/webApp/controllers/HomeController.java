package webApp.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import webApp.DAO.AdminDAO;
import webApp.DAO.CategoryDAO;
import webApp.DAO.ProductDAO;
import webApp.DAO.UserDAO;
import webApp.constants.Common;
import webApp.models.Users;

@Controller
public class HomeController {

	private UserDAO userDao = new UserDAO();

	@GetMapping("/home")
	public String GetHome(Model model) {
		model.addAttribute("product", new ProductDAO().getProducts(1, 10));
		model.addAttribute("category", new CategoryDAO().AllCategory());
		return "home";
	}

	@GetMapping("/login")
	public String getLogin(HttpSession session) {
		if (session.getAttribute(Common.SESSION_USER) != null) {
			return "redirect:home";
		}
		return "login";
	}

	@PostMapping("/login")
	public String postLogin(HttpSession session, HttpServletRequest req, Model model) {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		Users user = userDao.Login(email, password, Common.USER_ROLE);
		if (user != null) {
			session.setAttribute(Common.SESSION_USER, user);
			session.setAttribute(Common.SESSION_FULLNAME, user.getFullname());
			session.setAttribute(Common.SESSION_EMAIL, user.getEmail());
			session.setAttribute(Common.SESSION_ROLE, user.getRole());
			return "redirect:home";
		}
		model.addAttribute("msg", "Email or password incorect!");
		return "login";
	}

	@GetMapping("/register")
	public String getRegister(HttpSession session) {
		if (session.getAttribute(Common.SESSION_USER) != null) {
			return "redirect:home";
		}
		return "register";
	}

	@PostMapping("/register")
	public String postRegister(HttpServletRequest rq, HttpSession session, Model model) {
		String fullname = rq.getParameter("fullname");
		String email = rq.getParameter("email");
		String password = rq.getParameter("password");
		String confrimPassword = rq.getParameter("confrimpassword");
		if (confrimPassword.equalsIgnoreCase(password)) {
			int user = userDao.Register(fullname, email, password);
			if (user == 200) {
				model.addAttribute("success", "Resgiter successfully!");
			} else if (user == 400) {
				model.addAttribute("error", "Email already exists");
			} else if (user == 500) {
				model.addAttribute("error", "Internal Server error");
			}
		} else {
			model.addAttribute("error", "Password Confrim incorrect");
		}
		return "register";
	}

	@GetMapping("/logout")
	public String Logout(HttpSession session) {
		session.removeAttribute(Common.SESSION_EMAIL);
		session.removeAttribute(Common.SESSION_FULLNAME);
		session.removeAttribute(Common.SESSION_USER);
		session.removeAttribute(Common.SESSION_ROLE);
		return "redirect:home";
	}

	@GetMapping("/about")
	public String About() {
		return "about";
	}

	@PostMapping("/feedback")
	public String Feedback(@RequestParam("name") String name, @RequestParam("email") String email,
			@RequestParam("subject") String subject, @RequestParam("message") String message, Model model) {
		int user = new AdminDAO().newFeedback(new webApp.DTO.Feedback(name, email, subject, message));
		if (user == 200) {
			model.addAttribute("success", "Feedback successfully!");
		} else if (user == 400) {
			model.addAttribute("error", "Feedback failed!");
		} else if (user == 500) {
			model.addAttribute("error", "Internal Server error");
		}
		return "about";
	}

}
