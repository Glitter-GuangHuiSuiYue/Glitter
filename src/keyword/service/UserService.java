package keyword.service;

import java.util.Date;
import java.util.List;

import keyword.bean.User;
import keyword.dao.UserDao;

public class UserService {
	private UserDao dao;

	public UserDao getDao() {
		return dao;
	}

	public void setDao(UserDao dao) {
		this.dao = dao;
	}
	
	public UserService(){
	}

	public Long createUser(String userName, Date birthday){
		User u=new User();
		u.setUserName(userName);
		u.setBirthday(birthday);
		return dao.insert(u);
	}

	public Long insert(User u){
		Long id = dao.insert(u);
		return id;
	}

	public boolean update(User u){
		return dao.update(u);
	}

	public User selectUserByID(long id){
		List<User> result = dao.selects("from User u where u.id=" + id);
		return result.get(0);
	}

	public User selectUserByUserName(String userName){
		List<User> result = dao.selects("from User u where u.userName='" + userName+"'");
		return result.get(0);
	}
}
