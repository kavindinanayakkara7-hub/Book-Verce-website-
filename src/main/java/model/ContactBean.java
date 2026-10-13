package model;


public class ContactBean {


    private int id;
    private int user_id;
    private String name;
    private String email;
    private String subject;
    private String message;
    private String created_at;



    public int getId() {
        return id;
    }


    public void setId(int id) {
        this.id=id;
    }



    public int getUser_id() {
        return user_id;
    }


    public void setUser_id(int user_id) {
        this.user_id=user_id;
    }



    public String getName() {
        return name;
    }


    public void setName(String name) {
        this.name=name;
    }



    public String getEmail() {
        return email;
    }


    public void setEmail(String email) {
        this.email=email;
    }



    public String getSubject() {
        return subject;
    }


    public void setSubject(String subject) {
        this.subject=subject;
    }



    public String getMessage() {
        return message;
    }


    public void setMessage(String message) {
        this.message=message;
    }



    public String getCreated_at() {
        return created_at;
    }


    public void setCreated_at(String created_at) {
        this.created_at=created_at;
    }


}