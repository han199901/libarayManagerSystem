package com.library.pojo;

import java.sql.Date;

public class Books {
    private int id;
    private int index;
    private String name;
    private String description;
    private String author;
    private int ISBN;
    private String type_index;
    private Date entry_time;
    private int status;
    private String publish;
    private int like;
    private String locate;
    private int price;
    private Date ruin_time;

    public String getDescription() { return description; }

    public String getAuthor() { return author; }

    public int getISBN() { return ISBN; }

    public String getType_index() { return type_index; }

    public Date getEntry_time() { return entry_time; }

    public int getStatus() { return status; }

    public String getPublish() { return publish; }

    public int getLike() { return like; }

    public String getLocate() { return locate; }

    public int getPrice() { return price; }

    public Date getRuin_time() { return ruin_time; }

    public int getId() { return id; }

    public int getIndex() { return index; }

    public String getName() {
        return name;
    }

    public void setId(int id) { this.id = id; }

    public void setIndex(int index) { this.index = index; }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) { this.description = description; }

    public void setAuthor(String author) { this.author = author; }

    public void setISBN(int ISBN) { this.ISBN = ISBN; }

    public void setType_index(String type_index) { this.type_index = type_index; }

    public void setEntry_time(Date entry_time) { this.entry_time = entry_time; }

    public void setStatus(int status) { this.status = status; }

    public void setPublish(String publish) { this.publish = publish; }

    public void setLike(int like) { this.like = like; }

    public void setLocate(String locate) { this.locate = locate; }

    public void setPrice(int price) { this.price = price; }

    public void setRuin_time(Date ruin_time) { this.ruin_time = ruin_time; }
}
