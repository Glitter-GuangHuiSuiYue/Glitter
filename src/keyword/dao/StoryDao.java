package keyword.dao;

import java.util.List;

import keyword.bean.Story;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class StoryDao {
	
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

	public StoryDao(){
	}
	
	public void close(){
		this.getSessionFactory().close();
	}
	
	public boolean insert(Story story){
		try{
			Session session = this.getSessionFactory().openSession();
			Transaction trans=session.beginTransaction();
			session.save(story);
			trans.commit();
			session.flush();
			session.close();
			return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
	} 

	public Story select(String sql){
		try{
			Session session = this.getSessionFactory().openSession();
			Transaction trans=session.beginTransaction();
			System.out.println(sql);
			@SuppressWarnings("unchecked")
			List<Story> list=session.createQuery(sql).list();
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
	
	public List<Story> selects(String sql){
		try{
			Session session = this.getSessionFactory().openSession();
			Transaction trans=session.beginTransaction();
			@SuppressWarnings("unchecked")
			List<Story> list=session.createQuery(sql).list();
			trans.commit();
			session.flush();
			session.close();
			return list;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	public boolean update(Story k){
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
