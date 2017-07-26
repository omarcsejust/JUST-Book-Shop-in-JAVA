package model;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class BookDAO {
	
	public void addBook(Book book) throws SQLException{  // Hibernate
		Session s=MySQLConnector.getConnection();
		Transaction tr=s.beginTransaction();
		s.persist(book);
		tr.commit();
		s.close();
		System.out.println("Success.................");
	}
	
	public void updateBook(Book book) throws SQLException{
		Session s=MySQLConnector.getConnection();
		Transaction tr=s.beginTransaction();
		//s.persist(book);
		s.update(book);
		tr.commit();
		s.close();
	}
	
	public List<Book> getBooksByUserID(int id) throws SQLException{  // HQL 
		Session s=MySQLConnector.getConnection();
		Query qry=s.createQuery("FROM Book b where b.uid=:userID");
		qry.setParameter("userID", id);
		List<Book> books=qry.getResultList();
		s.close();
		return books;
	}
	
	public List<Book> getBooksByCategory(String category) throws SQLException{  // HQL
		Session s=MySQLConnector.getConnection();
		Query qry=s.createQuery("FROM Book b where b.bCategory=:bookCategory");
		qry.setParameter("bookCategory", category);
		List<Book> books=qry.getResultList();
		s.close();
		return books;
	}
	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		BookDAO bdao=new BookDAO();
		Book book=new Book(3,"Java4", "Omar", "4th", 200, "Eng", "11-06-17","01765708783", 3);
		bdao.updateBook(book);
		/*List<Book> books=bdao.getBooksByCategory("engineering");
		for(Book book:books){
			System.out.println(book);
		}*/
	}

}
