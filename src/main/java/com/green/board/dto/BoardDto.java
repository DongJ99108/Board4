package com.green.board.dto;

public class BoardDto {
	// Fields
	private int idx;
	private String menu_;
	private String title;
	private String writer;
	private String regdate;
	private int hit;
	// Constructor
	public BoardDto() {}
	public BoardDto(int idx, String menu_, String title, String writer, String regdate, int hit) {
		this.idx = idx;
		this.menu_ = menu_;
		this.title = title;
		this.writer = writer;
		this.regdate = regdate;
		this.hit = hit;
	}
	// Getter / Setter : 필수 - MyBatis에서 사용함 #{idx} : getIdx(), setIdx()로 작동
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMenu_() {
		return menu_;
	}
	public void setMenu_(String menu_) {
		this.menu_ = menu_;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	// ToString
	@Override
	public String toString() {
		return "BoardDto [idx=" + idx + ", menu_=" + menu_ + ", title=" + title + ", writer=" + writer + ", regdate="
				+ regdate + ", hit=" + hit + "]";
	}
	
} // class end
