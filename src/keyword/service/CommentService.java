package keyword.service;

import java.util.Date;
import java.util.List;

import keyword.bean.Comment;
import keyword.dao.CommentDao;


public class CommentService {
	private CommentDao dao;

	public CommentDao getDao() {
		return dao;
	}

	public void setDao(CommentDao dao) {
		this.dao = dao;
	}
	
	public CommentService(){
	}

	public boolean createComment(Long userId, Long userDailyKeywordId, Integer isGood, String comment, Date date){
		Comment c=new Comment();
		c.setComment(comment);
		c.setIsGood(isGood);
		c.setUserDailyKeywordId(userDailyKeywordId);
		c.setDate(date);
		c.setUserId(userId);
		return dao.insert(c);
	}

	public boolean insert(Comment c){
		return dao.insert(c);
	}

	public boolean update(Comment c){
		return dao.update(c);
	}

	public List<Comment> selectCommentsByUserDailyKeywordId(long userDailyKeywordId){
		return dao.selects("from Comment c where c.userDailyKeywordId=" + userDailyKeywordId);
	}
}
