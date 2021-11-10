package fr.dauphine.heal.util;

import java.util.Date;

public class EnregCalen {
	private String id;
	private String title;
	private Date start;
	private String backgroundColor;

	public String getId() {
		return id;
	}

	@Override
	public String toString() {
		return "EnregistrementCalendrier [id=" + id + ", title=" + title + ", start=" + start + ", backgroundColor="
				+ backgroundColor + "]";
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public String getBackgroundColor() {
		return backgroundColor;
	}

	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}
}
