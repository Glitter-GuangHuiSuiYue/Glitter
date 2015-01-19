package keyword.dao;

import java.util.List;

import keyword.bean.Location;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class LocationDao {

	
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

	public LocationDao(){
	}
	
	public void close(){
		this.getSessionFactory().close();
	}
	
	public Long insert(Location location){
		try{
			Session session = this.getSessionFactory().openSession();
			Transaction trans=session.beginTransaction();
			session.save(location);
			trans.commit();
			session.flush();
			session.close();
			return location.getId();
		}catch(Exception e){
			System.out.println(e.getMessage());
			return -1L;
		}
	} 

	public Location select(String sql){
		try{
			Session session = this.getSessionFactory().openSession();
			Transaction trans=session.beginTransaction();
			System.out.println(sql);
			@SuppressWarnings("unchecked")
			List<Location> list=session.createQuery(sql).list();
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
	
	public List<Location> selects(String sql){
		try{
			Session session = this.getSessionFactory().openSession();
			Transaction trans=session.beginTransaction();
			@SuppressWarnings("unchecked")
			List<Location> list=session.createQuery(sql).list();
			trans.commit();
			session.flush();
			session.close();
			return list;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	public boolean update(Location location){
		try{
			Session session = this.getSessionFactory().openSession();
			Transaction trans=session.beginTransaction();
			session.merge(location);
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
