package keyword.dao;

import java.util.List;

import keyword.bean.User;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class UserDao {
	
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

	public UserDao(){
	}
	
	public void close(){
		this.getSessionFactory().close();
	}
	
	public Long insert(User user){
		try{
			System.out.println(0);
			Session session = this.getSessionFactory().openSession();
			System.out.println(1);
			Transaction trans=session.beginTransaction();
			System.out.println(2);
			session.save(user);
			System.out.println(3);
			trans.commit();
			System.out.println(4);
			session.flush();
			System.out.println(5);
			session.close();
			System.out.println(6);
			return user.getId();
		}catch(Exception e){
			System.out.println("Here:" + e.getMessage());
			return -1L;
		}
	} 

	public User select(String sql){
		try{
			Session session = this.getSessionFactory().openSession();
			Transaction trans=session.beginTransaction();
			System.out.println(sql);
			@SuppressWarnings("unchecked")
			List<User> list=session.createQuery(sql).list();
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
	
	public List<User> selects(String sql){
		try{
			Session session = this.getSessionFactory().openSession();
			Transaction trans=session.beginTransaction();
			@SuppressWarnings("unchecked")
			List<User> list=session.createQuery(sql).list();
			trans.commit();
			session.flush();
			session.close();
			return list;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	public boolean update(User k){
		try{
			Session session = this.getSessionFactory().openSession();
			Transaction trans=session.beginTransaction();
			session.merge(k);
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
