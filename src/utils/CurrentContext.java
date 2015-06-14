package utils;

import java.net.HttpCookie;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.net.httpserver.HttpContext;

import dao.UsersDAO;
import pojo.User;

public class CurrentContext extends UtilsLog
{
	private HttpServletRequest request;

	public HttpServletRequest getRequest()
	{
		return request;
	}
	public void setRequest(HttpServletRequest request)
	{
		this.request = request;
	}

	// get current user
	public static User getCurrentUser(HttpServletRequest request)
	{
		HttpSession session = request.getSession(true);
		User user = null;
		try
		{
			if (CurrentContext.isLogged(request) == true)
			{
				if (!session.isNew())
				{
					user = (User) session.getAttribute("CurrentUser");
				}
			}
		} catch (Exception e)
		{
			System.out
					.println("ENVN log: Utils.CurrentContext.getCurrentUser(HttpServletRequest)");
			e.printStackTrace();
		}
		return user;
	}
	// check is logged of current context
	public static boolean isLogged(HttpServletRequest request)
	{
		HttpSession session = request.getSession(true);
		boolean result = false;
		try
		{
			if (session.getAttribute("IsLogged") != null)
			{
				result = (boolean) session.getAttribute("IsLogged");
			} else
			{
				Cookie[] cookies = request.getCookies();
				if (cookies != null)
				{
					for (Cookie cookie : cookies)
					{
						String c_name = cookie.getName();
						if (c_name.contains("UsrEmail"))
						{
							String email = cookie.getValue();
							User u = new UsersDAO().getUser(email);
							if (u != null)
							{
								HttpSession ssuser = request.getSession(true);
								ssuser.setAttribute("CurrentUser", u);
								result = true;
							}
						}
					}
				}
			}
		} catch (Exception e)
		{
			System.out
					.println("ENVN log: Utils.CurrentContext.isLogged(HttpServletRequest)");
			e.printStackTrace();
		}
		return result;
	}
	// logout process
	public static void destroy(HttpServletRequest request,
			HttpServletResponse response)
	{
		HttpSession session = request.getSession(false);
		try
		{
			if (session != null)
			{
				session.setAttribute("CurrentUser", null);
				session.setAttribute("IsLogged", false);
				for (Cookie cookie : request.getCookies())
				{
					if (cookie.getName().contains("UsrEmail"))
					{
						cookie.setMaxAge(0);
						cookie.setValue(null);
						response.addCookie(cookie);
					}
				}
			}
		} catch (Exception e)
		{
			System.out
					.println("ENVN log: Utils.CurrentContext.destroy(HttpServletRequest)");
			e.printStackTrace();
		}
	}
}
