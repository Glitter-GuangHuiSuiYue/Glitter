package keyword.dao;

import java.util.List;

import keyword.bean.Comment;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class CommentDao {
	
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		if (sessionFactory == null){
			ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring.xml");
			sessionFactory = (SessionFactory)context.getBean("sessionFactory");
		}
		System.out.println(sessionFactory == null);
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public CommentDao(){
	}
	
	public void close(){
		this.getSessionFactory().close();
	}
	
	public boolean insert(Comment comment){
		try{
			Session session = this.getSessionFactory().openSession();
			Transaction trans=session.beginTransaction();
			session.save(comment);
			trans.commit();
			session.flush();
			session.close();
			return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
	} 

	public Comment select(String sql){
		try{
			Session session = this.getSessionFactory().openSession();
			Transaction trans=session.beginTransaction();
			System.out.println(sql);
			@SuppressWarnings("unchecked")
			List<Comment> list=session.createQuery(sql).list();
			trans.commit();
			session.flush();
			session.close();
			if (list.size()>0){
				return list.get(0);
			}
			return null;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	public List<Comment> selects(String sql){
		try{
			Session session = this.getSessionFactory().openSession();
			Transaction trans=session.beginTransaction();
			@SuppressWarnings("unchecked")
			List<Comment> list=session.createQuery(sql).list();
			trans.commit();
			session.flush();
			session.close();
			return list;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	public boolean update(Comment c){
		try{
			Session session = this.getSessionFactory().openSession();
			Transaction trans=session.beginTransaction();
			session.merge(c);
			trans.commit();
			session.flush();
			session.close();
			return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
	} 
}
