package model;

import java.sql.Date;

public class AnnouncementBean {

    private int id;
    private String title;
    private String message;
    private Date publishDate;

    public AnnouncementBean() {
    }

    public AnnouncementBean(int id, String title, String message, Date publishDate) {
        this.id = id;
        this.title = title;
        this.message = message;
        this.publishDate = publishDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }
}