package utils;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class SessionFactoryManager 
{
	private static SessionFactory factory = null;
	
	private SessionFactoryManager()
	{
		
	}
	public static SessionFactory getSessionFactory()
	{
		if (factory == null)
		{
			factory = new Configuration().configure().buildSessionFactory();
		}
		return factory;
	}
}
