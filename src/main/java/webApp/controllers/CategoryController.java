package webApp.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import webApp.DAO.CategoryDAO;
import webApp.constants.Common;

@Controller
public class CategoryController {

	
	@GetMapping("admin/category")
	public String getCateGory(HttpSession session, Model model) {
		if (session.getAttribute(Common.SESSION_ROLE) != null
				&& session.getAttribute(Common.SESSION_ROLE).equals("ADMIN")) {
			model.addAttribute("category", new CategoryDAO().AllCategory());
			return "admin/category";
		}
		return "redirect:login";
	}

	
	@PostMapping("admin/category")
	public String postCategory(HttpServletRequest rq, HttpSession session, Model model) {
		if (session.getAttribute(Common.SESSION_ROLE) != null
				&& session.getAttribute(Common.SESSION_ROLE).equals("ADMIN")) {
			String name = rq.getParameter("name");
			String description = rq.getParameter("description");
			int user = new CategoryDAO().newCategory(name, description);
			if (user == 200) {
				model.addAttribute("success", "Add new Category successfully!");
			} else if (user == 400) {
				model.addAttribute("error", "Add new Category Failed!");
			} else if (user == 500) {
				model.addAttribute("error", "Internal Server error");
			}
			model.addAttribute("category", new CategoryDAO().AllCategory());
			return "admin/category";
		}
		return "redirect:login";
	}

	
	@PostMapping("admin/category/{id}")
	public String deleteCategory(HttpSession session, Model model, @PathVariable("id") Long id) {
		if (session.getAttribute(Common.SESSION_ROLE) != null
				&& session.getAttribute(Common.SESSION_ROLE).equals("ADMIN")) {
			System.out.println(id);
			int user = new CategoryDAO().deleteCategory(id);
			if (user == 200) {
				model.addAttribute("success", "Delete Category " + id + " successfully!");
			} else if (user == 400) {
				model.addAttribute("error", "Delete Category " + id + "  Failed!");
			} else if (user == 500) {
				model.addAttribute("error", "Internal Server error");
			}
			model.addAttribute("category", new CategoryDAO().AllCategory());
			return "admin/category";
		}
		return "redirect:/admin/login";
	}
}
