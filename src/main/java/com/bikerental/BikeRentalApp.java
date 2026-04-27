package com.bikerental;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import com.bikerental.model.Bike;
import com.bikerental.repository.BikeRepository;
import java.util.List;

@SpringBootApplication
public class BikeRentalApp {
    public static void main(String[] args) {
        SpringApplication.run(BikeRentalApp.class, args);
    }

    @Bean
    @SuppressWarnings("null")
    public CommandLineRunner seedData(BikeRepository bikeRepository) {
        return args -> {
            if (bikeRepository.count() == 0) {
                bikeRepository.saveAll(List.of(
                    new Bike("VoltGlide X1", "Electric", 12.0, "AVAILABLE", "Downtown Hub", "/images/electric_bike.png"),
                    new Bike("Summit Peak 500", "Mountain", 15.0, "AVAILABLE", "North Trail Head", "/images/mountain_bike.png"),
                    new Bike("Urban Breeze v2", "City", 8.0, "AVAILABLE", "City Center Park", "/images/city_bike.png"),
                    new Bike("Road Master Pro", "Road", 18.0, "AVAILABLE", "East Coastal Path", "/images/road_bike.png")
                ));
                System.out.println("Seeded initial bike data to Database.");
            }
        };
    }
}
