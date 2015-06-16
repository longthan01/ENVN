package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import pojo.Permission;
import pojo.User;
import utils.SessionFactoryManager;

public class UsersDAO extends DAO
{
	@Override
	public List<User> toList() {
		List<User> list = new ArrayList<User>();
		try {
			SessionFactory factory = SessionFactoryManager.getSessionFactory();
			Session session = factory.openSession();
			session.getTransaction().begin();
			// get list
			list = session.createCriteria(User.class) // create entities for user													// class
					.list(); // get list user by entities
			session.getTransaction().commit();
			session.close();
		} catch (HibernateException e) {
			this.log("Method: toList()");
			e.printStackTrace();
		}
		return list;
	}
	
	// get user with userid
	public User getUser(int userId)
	{
		User user = null;
		try 
		{
			SessionFactory factory = SessionFactoryManager.getSessionFactory();
			Session ss = factory.openSession();
			ss.getTransaction().begin();
			
			Query query = ss.createQuery("from pojo.User u where u.userId=:userid");
			query.setParameter("userid",userId);
			List result = query.list();
			if (!result.isEmpty())
			{
				user = (User)result.get(0);
				Permission prms = user.getPermission();
				Hibernate.initialize(prms);
			}
			
			ss.getTransaction().commit();
			ss.close();
			
		} 
		catch (HibernateException e) 
		{
			this.log("Method: getUser(int)");
			e.printStackTrace();
		}
		
		return user;
	}
	
	// get user with email
	public User getUser(String email)
	{
		User user = null;
		try 
		{
			SessionFactory factory = SessionFactoryManager.getSessionFactory();
			Session ss = factory.openSession();
			ss.getTransaction().begin();
			
			Query query = ss.createQuery("from pojo.User u where u.email=:email");
			query.setParameter("email",email);
			
			List result = query.list();
			if (!result.isEmpty())
			{
				user = (User)result.get(0);
				Permission prms = user.getPermission();
				Hibernate.initialize(prms);
			}
			
			ss.getTransaction().commit();
			ss.close();
			
		} 
		catch (Exception e) 
		{
			this.log("Method: getUser(String)");
			e.printStackTrace();
		}
		return user;
	}
	
	// get user with email and pwd
	public User getUser(String email, String pwd)
	{
		User user = null;
		try 
		{
			SessionFactory factory = SessionFactoryManager.getSessionFactory();
			Session ss = factory.openSession();
			ss.getTransaction().begin();
			
			Query query = ss.createQuery("from pojo.User u where u.email=:email"
					+ " and u.pwd=:password");
			query.setParameter("email",email);
			query.setParameter("password",pwd);
			List result = query.list();
			if (!result.isEmpty())
			{
				user = (User)result.get(0);
				Permission prms = user.getPermission();
				Hibernate.initialize(prms);
			}
			ss.getTransaction().commit();
			ss.close();
		} 
		catch (HibernateException e) 
		{
			this.log("Method: getUser(string, string)");
			e.printStackTrace();
		}
		catch (Exception ex)
		{
			this.log("Method: getUser(String,String)");
			ex.printStackTrace();
		}
		return user;
	}
	
	// insert new user
	public boolean add(User user)
	{
		boolean result = true;
		try
		{
			SessionFactory factory = SessionFactoryManager.getSessionFactory();
			Session ss = factory.openSession();
			ss.getTransaction().begin();
			ss.save(user); // save user to db
			ss.getTransaction().commit();
			ss.close();
		} catch (Exception e)
		{
			this.log("Method: save(User)");
			e.printStackTrace();
			result = false;
		}
		return result;
	}
	
}





