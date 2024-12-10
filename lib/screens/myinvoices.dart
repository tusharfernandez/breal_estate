import 'package:flutter/material.dart';
import 'invoice_details.dart'; // Import the InvoiceDetailsPage

class MyInvoicesPage extends StatelessWidget {
  const MyInvoicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Invoices'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Invoice Card 1
            invoiceCard(
              context,
              invoiceNumber: '000003',
              amount: 'BD500',
              date: '12 Jun, 2024',
              documentLink: 'assets/invoicepdf/sample2invoice', // Replace with actual link or URL to the document
              status: 'Pending',
            ),
            const SizedBox(height: 20),
            // Invoice Card 2
            invoiceCard(
              context,
              invoiceNumber: '000004',
              amount: 'BD600',
              date: '15 Jul, 2024',
              documentLink: 'assets/invoicepdf/sampleinvoice.pdf', // Replace with actual link or URL to the document
              status: 'Paid',
            ),
            const SizedBox(height: 20),
            // Invoice Card 3
            invoiceCard(
              context,
              invoiceNumber: '000005',
              amount: 'BD450',
              date: '01 Aug, 2024',
              documentLink: 'assets/invoicepdf/sample.pdf', // Replace with actual link or URL to the document
              status: 'Paid',
            ),
          ],
        ),
      ),
    );
  }

  Widget invoiceCard(BuildContext context,
      {required String invoiceNumber,
      required String amount,
      required String date,
      required String documentLink,
      required String status}) {
    return Card(
      color: Colors.grey[200],
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Invoice Number & Date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Invoice No: $invoiceNumber'),
                Text(date),
              ],
            ),
            const Divider(),
            // Amount & Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Amount: $amount'),
                Column(
                  children: [
                    Text('Status: $status'),
                    // Make the orange dot clickable to navigate
                    status == 'Pending'
                        ? GestureDetector(
                            onTap: () {
                              // Navigate to InvoiceDetailsPage
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InvoiceDetailsPage(
                                    invoiceNumber: invoiceNumber,
                                    amount: amount,
                                    date: date,
                                    documentLink: documentLink,
                                  ),
                                ),
                              );
                            },
                            child: TileIndicator(color: Colors.orange),
                          )
                        : TileIndicator(color: Colors.green),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Document Button (only for Paid invoices)
            if (status == 'Paid')
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to InvoiceDetailsPage for Paid invoices
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InvoiceDetailsPage(
                            invoiceNumber: invoiceNumber,
                            amount: amount,
                            date: date,
                            documentLink: documentLink,
                          ),
                        ),
                      );
                    },
                    child: const Text('Open PDF'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class TileIndicator extends StatelessWidget {
  final Color color;

  const TileIndicator({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 10,
      backgroundColor: color,
    );
  }
}
