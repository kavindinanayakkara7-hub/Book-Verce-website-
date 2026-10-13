package model;


public class ContactReplyBean {


    private int id;

    private int contact_id;

    private String admin_reply;

    private String reply_date;



    public int getId() {
        return id;
    }


    public void setId(int id) {
        this.id=id;
    }



    public int getContact_id() {
        return contact_id;
    }


    public void setContact_id(int contact_id) {
        this.contact_id=contact_id;
    }



    public String getAdmin_reply() {
        return admin_reply;
    }


    public void setAdmin_reply(String admin_reply) {
        this.admin_reply=admin_reply;
    }



    public String getReply_date() {
        return reply_date;
    }


    public void setReply_date(String reply_date) {
        this.reply_date=reply_date;
    }


}