package controllers;

public class Controller 
{
	public void log(String log)
	{
		System.out.println("ENVN log:\n Exception: " + this.getClass().toString() + "\n" + log);
	}
}
