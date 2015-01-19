package keyword.service;

import keyword.bean.Story;
import keyword.dao.StoryDao;


public class StoryService {
	private StoryDao dao;

	public StoryDao getDao() {
		return dao;
	}

	public void setDao(StoryDao dao) {
		this.dao = dao;
	}
	
	public StoryService(){
	}

	public boolean createStory(Long userDailyKeywordId, String story){
		Story k=new Story();
		k.setUserDailyKeywordId(userDailyKeywordId);
		k.setStory(story);
		return dao.insert(k);
	}

	public boolean insert(Story s){
		return dao.insert(s);
	}

	public boolean update(Story s){
		return dao.update(s);
	}

	public Story selectStoryByUserDailyKeywordId(long userDailyKeywordId){
		return dao.select("from Story s where s.userDailyKeywordId=" + userDailyKeywordId);
	}
}
