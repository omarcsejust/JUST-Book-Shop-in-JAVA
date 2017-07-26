package model;

public class User {
	private int uid;
	String uFirstName,uLastName,uPhn,uEmail,uDept,uSession,uName,uPassword;
	
	public User(){}
	
	public User(int uid, String uFirstName, String uLastName, String uPhn, String uEmail, String uDept, String uSession,
			String uName, String uPassword) {
		super();
		this.uid = uid;
		this.uFirstName = uFirstName;
		this.uLastName = uLastName;
		this.uPhn = uPhn;
		this.uEmail = uEmail;
		this.uDept = uDept;
		this.uSession = uSession;
		this.uName = uName;
		this.uPassword = uPassword;
	}
	
	
	public User(String uFirstName, String uLastName, String uPhn, String uEmail, String uDept, String uSession,
			String uName, String uPassword) {
		super();
		this.uFirstName = uFirstName;
		this.uLastName = uLastName;
		this.uPhn = uPhn;
		this.uEmail = uEmail;
		this.uDept = uDept;
		this.uSession = uSession;
		this.uName = uName;
		this.uPassword = uPassword;
	}

	public int getUid() {
		return uid;
	}


	public void setUid(int uid) {
		this.uid = uid;
	}


	public String getuFirstName() {
		return uFirstName;
	}


	public void setuFirstName(String uFirstName) {
		this.uFirstName = uFirstName;
	}


	public String getuLastName() {
		return uLastName;
	}


	public void setuLastName(String uLastName) {
		this.uLastName = uLastName;
	}


	public String getuPhn() {
		return uPhn;
	}


	public void setuPhn(String uPhn) {
		this.uPhn = uPhn;
	}


	public String getuEmail() {
		return uEmail;
	}


	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}


	public String getuDept() {
		return uDept;
	}


	public void setuDept(String uDept) {
		this.uDept = uDept;
	}


	public String getuSession() {
		return uSession;
	}


	public void setuSession(String uSession) {
		this.uSession = uSession;
	}


	public String getuName() {
		return uName;
	}


	public void setuName(String uName) {
		this.uName = uName;
	}


	public String getuPassword() {
		return uPassword;
	}


	public void setuPassword(String uPassword) {
		this.uPassword = uPassword;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", uFirstName=" + uFirstName + ", uLastName=" + uLastName + ", uPhn=" + uPhn
				+ ", uEmail=" + uEmail + ", uDept=" + uDept + ", uSession=" + uSession + ", uName=" + uName
				+ ", uPassword=" + uPassword + "]";
	}
	
}
