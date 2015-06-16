package controllers;

import java.net.HttpCookie;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.DispatcherServlet;

import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;
import pojo.Permission;
import pojo.User;
import utils.AjaxResult;
import utils.CurrentContext;
import dao.Entities;
import dao.PermissionsDAO;

@Controller
@RequestMapping(value = "/account")
public class AccountController extends controllers.Controller
{
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String index(Model model, @RequestParam(value="flag", defaultValue="1") int flag)
	{
		if (flag == 1) // login 
		{
			model.addAttribute("code", "login");
		}
		else
		{
			model.addAttribute("code", "regis");
		}
		return "account/login";
	}
	@RequestMapping(value = "/trylogin", method = RequestMethod.GET)
	public @ResponseBody AjaxResult login(@RequestParam String email,
			@RequestParam String pwd, @RequestParam boolean isRemember,
			HttpServletRequest request, HttpServletResponse reponse)

	{
		AjaxResult loginResult = new AjaxResult();

		try
		{
			Entities context = new Entities();
			User user = context.getUsers().getUser(email, utils.StringUtils.md5(pwd));
			if (user != null)
			{
				loginResult.code = 1;
				HttpSession session = request.getSession(true);
				session.setAttribute("CurrentUser", user);
				session.setAttribute("IsLogged", true);

				if (isRemember == true)
				{
					Cookie cookie = new Cookie("UsrEmail", user.getEmail());
					cookie.setMaxAge(3600 * 24 * 3); // three days
					cookie.setHttpOnly(true);
					cookie.setPath("/ENVN/");
					reponse.addCookie(cookie);	
					
				}
			}
		} catch (Exception e)
		{
			this.log("Controller : Account. Method: login(String, String, boolean)");
			e.printStackTrace();
			loginResult.code = AjaxResult.EXCEPTION;
		}

		return loginResult;
	}

	@RequestMapping(value = "/tryregis", method = RequestMethod.GET)
	public @ResponseBody AjaxResult register(@RequestParam String email,
			@RequestParam String pwd, @RequestParam String fullName,
			@RequestParam String dob, @RequestParam String addr,
			@RequestParam String phoneNumber,
			@RequestParam("recaptcha_challenge_field") String challangeField,
			@RequestParam("recaptcha_response_field") String responseField,
			HttpServletRequest request)

	{

		User user = null;
		AjaxResult regisResult = new AjaxResult();

		try
		{

			String remoteAddr = request.getRemoteAddr();
			ReCaptchaImpl captcha = new ReCaptchaImpl();
			captcha.setPrivateKey("6Lc7_wcTAAAAAMDq0gLl0dK5J5bWC3oVVNU7f8Z2");
			ReCaptchaResponse reCaptchaResponse = captcha.checkAnswer(
					remoteAddr, challangeField, responseField);
			if (!reCaptchaResponse.isValid())
			{
				regisResult.code = -2;
				regisResult.details = "Invalid captcha code.";
			} else
			{
				Entities context = new Entities();
				user = context.getUsers().getUser(email);
				if (user != null)
				{
					regisResult.code = -1;
					regisResult.details = "Email already exists.";
				} else
				{
					regisResult.code = 1; // success
					user = new User();
					user.setFullName(fullName);
					user.setAddr(addr);
					user.setEmail(email);
					user.setPwd(utils.StringUtils.md5(pwd));
					user.setDob(new java.util.Date(dob));
					user.setPhoneNumber(phoneNumber);
					Permission p = context.getPermissions().getPermission(
							PermissionsDAO.PERMISSION_USER);
					user.setPermission(p);
					context.getUsers().add(user);

				}
			}

		} catch (Exception e)
		{
			this.log("Controller: Account. Method: register(String x8)");
			e.printStackTrace();
			regisResult.code = 0;
			regisResult.details = "Some thing wrong when regis new user.";
		}
		return regisResult;
	}

	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public @ResponseBody AjaxResult logout(HttpServletRequest request, HttpServletResponse response)
	{
		AjaxResult result = new AjaxResult();
		try
		{
			CurrentContext.destroy(request, response);
			result.code = AjaxResult.SUCCESS;
			result.details = "Logout ok";
		} catch (Exception e)
		{
			result.details = e.toString();
			e.printStackTrace();
			result.code=AjaxResult.EXCEPTION;
		}
		return result;
	}

}
