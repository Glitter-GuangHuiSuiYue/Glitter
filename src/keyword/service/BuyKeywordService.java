package keyword.service;

import java.util.List;

import keyword.bean.BuyKeyword;
import keyword.dao.BuyKeywordDao;

public class BuyKeywordService {
	private BuyKeywordDao dao;

	public BuyKeywordDao getDao() {
		return dao;
	}

	public void setDao(BuyKeywordDao dao) {
		this.dao = dao;
	}
	
	public BuyKeywordService(){
	}

	public Long buy(Long userId, Long userDailyKeywordId){
		BuyKeyword b=new BuyKeyword();
		b.setUserDailyKeywordId(userDailyKeywordId);
		b.setUserId(userId);
		return dao.insert(b);
	}

	public Long insert(BuyKeyword b){
		Long id = dao.insert(b);
		return id;
	}

	public boolean update(BuyKeyword b){
		return dao.update(b);
	}

	public BuyKeyword selectBuyKeywordByID(long id){
		List<BuyKeyword> result = dao.selects("from BuyKeyword b where b.id=" + id);
		return result.get(0);
	}

	public Boolean hasUserBought(Long userId, Long userDailyKeywordId){
		List<BuyKeyword> result = dao.selects("from BuyKeyword b where b.userId='" + userId+"' and b.userDailyKeywordId='" + userDailyKeywordId + "'");
		return (result == null || result.size() == 0) ? false : true;
	}
}
