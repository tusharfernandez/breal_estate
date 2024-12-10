import 'package:flutter/material.dart';

class InvoiceDetailsPage extends StatefulWidget {
  final String invoiceNumber;
  final String amount;
  final String date;
  final String documentLink;

  const InvoiceDetailsPage({
    Key? key,
    required this.invoiceNumber,
    required this.amount,
    required this.date,
    required this.documentLink,
  }) : super(key: key);

  @override
  _InvoiceDetailsPageState createState() => _InvoiceDetailsPageState();
}

class _InvoiceDetailsPageState extends State<InvoiceDetailsPage> {
  String selectedPaymentMethod = ''; // Initially, no payment method selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice Details'),
        centerTitle: true, // Center the title
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(  // Wrap in SingleChildScrollView to handle overflow
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Invoice No and Date (Top section)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Invoice No: ${widget.invoiceNumber}', style: TextStyle(fontSize: 16)),
                  Text('Date: ${widget.date}', style: TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.grey),
              const SizedBox(height: 20),

              // Payment Method Section
              Text('Payment Method', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),

              // Payment method cards with individual selections
              paymentMethodCard('Apple Pay', 'assets/invoice/apple.jpg', 'Apple Pay', Colors.black, 'Apple Pay'),
              paymentMethodCard('VISA', 'assets/invoice/VISA.jpg', 'xxxx-8899', Colors.grey, 'VISA 8899'),
              paymentMethodCard('VISA', 'assets/invoice/VISA.jpg', 'xxxx-6353', Colors.grey, 'VISA 6353'),
              paymentMethodCard('Benefit', 'assets/invoice/Benefit.jpg', 'Benefit', Colors.blue, 'Benefit'),
              paymentMethodCard('Add New Card', 'assets/invoice/plus.jpg', 'Add New Card', Colors.grey, 'Add New Card'),

              const SizedBox(height: 30),

              // Payment Summary
              Text('Payment Summary', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),

              // Subtotal, VAT, Total Amount
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Subtotal', style: TextStyle(fontSize: 14)),
                  Text('BD 3.000', style: TextStyle(fontSize: 14)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('VAT', style: TextStyle(fontSize: 14)),
                  Text('BD 0.390', style: TextStyle(fontSize: 14)),
                ],
              ),
              const Divider(color: Colors.black),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Amount', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('BD ${3.000 + 0.390}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 20),

              // Payment button at the bottom
              if (selectedPaymentMethod.isNotEmpty && selectedPaymentMethod != 'Add New Card')
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: selectedPaymentMethod == 'Apple Pay'
                        ? Colors.black
                        : selectedPaymentMethod == 'VISA 8899' || selectedPaymentMethod == 'VISA 6353'
                            ? Colors.blue
                            : selectedPaymentMethod == 'Benefit'
                                ? Colors.green
                                : Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Pay with $selectedPaymentMethod',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentMethodCard(String title, String imagePath, String cardNumber, Color color, String paymentMethod) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPaymentMethod = paymentMethod; // Change payment method when tapped
        });
      },
      child: Card(
        color: Colors.grey.withOpacity(0.1), // Simple gray color for the card
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Icon for the payment method (circular)
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(imagePath), // Load the image from the assets
                  ),
                  const SizedBox(width: 10),
                  Text(paymentMethod == 'Add New Card' ? title : cardNumber, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              if (paymentMethod != 'Add New Card')
                CircleAvatar(
                  radius: 12,
                  backgroundColor: selectedPaymentMethod == paymentMethod
                      ? Colors.black
                      : Colors.transparent,
                ),
              if (paymentMethod == 'Benefit') // Display message inside the Benefit card
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'You will be forwarded to Benefit to complete this transaction',
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.end,
                        maxLines: 2, // Allow the message to take up two lines if needed
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
