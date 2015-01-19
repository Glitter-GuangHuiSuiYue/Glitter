package keyword.bean;

import java.util.Date;

public class Comment {
	private Long id;
	private Long userId;
	private Long userDailyKeywordId;
	private Integer isGood;
	private String comment;
	private Date date;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public Long getUserDailyKeywordId() {
		return userDailyKeywordId;
	}
	public void setUserDailyKeywordId(Long userDailyKeywordId) {
		this.userDailyKeywordId = userDailyKeywordId;
	}
	public Integer getIsGood() {
		return isGood;
	}
	public void setIsGood(Integer isGood) {
		this.isGood = isGood;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
}
