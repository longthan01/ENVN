package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import pojo.Permission;
import pojo.User;
import utils.SessionFactoryManager;

public class PermissionsDAO extends DAO
{
	public static int PERMISSION_USER = 0;
	public static int PERMISSION_CONTENT_ADMIN = 1;
	public static int PERMISSION_WEB_ADMIN = 2;
	public static int PERMISSION_MANAGER = 3;
	
	// get list permission
	@Override 
	public List<Permission> toList()
	{
		List<Permission> list = new ArrayList<Permission>();
		try
		{
			SessionFactory factory = SessionFactoryManager.getSessionFactory();
			Session session = factory.openSession();
			session.getTransaction().begin();
			// get list
			list = session.createCriteria(Permission.class) // create entities
															// for user // class
					.list(); // get list user by entities
			session.getTransaction().commit();
			session.close();
		} catch (Exception e)
		{
			this.log("Method: toList()");
			e.printStackTrace();
		}
		return list;
	}
	
	// get permission obj by id
	public Permission getPermission(int permissionId)
	{
		Permission p = null;
		try
		{
			SessionFactory factory = SessionFactoryManager.getSessionFactory();
			Session session = factory.openSession();
			session.getTransaction().begin();
			
			Query query = session.createQuery("from pojo.Permission p where p.permissionId=:permissionId");
			query.setParameter("permissionId",permissionId);
			List result = query.list();
			if (!result.isEmpty())
			{
				p = (Permission)result.get(0);
			}
			
			session.getTransaction().commit();
			session.close();
		} catch (Exception e)
		{
			this.log("Method: getPermission(int)");
			e.printStackTrace();
		}
		return p;
	}
}
