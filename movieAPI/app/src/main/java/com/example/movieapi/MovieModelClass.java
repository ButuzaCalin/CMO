package com.example.movieapi;

public class MovieModelClass {

    String id;
    String name;
    String img;
    String identificare;


    public MovieModelClass(String id, String name, String img, String identificare) {
        this.id = id;
        this.name = name;
        this.img = img;
        this.identificare = identificare;
    }

    public MovieModelClass() {
    }

    public String getIdentificare() {
        return identificare;
    }

    public void setIdentificare(String identificare) {
        this.identificare = identificare;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}


