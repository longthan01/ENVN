package dao;

public class Entities 
{
	private UsersDAO Users = null;
	private PermissionsDAO Permissions = null;
	private CoursesDAO Courses = null;
	private ThematicsDAO Thematics = null;
	private EmployeesDAO Employees = null;
	
	public Entities(){}
	
	public UsersDAO getUsers()
	{
		if (Users == null)
		{
			Users = new UsersDAO();
		}
		return this.Users;
	}
	public PermissionsDAO getPermissions()
	{
		if (Permissions == null)
		{
			Permissions = new PermissionsDAO();
		}
		return this.Permissions;
	}
	
	public CoursesDAO getCourses()
	{
		if (Courses == null)
		{
			Courses = new CoursesDAO();
		}
		return this.Courses;
	}
	
	public ThematicsDAO getThematics()
	{
		if (Thematics == null)
		{
			Thematics = new ThematicsDAO();
		}
		return this.Thematics;
	}
	
	public EmployeesDAO getEmployees()
	{
		if (Employees == null)
		{
			Employees = new EmployeesDAO();
		}
		return this.Employees;
	}
}
