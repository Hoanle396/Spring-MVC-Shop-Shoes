package webApp.controllers;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import webApp.DAO.CategoryDAO;
import webApp.DAO.OrderDAO;
import webApp.DAO.ProductDAO;
import webApp.constants.Common;
import webApp.models.Products;
import webApp.models.Users;

@Controller
@RequestMapping("/product")
public class ProductController {

	@GetMapping("")
	public String index(Model model,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "category", required = false, defaultValue = "0") int category,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		if (category == 0) {
			model.addAttribute("data", new ProductDAO().getProducts(page, 8, keyword));
		} else {
			model.addAttribute("data", new ProductDAO().getProducts(page, 8, keyword, category));
		}
		model.addAttribute("slider", new ProductDAO().getProducts(page, 8));
		model.addAttribute("category", new CategoryDAO().AllCategory());
		return "explore";
	}

	@GetMapping("/{id}")
	public String detail(Model model, @PathVariable("id") Long id) {
		System.out.println(new ProductDAO().getById(id));
		model.addAttribute("product", new ProductDAO().getById(id));
		return "detail";
	}

	@GetMapping("/cart/{id}")
	public String addToCart(Model model, HttpServletRequest rq, HttpSession session, @PathVariable("id") Long id,
			RedirectAttributes redirectAttributes) {
		Products product = new ProductDAO().getById(id);
		if (product == null) {
			return "error/404";
		}
		List<Products> cart = (List<Products>) session.getAttribute(Common.CART);
		if (cart == null) {
			cart = new ArrayList<>();
		}
		cart.add(product);
		session.setAttribute(Common.CART, cart);
		redirectAttributes.addFlashAttribute("success", "Add to cart success");
		return "redirect:/product/" + id;
	}

	@GetMapping("/mypage")
	public String viewCart(HttpSession session, Model model) {
		if (session.getAttribute(Common.SESSION_USER) != null) {
			List<Products> cart = (List<Products>) session.getAttribute(Common.CART);
			int cost = 0;
			if (cart != null) {
				for (Products item : cart) {
					cost += item.getPrice();
				}
			}
			model.addAttribute(Common.CART, cart);
			model.addAttribute("cost", cost);
			return "cart";
		}
		return "redirect:/login";
	}

	@GetMapping("/checkout")
	public String checkout(HttpSession session, Model model, RedirectAttributes red) {
		if (session.getAttribute(Common.SESSION_USER) != null) {
			List<Products> cart = (List<Products>) session.getAttribute(Common.CART);
			if (cart == null) {
				cart = new ArrayList<>();
			}

			if (cart.size() > 0) {
				int cost = 0;
				for (Products item : cart) {
					cost += item.getPrice();
				}
				Users user = (Users) session.getAttribute(Common.SESSION_USER);
				byte[] array = new byte[7];
				new Random().nextBytes(array);
				String code = new String(array, Charset.forName("UTF-8"));
				OrderDAO order = new OrderDAO();
				order.newOrder(code, user.getId(), cost, 0);
				for (Products item : cart) {
					if (new ProductDAO().getQuatity(item.getId()) > 1) {
						order.saveDetail(item.getId(), code);
						new ProductDAO().updateQuantity(item.getId());
						red.addFlashAttribute("success", "Order successfully!");
					} else {
						red.addFlashAttribute("error", "No quantity!");
					}
				}
				session.removeAttribute(Common.CART);
			} else {
				red.addFlashAttribute("error", "Order Failed!");
			}

			return "redirect:mypage";
		}
		return "redirect:/login";
	}
}
