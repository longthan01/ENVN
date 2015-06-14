 package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import pojo.Course;
import pojo.User;
import utils.SessionFactoryManager;

public class CoursesDAO extends DAO
{
	// get list course
	public List<Course> toList()
	{
		List<Course> list = new ArrayList<Course>();
		try {
			SessionFactory factory = SessionFactoryManager.getSessionFactory();
			Session session = factory.openSession();
			session.getTransaction().begin();
			// get list
			list = session.createCriteria(Course.class) // create entities for user													// class
					.list(); // get list user by entities
			session.getTransaction().commit();
			session.close();
		} catch (HibernateException e) {
			this.log("Method: toList()");
			e.printStackTrace();
		}
		return list;
	}

	// get course by id
	public Course getCourse(int courseId)
	{
		Course course = null;
		try
		{
			SessionFactory factory = SessionFactoryManager.getSessionFactory();
			Session session = factory.openSession();
			session.getTransaction().begin();
			// get list
			List<Course> list = session.createCriteria(Course.class) // create entities for user													// class
					.list(); // get list user by entities
			if (!list.isEmpty())
			{
				course = list.get(0);
			}
			session.getTransaction().commit();
			session.close();
		} catch (Exception e)
		{
			this.log("Method: getCourse(int)");
			e.printStackTrace();
		}
		return course;
	}
	
	// update course
	public void save(Course course)
	{
		try
		{
			SessionFactory factory = SessionFactoryManager.getSessionFactory();
			Session ss = factory.openSession();
			ss.getTransaction().begin();
			ss.save(course); // save user to db
			ss.getTransaction().commit();
			ss.close();
		} catch (Exception e)
		{
			this.log("Method: save(Course)");
			e.printStackTrace();
		}
	}
}


