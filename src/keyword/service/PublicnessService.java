package keyword.service;

import keyword.bean.Publicness;
import keyword.dao.PublicnessDao;


public class PublicnessService {
	private PublicnessDao dao;

	public PublicnessDao getDao() {
		return dao;
	}

	public void setDao(PublicnessDao dao) {
		this.dao = dao;
	}
	
	public PublicnessService(){
	}

	public boolean createPublicness(Long userDailyKeywordId, Integer publicness, Integer price){
		Publicness p=new Publicness();
		p.setUserDailyKeywordId(userDailyKeywordId);
		p.setPublicness(publicness);
		p.setPrice(price);
		return dao.insert(p);
	}

	public boolean insert(Publicness p){
		return dao.insert(p);
	}

	public boolean update(Publicness p){
		return dao.update(p);
	}

	public Publicness selectPublicnesssByUserDailyKeywordId(long userDailyKeywordId){
		return dao.selects("from Publicness p where p.userDailyKeywordId=" + userDailyKeywordId).get(0);
	}
}
