package controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pojo.User;
import dao.UsersDAO;

@Controller
@RequestMapping(value = "/home")
public class HomeController extends controllers.Controller
{
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Model model, HttpServletRequest request)
	{
		User user = utils.CurrentContext.getCurrentUser(request);
		if (user != null)
		{
			model.addAttribute("user", user);
		}
		return "home/index";
	}
}
