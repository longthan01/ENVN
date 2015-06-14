package utils;

public class AjaxResult 
{
	public static int SUCCESS = 1;
	public static int FAIL = -1;
	public static int EXCEPTION = 0;
	
	public int code; // <0 :fail, = 0: exception, >0 : success
	public String details;
	
	public AjaxResult()
	{
		this.code = -1; 
	}
	
	public AjaxResult(int code, String details)
	{
		this.code = code;
		this.details = details;
	}
}
