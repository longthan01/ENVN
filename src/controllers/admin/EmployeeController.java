package controllers.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.Entities;
import pojo.Employee;
import pojo.Thematic;
import pojo.User;
import utils.AjaxResult;

@Controller
@RequestMapping(value = "/admin/employee")
public class EmployeeController
{
	@RequestMapping(value = "/index")
	public String index(Model model)
	{
		Entities context = new Entities();
		List<Employee> listEmp = context.getEmployees().toList();
		model.addAttribute("listEmp", listEmp);
		return "admin/employee/index";
	}
	
	@RequestMapping(value = "/add", method=RequestMethod.GET)
	public AjaxResult addEmployee(int userid, int coef, int thematicid)
	{		
		AjaxResult result = new AjaxResult();
		Employee emp = new Employee();
		emp.setUserId(userid);
		emp.setCoefficient(coef);
		Entities context = new Entities();
		context.getEmployees().add(emp);
		Thematic thematic = context.getThematics().getThematic(thematicid);
		if (thematic != null)
		{
			thematic.setEmployee(emp);
			context.getThematics().save(thematic);
		}
		return result;
	}
}



















