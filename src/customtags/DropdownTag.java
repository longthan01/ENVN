package customtags;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import pojo.Classe;
import pojo.Permission;
import pojo.Thematic;
import dao.Entities;

public class DropdownTag extends SimpleTagSupport
{
	private String envnObject;
	
	private String id;
	
	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getEnvnObject()
	{
		return envnObject;
	}

	public void setEnvnObject(String envnObject)
	{
		this.envnObject = envnObject;
	}

	public String getCssClass()
	{
		return cssClass;
	}

	public void setCssClass(String cssClass)
	{
		this.cssClass = cssClass;
	}

	public String getCssStyle()
	{
		return cssStyle;
	}

	public void setCssStyle(String cssStyle)
	{
		this.cssStyle = cssStyle;
	}

	private String cssClass;
	private String cssStyle;

	@Override
	public void doTag() throws JspException, IOException
	{
		JspWriter writter = this.getJspContext().getOut();
		writter.print("<select");
		if (cssClass != null && !cssClass.isEmpty())
		{
			writter.print(" class=\"" + cssClass + "\"");
		}
		if (cssStyle != null && !cssStyle.isEmpty())
		{
			writter.print(" style=\"" + cssStyle + "\"");
		}
		if(id != null && !id.isEmpty())
		{
			writter.print(" id=\""+id+"\"");
		}
		writter.print(">");
		String obj = envnObject.trim().toLowerCase();

		try
		{
			if (obj.contains("thematic"))
			{
				List<Thematic> list = new Entities().getThematics().toList();
				for (Thematic thm : list)
				{
					writter.print("<option value=\"" + thm.getThematicId()
							+ "\">");
					writter.print(thm.getThematicName());
					writter.print("</option>");
				}
			}
			
			if (obj.contains("permission"))
			{
				List<Permission> list = new Entities().getPermissions().toList();
				for (Permission prms : list)
				{
					writter.print("<option value=\"" + prms.getPermissionId()
							+ "\">");
					writter.print(prms.getPolicy());
					writter.print("</option>");
				}
			}
			
			/*if (obj.contains("class"))
			{
				List<Classe> list = new Entities().g
				for (Thematic thm : list)
				{
					writter.print("<option value=\"" + thm.getThematicId()
							+ "\">");
					writter.print(thm.getThematicName());
					writter.print("</option>");
				}
			}*/
			writter.print("</select>");
			
		} catch (Exception e)
		{
			utils.UtilsLog log = new utils.UtilsLog();
			log.log(e.toString());
			e.printStackTrace();
		}
	}

}
