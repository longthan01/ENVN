package controllers.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pojo.Thematic;
import dao.Entities;

@Controller("ThematicAdminController")
@RequestMapping(value = "/admin/thematic")
public class ThematicController
{
	@RequestMapping(value = "/view")
	public String index(Model model)
	{
		Entities context = new Entities();
		List<Thematic> list = context.getThematics().toList();
		model.addAttribute("listThms",list);
		return "admin/thematic/view";
	}
}
