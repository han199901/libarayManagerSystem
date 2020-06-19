package com.library.pojo;

public class BookType {
    private int id;
    private String name;
    private int type_index;

    @Override
    public String toString() {
        return "BookType{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", type_index=" + type_index +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getType_index() {
        return type_index;
    }

    public void setType_index(int type_index) {
        this.type_index = type_index;
    }

}
