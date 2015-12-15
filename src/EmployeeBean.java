
public class EmployeeBean {
private String username=null;
private String password=null;
private String date=null;

	public EmployeeBean()
	{
	
	}
	public String getuserName()
	{return username;
		
	}
	public String getPassword()
	{return password;
		
	}
	public String getDate()
	{return date;
		
	}
	public void setuserName(String username)
	{
		this.username=username;
	}
	public void setpassword(String password)
	{
		this.password=password;
	}
	public void setdate(String date)
	{
		this.date=date;
	}
}
