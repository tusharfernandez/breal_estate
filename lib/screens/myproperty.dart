import 'package:flutter/material.dart';

class MyPropertyPage extends StatelessWidget {
  const MyPropertyPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AppBar-like Header with Back Button
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context); // Navigate back to the dashboard
                    },
                  ),
                  const Spacer(),
                  const Text(
                    'My Property',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const Spacer(), // Center the title
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            const SizedBox(height: 10),

            // Top Full-Sized Image
            AspectRatio(
              aspectRatio: 16 / 9, // Adjust aspect ratio to make the image fully visible
              child: Image.asset(
                'assets/images/house2.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // Property Details Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                color: Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      _buildDetailRow('Property:', 'Livingston Estates'),
                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 10),
                      _buildDescriptionRow(
                        'Description:',
                        'Delight in the ultimate lakefront lifestyle at Livingston Lakefront Estates.',
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 10),
                      _buildDetailRow('Plot Size:', '4,000 sqft'),
                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 10),
                      _buildDetailRow('Build-Up Size:', '8,000 sqft'),
                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 10),
                      _buildDetailRow('Annual Fees:', 'BHD 1600'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Bottom Blueprint Image
            AspectRatio(
              aspectRatio: 16 / 9, // Ensures full-width image with proper scaling
              child: Image.asset(
                'assets/dashboardimages/blueprint.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Helper method to create detail rows
  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  // Helper method to create description row
  Widget _buildDescriptionRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 16,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
