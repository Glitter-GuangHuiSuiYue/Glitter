package keyword.bean;

public class Photo {
	private Long id;
	private Long userDailyKeywordId;
	private String name;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getUserDailyKeywordId() {
		return userDailyKeywordId;
	}
	public void setUserDailyKeywordId(Long userDailyKeywordId) {
		this.userDailyKeywordId = userDailyKeywordId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
