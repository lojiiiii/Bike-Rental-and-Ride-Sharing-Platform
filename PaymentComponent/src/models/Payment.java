package models;

// Applied Abstraction: Payment is an abstract class
public abstract class Payment {
    // Applied Encapsulation: Private attributes with public getters and setters
    private String paymentId;
    private double amount;
    private String date;
    private String status; // e.g., Pending, Completed, Failed

    public Payment(String paymentId, double amount, String date, String status) {
        this.paymentId = paymentId;
        this.amount = amount;
        this.date = date;
        this.status = status;
    }

    public String getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(String paymentId) {
        this.paymentId = paymentId;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    // Abstract method to format data for text file storage
    public abstract String toFileString();
    
    // Applied Polymorphism / Abstraction: Method to be overridden by subclasses
    public abstract String getPaymentDetails();
}
