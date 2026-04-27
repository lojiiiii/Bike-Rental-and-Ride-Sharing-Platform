package com.bikerental.model;

import jakarta.persistence.*;

@Entity
@Table(name = "bikes")
public class Bike {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String type; // e.g., Electric, Mountain, Road, City
    private double pricePerHour;
    private String status; // AVAILABLE, RENTED, MAINTENANCE
    private String location;
    private String imagePath;

    public Bike() {}

    public Bike(String name, String type, double pricePerHour, String status, String location, String imagePath) {
        this.name = name;
        this.type = type;
        this.pricePerHour = pricePerHour;
        this.status = status;
        this.location = location;
        this.imagePath = imagePath;
    }

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public double getPricePerHour() { return pricePerHour; }
    public void setPricePerHour(double pricePerHour) { this.pricePerHour = pricePerHour; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public String getImagePath() { return imagePath; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath; }
}
