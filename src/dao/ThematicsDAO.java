package dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import pojo.Employee;
import pojo.Thematic;
import pojo.User;
import utils.SessionFactoryManager;

public class ThematicsDAO extends DAO
{
	// get list thematics
	@Override
	public List<Thematic> toList()
	{
		List<Thematic> list = new ArrayList<Thematic>();
		try
		{
			SessionFactory factory = SessionFactoryManager.getSessionFactory();
			Session session = factory.openSession();
			session.getTransaction().begin();
			// get list
			session.flush();
			list = session.createCriteria(Thematic.class) // create entities for
															// user // class
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

	// get list thematic by it's manager
	public List<Thematic> getList(Employee emp)
	{
		List<Thematic> result = null;
		try
		{
			SessionFactory factory = SessionFactoryManager.getSessionFactory();
			Session ss = factory.openSession();
			ss.getTransaction().begin();
			result = ss.createQuery("from pojo.Thematic t where t.employee.employeeId=:empid")
					.setParameter("empid", emp.getEmployeeId())
					.list();
			ss.getTransaction().commit();
			ss.close();

		} catch (Exception e)
		{
			this.log("Method: getList(Employee)");
			e.printStackTrace();
		}
		return result;
	}
	
	
	// get thematic by id
	public Thematic getThematic(int id)
	{
		Thematic thematic = null;
		try
		{
			SessionFactory factory = SessionFactoryManager.getSessionFactory();
			Session ss = factory.openSession();
			ss.getTransaction().begin();

			Query query = ss
					.createQuery("from pojo.Thematic u where u.thematicId=:thematicId");
			query.setParameter("thematicId", id);
			List result = query.list();
			if (!result.isEmpty())
			{
				thematic = (Thematic) result.get(0);
			}

			ss.getTransaction().commit();
			ss.close();

		} catch (Exception e)
		{
			this.log("Method: getThematic(int)");
			e.printStackTrace();
		}
		return thematic;

	}

	// get thematics by it's manager
	public List<Thematic> getThematics(User user)
	{
		List<Thematic> thematics = new ArrayList<Thematic>();
		try
		{
			Entities context = new Entities();
			Employee emp = context.getEmployees().getEmployee(user);
			if (emp != null)
			{
				Iterator iterator = emp.getThematics().iterator();
				
				while (iterator.hasNext()) // get list elements 
				{
					Thematic tm = (Thematic)iterator.next(); 
					thematics.add(tm);
				}
			}

		} catch (Exception e)
		{
			this.log("Method: getThematic(User)");
			e.printStackTrace();
		}
		return thematics;
	}

	// save change thematic
	public void save(Thematic thematic)
	{
		try
		{
			SessionFactory factory = SessionFactoryManager.getSessionFactory();
			Session session = factory.openSession();
			session.getTransaction().begin();
			session.save(thematic);
			session.getTransaction().commit();
			session.close();
		} catch (Exception e)
		{
			this.log("Method: save(Thematic)");
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
