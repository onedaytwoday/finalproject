package com.project.one.model.dto;

public class RankDto {

	private int rank_no;
	private String rank_name;
	
	public RankDto() {
	}

	public RankDto(int rank_no, String rank_name) {
		super();
		this.rank_no = rank_no;
		this.rank_name = rank_name;
	}

	public int getRank_no() {
		return rank_no;
	}

	public void setRank_no(int rank_no) {
		this.rank_no = rank_no;
	}

	public String getRank_name() {
		return rank_name;
	}

	public void setRank_name(String rank_name) {
		this.rank_name = rank_name;
	}

	@Override
	public String toString() {
		return "RankDto [rank_no=" + rank_no + ", rank_name=" + rank_name + "]";
	}
	
}
