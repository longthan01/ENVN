package dao;

import java.util.List;

public class DAO
{
	public List toList(){
		return null;
	}
	public void log(String log)
	{
		System.out.println("***ENVN log:***\nException: " + this.getClass().toString() + "\n" + log);
	}
}
