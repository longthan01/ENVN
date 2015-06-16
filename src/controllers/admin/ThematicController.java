package controllers.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pojo.Employee;
import pojo.Thematic;
import pojo.User;
import utils.AjaxResult;
import utils.CurrentContext;
import dao.Entities;
import dao.PermissionsDAO;

@Controller("ThematicAdminController")
@RequestMapping(value = "/admin/thematic")
public class ThematicController extends controllers.Controller
{
	@RequestMapping(value = "/view")
	public String view(Model model)
	{
		Entities context = new Entities();
		List<Thematic> list = context.getThematics().toList();
		model.addAttribute("listThms", list);
		return "admin/thematic/view";
	}

	@RequestMapping(value = "/index")
	public String index(Model model, HttpServletRequest request)
	{
		Entities context = new Entities();
		User u = CurrentContext.getCurrentUser(request);
		if (u.getPermission().getPermissionId() != PermissionsDAO.PERMISSION_CONTENT_ADMIN)
		{ return "redirect:/admin/home/index"; }
		Employee emp = context.getEmployees().getEmployee(u);
		List<Thematic> list = context.getThematics().getList(emp);
		model.addAttribute("listThms", list);
		return "admin/thematic/index";
	}
}
