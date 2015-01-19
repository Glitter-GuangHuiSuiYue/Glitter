package keyword.bean;

public class Story {
	private Long id;
	private Long userDailyKeywordId;
	private String story;
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
	public String getStory() {
		return story;
	}
	public void setStory(String story) {
		this.story = story;
	}
}
