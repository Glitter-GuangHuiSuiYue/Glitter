package keyword.bean;

public class Publicness {
	private Long id;
	private Long userDailyKeywordId;
	private Integer publicness;
	private Integer price;
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
	public Integer getPublicness() {
		return publicness;
	}
	public void setPublicness(Integer publicness) {
		this.publicness = publicness;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
}
