package models;

// Applied Inheritance: CreditCardPayment extends Payment
public class CreditCardPayment extends Payment {
    private String cardNumber;
    private String cardHolderName;

    public CreditCardPayment(String paymentId, double amount, String date, String status, String cardNumber, String cardHolderName) {
        super(paymentId, amount, date, status);
        this.cardNumber = cardNumber;
        this.cardHolderName = cardHolderName;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getCardHolderName() {
        return cardHolderName;
    }

    public void setCardHolderName(String cardHolderName) {
        this.cardHolderName = cardHolderName;
    }

    // Format for file: PaymentId,Type,Amount,Date,Status,CardNumber,CardHolderName
    @Override
    public String toFileString() {
        return getPaymentId() + ",CC," + getAmount() + "," + getDate() + "," + getStatus() + "," + cardNumber + "," + cardHolderName;
    }

    // Applied Polymorphism: Overriding the abstract method
    @Override
    public String getPaymentDetails() {
        return "Credit Card ending in " + cardNumber.substring(Math.max(0, cardNumber.length() - 4)) + " (Holder: " + cardHolderName + ")";
    }
}
