package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import pojo.Employee;
import pojo.Thematic;
import pojo.User;
import utils.SessionFactoryManager;

public class EmployeesDAO extends DAO
{
	// get list
	public List<Employee> toList()
	{
		List<Employee> list = new ArrayList<Employee>();
		try
		{
			SessionFactory factory = SessionFactoryManager.getSessionFactory();
			Session session = factory.openSession();
			session.getTransaction().begin();
			// get list
			list = session.createCriteria(Employee.class) // create entities for employee class									
					.list(); // get list employee by entities
			session.getTransaction().commit();
			session.close();
		} catch (Exception e)
		{
			this.log("Method: toList()");
			e.printStackTrace();
		}
		return list;
	}

	// get employee by user
	public Employee getEmployee(User user)
	{
		Employee emp = null;
		try
		{
			SessionFactory factory = SessionFactoryManager.getSessionFactory();
			Session ss = factory.openSession();
			ss.getTransaction().begin();

			Query query = ss
					.createQuery("from pojo.Employee e where e.user.userId=:userid");
			query.setParameter("userid", user.getUserId());
			List result = query.list();
			if (!result.isEmpty())
			{
				emp = (Employee) result.get(0);
				Set<Thematic> thematics = emp.getThematics();
				Hibernate.initialize(thematics);
			}

			ss.getTransaction().commit();
			ss.close();

		} catch (Exception e)
		{
			this.log("Method: getEmployee(User)");
			e.printStackTrace();
		}
		return emp;
	}

	// add employee
	public boolean add(Employee emp)
	{
		boolean result = true;
		try
		{
			SessionFactory factory = SessionFactoryManager.getSessionFactory();
			Session ss = factory.openSession();
			ss.getTransaction().begin();
			ss.save(emp); // save user to db
			ss.getTransaction().commit();
			ss.close();
		} catch (Exception e)
		{			
			this.log("Method: add(Employee)");
			result =false;
			e.printStackTrace();
		}
		return result;
	}
}
