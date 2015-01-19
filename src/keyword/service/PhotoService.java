package keyword.service;

import java.util.List;

import keyword.bean.Photo;
import keyword.dao.PhotoDao;


public class PhotoService {
	private PhotoDao dao;

	public PhotoDao getDao() {
		return dao;
	}

	public void setDao(PhotoDao dao) {
		this.dao = dao;
	}
	
	public PhotoService(){
	}

	public boolean createPhoto(Long userDailyKeywordId, String name){
		Photo p=new Photo();
		p.setUserDailyKeywordId(userDailyKeywordId);
		p.setName(name);
		return dao.insert(p);
	}

	public boolean insert(Photo p){
		return dao.insert(p);
	}

	public boolean update(Photo p){
		return dao.update(p);
	}

	public List<Photo> selectPhotosByUserDailyKeywordId(long userDailyKeywordId){
		return dao.selects("from Photo p where p.userDailyKeywordId=" + userDailyKeywordId);
	}
}
