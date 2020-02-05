package com.lec.beans;

public class WriteDTO {

		// 데이터 베이스의 필드
		// co_uid / co_star / co_content / co_name / co_regdate / use_uid / sh_uid / co_title
	private int uid;
	private int star;
	private String content;
	private String name;
	private String regDate;
	private int use_uid;
	private int sh_uid;
	private String title;

	@Override
	public String toString() {
		// 디버깅 테스트용
		return "WriteDTO ]]" + uid + " : "  + star +" : "
				+ content + " : " +name + " : "+ use_uid + " : " + sh_uid + " : "+ title + " : " + regDate;
	}

	public WriteDTO() {
		super();
	}

	public WriteDTO(int uid, int star, String content, String name, String regDate, int use_uid, int sh_uid,
			String co_title) {
		super();
		this.uid = uid;
		this.star = star;
		this.content = content;
		this.name = name;
		this.regDate = regDate;
		this.use_uid = use_uid;
		this.sh_uid = sh_uid;
		this.title = co_title;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getUse_uid() {
		return use_uid;
	}

	public void setUse_uid(int use_uid) {
		this.use_uid = use_uid;
	}

	public int getSh_uid() {
		return sh_uid;
	}

	public void setSh_uid(int sh_uid) {
		this.sh_uid = sh_uid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String co_title) {
		this.title = co_title;
	}
	
}
