package com.velocity.backend;

public class Payment {
    private String transactionId;
    private String userEmail;
    private double amount;
    private String status; // SUCCESS, PENDING, FAILED
    private String timestamp;
    private String method; // CARD, WALLET

    public Payment() {}

    public Payment(String transactionId, String userEmail, double amount, String status, String timestamp, String method) {
        this.transactionId = transactionId;
        this.userEmail = userEmail;
        this.amount = amount;
        this.status = status;
        this.timestamp = timestamp;
        this.method = method;
    }

    // Getters and Setters
    public String getTransactionId() { return transactionId; }
    public void setTransactionId(String transactionId) { this.transactionId = transactionId; }
    public String getUserEmail() { return userEmail; }
    public void setUserEmail(String userEmail) { this.userEmail = userEmail; }
    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getTimestamp() { return timestamp; }
    public void setTimestamp(String timestamp) { this.timestamp = timestamp; }
    public String getMethod() { return method; }
    public void setMethod(String method) { this.method = method; }
}
