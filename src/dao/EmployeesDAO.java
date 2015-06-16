package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.jdbc.Work;

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
			session.flush();
			list = session.createQuery("from pojo.Employee").list();
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

	// get employee by id
	public Employee getEmployee(int empId)
	{
		Employee emp = null;
		try
		{
			SessionFactory factory = SessionFactoryManager.getSessionFactory();
			Session ss = factory.openSession();
			ss.getTransaction().begin();

			Query query = ss
					.createQuery("from pojo.Employee e where e.employeeId=:empId");
			query.setParameter("empId", empId);
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
			this.log("Method: getEmployee(int)");
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
	
	// remove employee
	public boolean remove(Employee emp)
	{
		boolean result = true;
		try
		{
			SessionFactory factory = SessionFactoryManager.getSessionFactory();
			Session ss = factory.openSession();
			ss.getTransaction().begin();
			ss.delete(emp); // save user to db
			ss.getTransaction().commit();
			ss.close();
		} catch (Exception e)
		{			
			this.log("Method: remove(Employee)");
			result =false;
			e.printStackTrace();
		}
		return result;
	}
	
	// update employee
	public boolean update(Employee emp)
	{
		boolean result = true;
		SessionFactory factory = SessionFactoryManager.getSessionFactory();
		Session ss = factory.openSession();
		try
		{
			ss.getTransaction().begin();
			ss.saveOrUpdate(emp);
			Iterator iter = emp.getThematics().iterator();
			Thematic thm = (Thematic)iter.next();
			thm.setEmployee(emp);
			thm = (Thematic)ss.merge(thm);
			
			ss.getTransaction().commit();
			ss.close();
		} catch (Exception e)
		{			
			this.log("Method: remove(Employee)");
			result =false;
			ss.getTransaction().rollback();
			e.printStackTrace();
		}
		return result;
	}
}
