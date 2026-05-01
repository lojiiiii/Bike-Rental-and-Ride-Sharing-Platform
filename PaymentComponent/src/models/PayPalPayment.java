package models;

// Applied Inheritance: PayPalPayment extends Payment
public class PayPalPayment extends Payment {
    private String paypalEmail;

    public PayPalPayment(String paymentId, double amount, String date, String status, String paypalEmail) {
        super(paymentId, amount, date, status);
        this.paypalEmail = paypalEmail;
    }

    public String getPaypalEmail() {
        return paypalEmail;
    }

    public void setPaypalEmail(String paypalEmail) {
        this.paypalEmail = paypalEmail;
    }

    // Format for file: PaymentId,Type,Amount,Date,Status,PayPalEmail
    @Override
    public String toFileString() {
        return getPaymentId() + ",PAYPAL," + getAmount() + "," + getDate() + "," + getStatus() + "," + paypalEmail;
    }

    // Applied Polymorphism: Overriding the abstract method
    @Override
    public String getPaymentDetails() {
        return "PayPal Account: " + paypalEmail;
    }
}
