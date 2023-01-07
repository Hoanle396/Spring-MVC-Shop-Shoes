package webApp.controllers;

import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import webApp.DAO.CategoryDAO;
import webApp.DAO.ProductDAO;
import webApp.DTO.ProductDto;
import webApp.constants.Common;

@Controller
public class AdminProductController {

	
	@GetMapping("/admin/product")
	public String getProduct(HttpSession session, Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		if (session.getAttribute(Common.SESSION_ROLE) != null
				&& session.getAttribute(Common.SESSION_ROLE).equals("ADMIN")) {
			System.out.println(page);
			model.addAttribute("data", new ProductDAO().getProducts(page, 8));
			return "admin/product";
		}
		return "redirect:/admin/login";
	}

	
	@GetMapping("/admin/create/product")
	public String createProduct(HttpSession session, Model model) {
		if (session.getAttribute(Common.SESSION_ROLE) != null
				&& session.getAttribute(Common.SESSION_ROLE).equals("ADMIN")) {
			model.addAttribute("category", new CategoryDAO().AllCategory());
			return "admin/newproduct";
		}
		return "redirect:/admin/login";
	}

	
	@PostMapping(value = "/admin/product")
	public String postProduct(HttpSession session, Model model, @RequestParam("images") MultipartFile images,
			@ModelAttribute("product") ProductDto product) {
		if (session.getAttribute(Common.SESSION_ROLE) != null
				&& session.getAttribute(Common.SESSION_ROLE).equals("ADMIN")) {
			if (!images.isEmpty()) {
				try {
					byte[] bytes = images.getBytes();

					// Creating the directory to store images
					String filePath = session.getServletContext().getRealPath("/") + "assets" + File.separator
							+ "images" + File.separator + images.getOriginalFilename();
					FileOutputStream fileout = new FileOutputStream(filePath);
					fileout.write(bytes);
					fileout.close();
					String url = "/assets/images/" + images.getOriginalFilename();
					int res = new ProductDAO().newProduct(product, url,
							(String) session.getAttribute(Common.SESSION_FULLNAME));
					if (res == 200) {
						model.addAttribute("success", "Add new product successfully!");
					} else if (res == 400) {
						model.addAttribute("error", "Add new product Failed!");
					} else if (res == 500) {
						model.addAttribute("error", "Internal Server error");
					}
				} catch (Exception e) {
					model.addAttribute("error", "You failed to upload ");
				}
			} else {
				model.addAttribute("error", "You failed to upload , because the images was empty.");
			}
			model.addAttribute("category", new CategoryDAO().AllCategory());
			return "admin/newproduct";
		}
		return "redirect:/admin/login";
	}

	
	@PostMapping("admin/product/{id}")
	public String deleteProduct(HttpSession session, Model model, @PathVariable("id") Long id,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		if (session.getAttribute(Common.SESSION_ROLE) != null
				&& session.getAttribute(Common.SESSION_ROLE).equals("ADMIN")) {
			int user = new ProductDAO().delete(id);
			if (user == 200) {
				model.addAttribute("success", "Delete Product " + id + " successfully!");
			} else if (user == 400) {
				model.addAttribute("error", "Delete Product " + id + "  Failed!");
			} else if (user == 500) {
				model.addAttribute("error", "Internal Server error");
			}
			model.addAttribute("data", new ProductDAO().getProducts(page, 8));
			return "admin/product";
		}
		return "redirect:/admin/login";
	}

}
