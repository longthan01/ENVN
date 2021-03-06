package controllers.admin;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.Entities;
import dao.PermissionsDAO;
import pojo.Employee;
import pojo.Permission;
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

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public @ResponseBody AjaxResult addEmployee(@RequestParam String usrEmail,
			@RequestParam String usrPwd, @RequestParam int salary)
	{
		AjaxResult result = new AjaxResult();
		result.code = AjaxResult.SUCCESS;
		try
		{
			Entities context = new Entities();
			User temp = context.getUsers().getUser(usrEmail);
			if (temp != null)
			{
				result.code = AjaxResult.FAIL;
				result.details = "Email already exists!";
			} else
			{
				User usr = new User();
				usr.setEmail(usrEmail);
				usr.setPwd(utils.StringUtils.md5(usrPwd));
				usr.setAddr("");
				usr.setDob(new Date());
				usr.setFullName("");
				usr.setPhoneNumber("");
				Permission p = context.getPermissions().getPermission(
						PermissionsDAO.PERMISSION_CONTENT_ADMIN);
				usr.setPermission(p);
				usr.setStatus(1);

				boolean addUserSuccess = context.getUsers().add(usr);
				if (addUserSuccess == true)
				{
					Employee emp = new Employee();
					emp.setUser(context.getUsers().getUser(usr.getEmail()));
					emp.setCoefficient(salary);
					context.getEmployees().add(emp);
				}
			}

		} catch (Exception e)
		{
			result.code = AjaxResult.EXCEPTION;
			result.details = e.toString();
			e.printStackTrace();
		}

		return result;
	}

	@RequestMapping(value = "/updateEmp")
	public @ResponseBody AjaxResult updateEmployee(@RequestParam int empId,
			@RequestParam int salary,
			@RequestParam(required = false, defaultValue = "0") int thematicId)
	{
		AjaxResult result = new AjaxResult();
		Entities context = new Entities();
		try
		{
			Employee emp = context.getEmployees().getEmployee(empId);
			if (emp != null)
			{
				Thematic thematic = context.getThematics().getThematic(
						thematicId);

				if (thematic != null)
				{
					emp.getThematics().add(thematic);
				}
				emp.setCoefficient(salary);
				boolean isUpdated = context.getEmployees().update(emp);
				if (isUpdated == false)
				{
					result.code = AjaxResult.EXCEPTION;
					result.details = "Có lỗi trong quá trình lưu nhân viên xuống db.";
				}
			} else
			{
				result.code = AjaxResult.FAIL;
				result.details = "Nhân viên không tồn tại";
			}
		} catch (Exception e)
		{
			result.code = AjaxResult.EXCEPTION;
			result.details = "Có lỗi xảy ra trong quá trình update nhân viên.";
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping(value = "/removeEmp", method = RequestMethod.GET)
	public @ResponseBody AjaxResult removeEmployee(@RequestParam int empId)
	{
		AjaxResult result = new AjaxResult();
		Entities context = new Entities();
		try
		{
			Employee emp = context.getEmployees().getEmployee(empId);
			if (emp != null)
			{
				context.getEmployees().remove(emp);
			}
		} catch (Exception e)
		{
			result.code = AjaxResult.EXCEPTION;
			result.details = "Có lỗi xảy ra trong quá trình xóa nhân viên, xin thử lại sau.";
			e.printStackTrace();
		}
		return result;
	}

}
