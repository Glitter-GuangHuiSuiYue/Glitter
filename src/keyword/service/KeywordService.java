package keyword.service;

import java.util.List;

import keyword.bean.Keyword;
import keyword.dao.KeywordDao;


public class KeywordService {
	private KeywordDao dao;

	public KeywordDao getDao() {
		return dao;
	}

	public void setDao(KeywordDao dao) {
		this.dao = dao;
	}
	
	public KeywordService(){
	}

	public Long createKeyword(String word){
		Keyword k=new Keyword();
		k.setWord(word);
		return dao.insert(k);
	}

	public Long insert(Keyword k){
		Long id = dao.insert(k);
		return id;
	}

	public boolean update(Keyword k){
		return dao.update(k);
	}

	/*public List<Keyword> selectAllKeywordsByUID(long uid){
		return dao.selects("from Keyword k where k.id="+uid);
	}*/

	public List<Keyword> selectKeywordByID(long id){
		return dao.selects("from Keyword k where k.id=" + id);
	}

	public Keyword selectKeywordByWord(String word){
		List<Keyword> list = dao.selects("from Keyword k where k.word='" + word + "'");
		if (list == null || list.size() == 0){
			return null;
		}
		return list.get(0);
	}

	public List<Keyword> selectKeywordsContainsWord(String word){
		String sql = "from Keyword k";
		if (!word.equals("Please enter keyword")){
			sql += " where k.word like '%" + word + "%'";
		}
		List<Keyword> list = dao.selects( sql );
		return list;
	}
}
