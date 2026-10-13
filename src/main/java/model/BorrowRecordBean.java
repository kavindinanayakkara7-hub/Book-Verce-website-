package model;


public class BorrowRecordBean {


    private int id;

    private int user_id;

    private int book_id;

    private String username;

    private String book_title;

    private String borrow_date;

    private String due_date;

    private String return_date;

    private String status;



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



    public String getUsername() {
        return username;
    }


    public void setUsername(String username) {
        this.username = username;
    }



    public String getBook_title() {
        return book_title;
    }


    public void setBook_title(String book_title) {
        this.book_title = book_title;
    }



    public String getBorrow_date() {
        return borrow_date;
    }


    public void setBorrow_date(String borrow_date) {
        this.borrow_date = borrow_date;
    }



    public String getDue_date() {
        return due_date;
    }


    public void setDue_date(String due_date) {
        this.due_date = due_date;
    }



    public String getReturn_date() {
        return return_date;
    }


    public void setReturn_date(String return_date) {
        this.return_date = return_date;
    }



    public String getStatus() {
        return status;
    }


    public void setStatus(String status) {
        this.status = status;
    }


}