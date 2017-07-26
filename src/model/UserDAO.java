package model;

import java.sql.SQLException;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class UserDAO {
	
	public void addUser(User user) throws SQLException{
		Session s=MySQLConnector.getConnection();
		Transaction tr=s.beginTransaction();
		s.persist(user);
		tr.commit();
		s.close();
	}
	
	public void updateUser(User user) throws SQLException{
		Session s=MySQLConnector.getConnection();
		Transaction tr=s.beginTransaction();
		s.update(user);
		tr.commit();
		s.close();
	}
	public boolean userLogin(String password,String uName) throws SQLException{
		Session s=MySQLConnector.getConnection();
		Query qry=s.createQuery("FROM User u where u.uPassword=:pass");
		qry.setParameter("pass", password);
		User user=(User) qry.uniqueResult();
		s.close();
		if(user!=null){
			return true;
		}
		else
			return false;
	}
	
	public int getUserID(String password) throws SQLException{
		Session s=MySQLConnector.getConnection();
		Query qry=s.createQuery("FROM User u where u.uPassword=:pass");
		qry.setParameter("pass", password);
		User user=(User) qry.uniqueResult();
		s.close();
		int getUid=0;
		if(user!=null){
			getUid=user.getUid();
		}
		return getUid;
	}
	
	public User getUserByID(int uid) throws SQLException{
		Session s=MySQLConnector.getConnection();
		Query qry=s.createQuery("FROM User u where u.uid=:userID");
		qry.setParameter("userID", uid);
		User user=(User) qry.uniqueResult();
		return user;
	}
	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		UserDAO udao=new UserDAO();
		User user=new User(1,"Faruk", "Hasan", "01765708783", "omarhasan@gmail.com", "CSE", "12-13","omar","omar");
		//udao.addUser(user);
		//boolean result=udao.userLogin("hasan", "omar");
		//System.out.println(result);
		//int id=udao.getUserID("hasan");
		udao.updateUser(user);
		//System.out.println(user);
	}

}
