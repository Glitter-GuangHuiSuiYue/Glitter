package keyword.service;

import java.util.List;

import keyword.bean.UserDailyKeywords;
import keyword.dao.UserDailyKeywordsDao;

public class UserDailyKeywordsService {

	private UserDailyKeywordsDao dao;

	public UserDailyKeywordsDao getDao() {
		return dao;
	}

	public void setDao(UserDailyKeywordsDao dao) {
		this.dao = dao;
	}
	
	public UserDailyKeywordsService(){
	}

	public Long insert(UserDailyKeywords k){
		Long id = dao.insert(k);
		return id;
	}

	public boolean update(UserDailyKeywords k){
		return dao.update(k);
	}

	public List<UserDailyKeywords> selectAllDatesByUID(Long uid){
		return dao.selects("from UserDailyKeywords u where u.userId=" + uid + " order by u.date ");
	}

	public UserDailyKeywords selectById(Long id){
		return dao.select("from UserDailyKeywords u where u.id=" + id);
	}

	public List<UserDailyKeywords> selectAllDatesByUIDKID(Long uid, Long wid){
		return dao.selects("from UserDailyKeywords u where u.userId=" + uid + " and u.wordId = " + wid + " order by u.date");
	}

	public List<UserDailyKeywords> selectAllDatesByExcludedUIDKID(Long uid, Long wid){
		return dao.selects("from UserDailyKeywords u where u.userId!=" + uid + " and u.wordId = " + wid + " order by u.date");
	}

	public List<UserDailyKeywords> selectAllDatesByUIDLID(Long uid, Long lid){
		return dao.selects("from UserDailyKeywords u where u.userId=" + uid + " and u.locationId = " + lid + " order by u.date");
	}

	public List<UserDailyKeywords> selectAllDatesByUIDDate(Long uid, String date){
		return dao.selects("from UserDailyKeywords u where u.userId=" + uid + " and u.date = '" + date + "' order by u.id");
	}

	public List<UserDailyKeywords> selectAllDatesByUidKidLidDate(Long uid, Long wid, Long lid, String date){
		String sql = "from UserDailyKeywords u where u.userId=" + uid + " and u.wordId = " + wid +  "and u.locationId = " + lid;
		if (!date.equals("Please enter date")){
			sql += " and u.date like '" + date + "'";
		}
		sql += " order by u.date";
		return dao.selects(sql);
	}

	public List<UserDailyKeywords> selectAllDatesByExcludedUidKidLidDate(Long uid, Long wid, Long lid, String date){
		String sql = "from UserDailyKeywords u where u.userId!=" + uid + " and u.wordId = " + wid +  "and u.locationId = " + lid;
		if (!date.equals("Please enter date")){
			sql += " and u.date like '" + date + "'";
		}
		sql += " order by u.date";
		return dao.selects(sql);
	}
}
