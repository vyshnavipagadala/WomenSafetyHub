package com.womensafety.model;

public class SafeZone {

    private int id;
    private String type;
    private String location;
    private String phone;
    private double latitude;
    private double longitude;

    public SafeZone() {
    }

    public SafeZone(int id, String type, String location,
                    String phone, double latitude, double longitude) {

        this.id = id;
        this.type = type;
        this.location = location;
        this.phone = phone;
        this.latitude = latitude;
        this.longitude = longitude;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }
}