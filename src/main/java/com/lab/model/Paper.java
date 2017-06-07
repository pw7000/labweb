package com.lab.model;

public class Paper {
	private Integer id;
	private String paperName;
	private String paperAuthors;
	private String publication;
	private String href;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPaperName() {
		return paperName;
	}
	public void setPaperName(String paperName) {
		this.paperName = paperName;
	}
	public String getPaperAuthors() {
		return paperAuthors;
	}
	public void setPaperAuthors(String paperAuthors) {
		this.paperAuthors = paperAuthors;
	}
	public String getPublication() {
		return publication;
	}
	public void setPublication(String publication) {
		this.publication = publication;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	
	
}
