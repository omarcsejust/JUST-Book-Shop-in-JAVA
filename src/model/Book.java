package model;
public class Book {
	private int bid;
	private String bName;
	private String bAuthor;
	private String bEdition;
	private float bPrice;
	private String bCategory;
	private String postDate;
	private String phnNum;
	private int uid;
	
	public Book(){}
	
	public Book(int bid, String bName, String bAuthor, String bEdition, float bPrice, String bCategory, String postDate,
			String phnNum, int uid) {
		super();
		this.bid = bid;
		this.bName = bName;
		this.bAuthor = bAuthor;
		this.bEdition = bEdition;
		this.bPrice = bPrice;
		this.bCategory = bCategory;
		this.postDate = postDate;
		this.phnNum = phnNum;
		this.uid = uid;
	}

	public Book(String bName, String bAuthor, String bEdition, float bPrice, String bCategory, String postDate,
			String phnNum, int uid) {
		super();
		this.bName = bName;
		this.bAuthor = bAuthor;
		this.bEdition = bEdition;
		this.bPrice = bPrice;
		this.bCategory = bCategory;
		this.postDate = postDate;
		this.phnNum = phnNum;
		this.uid = uid;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public String getbAuthor() {
		return bAuthor;
	}

	public void setbAuthor(String bAuthor) {
		this.bAuthor = bAuthor;
	}

	public String getbEdition() {
		return bEdition;
	}

	public void setbEdition(String bEdition) {
		this.bEdition = bEdition;
	}

	public float getbPrice() {
		return bPrice;
	}

	public void setbPrice(float bPrice) {
		this.bPrice = bPrice;
	}

	public String getbCategory() {
		return bCategory;
	}

	public void setbCategory(String bCategory) {
		this.bCategory = bCategory;
	}

	public String getPostDate() {
		return postDate;
	}

	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}
	
	public String getPhnNum() {
		return phnNum;
	}

	public void setPhnNum(String phnNum) {
		this.phnNum = phnNum;
	}

	@Override
	public String toString() {
		return "Book [bid=" + bid + ", bName=" + bName + ", bAuthor=" + bAuthor + ", bEdition=" + bEdition + ", bPrice="
				+ bPrice + ", bCategory=" + bCategory + ", postDate=" + postDate + ", uid=" + uid + "]";
	}
	
	
}
