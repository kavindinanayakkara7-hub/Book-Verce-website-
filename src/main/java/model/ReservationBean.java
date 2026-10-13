package model;

import java.sql.Date;

public class ReservationBean {

    private int id;
    private int user_id;
    private int book_id;
    private Date reserve_date;
    private String status;

    private String bookTitle;

    private String bookImage;

    public String getBookImage() {
        return bookImage;
    }

    public void setBookImage(String bookImage) {
        this.bookImage = bookImage;
    }

    public String getBookTitle() {
        return bookTitle;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }


    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }


    public Date getReserve_date() {
        return reserve_date;
    }

    public void setReserve_date(Date reserve_date) {
        this.reserve_date = reserve_date;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}