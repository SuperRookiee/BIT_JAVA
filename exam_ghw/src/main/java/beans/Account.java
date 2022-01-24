package beans;

public class Account {
	private String accountId;	//계좌번호
	private String accountPwd;	//비밀번호
	private String userName;	//예금주
	private int balance;		//잔액
	
	public Account() {
		
	}

	public Account(String accountId, String accountPwd) {
		super();
		this.accountId = accountId;
		this.accountPwd = accountPwd;
	}
	public Account(String accountId, String accountPwd, String userName, int balance) {
		super();
		this.accountId = accountId;
		this.accountPwd = accountPwd;
		this.userName = userName;
		this.balance = balance;
	}

	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public String getAccountPwd() {
		return accountPwd;
	}

	public void setAccountPwd(String accountPwd) {
		this.accountPwd = accountPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

	
	
	
}
