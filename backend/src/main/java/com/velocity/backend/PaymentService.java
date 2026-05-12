package com.velocity.backend;

import org.springframework.stereotype.Service;
import java.io.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class PaymentService {
    private final String FILE_PATH = "payments.txt";

    public List<Payment> getAllPayments() {
        List<Payment> payments = new ArrayList<>();
        File file = new File(FILE_PATH);
        if (!file.exists()) return payments;

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts.length >= 6) {
                    payments.add(new Payment(parts[0], parts[1], Double.parseDouble(parts[2]), parts[3], parts[4], parts[5]));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return payments;
    }

    public Payment processPayment(Payment payment) {
        payment.setTransactionId("TXN-" + UUID.randomUUID().toString().substring(0, 5).toUpperCase());
        payment.setTimestamp(LocalDateTime.now().toString());
        payment.setStatus("SUCCESS");
        List<Payment> payments = getAllPayments();
        payments.add(payment);
        saveAllPayments(payments);
        return payment;
    }

    private void saveAllPayments(List<Payment> payments) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Payment p : payments) {
                bw.write(String.format("%s|%s|%.2f|%s|%s|%s", 
                    p.getTransactionId(), p.getUserEmail(), p.getAmount(), p.getStatus(), p.getTimestamp(), p.getMethod()));
                bw.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
