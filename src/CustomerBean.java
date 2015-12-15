
public class CustomerBean {
	
	private String customer_name=null;
	private String address=null;
	private String status=null;
	private String balance=null;

		public CustomerBean()
		{
		
		}
		public String getcustomer_name()
		{return customer_name;
			
		}
		public String getaddress()
		{return address;
			
		}
		public String getstatus()
		{return status;
			
		}
		public String getbalance()
		{return balance;
			
		}
		public void setcustomer_name(String customer_name)
		{
			this.customer_name=customer_name;
		}
		public void setaddress(String address)
		{
			this.address=address;
		}
		public void setstatus(String status)
		{
			this.status=status;
		}
		public void setbalance(String balance)
		{
			this.balance=balance;
		}
}
