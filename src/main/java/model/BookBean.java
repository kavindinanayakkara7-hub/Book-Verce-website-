package model;


public class BookBean {


    private int id;
    private String title;
    private String isbn;

    private int category_id;
    private int author_id;
    private int publisher_id;

    private int publish_year;

    private String description;

    private int quantity;
    private int available;

    private String image;

    private String status;



    public BookBean(){

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


    public String getIsbn() {
        return isbn;
    }


    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }


    public int getCategory_id() {
        return category_id;
    }


    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }


    public int getAuthor_id() {
        return author_id;
    }


    public void setAuthor_id(int author_id) {
        this.author_id = author_id;
    }


    public int getPublisher_id() {
        return publisher_id;
    }


    public void setPublisher_id(int publisher_id) {
        this.publisher_id = publisher_id;
    }


    public int getPublish_year() {
        return publish_year;
    }


    public void setPublish_year(int publish_year) {
        this.publish_year = publish_year;
    }


    public String getDescription() {
        return description;
    }


    public void setDescription(String description) {
        this.description = description;
    }


    public int getQuantity() {
        return quantity;
    }


    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }


    public int getAvailable() {
        return available;
    }


    public void setAvailable(int available) {
        this.available = available;
    }


    public String getImage() {
        return image;
    }


    public void setImage(String image) {
        this.image = image;
    }


    public String getStatus() {
        return status;
    }


    public void setStatus(String status) {
        this.status = status;
    }


}