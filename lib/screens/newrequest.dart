import 'package:flutter/material.dart';

class NewRequestPage extends StatelessWidget {
  const NewRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Requests',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0, // Removes shadow
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thin line separator
            const Divider(color: Colors.grey, thickness: 1),
            const SizedBox(height: 10),
            // Search bar
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search for a service',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Grid of cards
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // Two columns
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  // Card 1
                  _buildRequestCard(
                    icon: Icons.home,
                    label: 'Landscaping and Architectural Change (LAC)',
                  ),
                  // Card 2
                  _buildRequestCard(
                    icon: Icons.local_shipping,
                    label: 'Contractors Gate Pass Permit',
                  ),
                  // Card 3
                  _buildRequestCard(
                    icon: Icons.directions_car,
                    label: 'Residents Vehicles Access',
                  ),
                  // Card 4
                  _buildRequestCard(
                    icon: Icons.celebration,
                    label: 'Event Request Form',
                  ),
                  // Card 5
                  _buildRequestCard(
                    icon: Icons.park,
                    label: 'Planting in Common Areas',
                  ),
                  // Card 6
                  _buildRequestCard(
                    icon: Icons.badge,
                    label: 'Domestic Workers ID Issuance',
                  ),
                  // Card 7
                  _buildRequestCard(
                    icon: Icons.description,
                    label: 'Non Objection Certificate (NOC)',
                  ),
                  // Card 8
                  _buildRequestCard(
                    icon: Icons.edit_document,
                    label: 'As Built Drawing Requests',
                  ),
                  // Card 9
                  _buildRequestCard(
                    icon: Icons.message,
                    label: 'Contact Details Update',
                  ),
                  // Card 10
                  _buildRequestCard(
                    icon: Icons.business,
                    label: 'Tenant Contact Details',
                  ),
                  // Card 11
                  _buildRequestCard(
                    icon: Icons.person_pin,
                    label: 'Request to Meet the Board of Directors',
                  ),
                  // Card 12
                  _buildRequestCard(
                    icon: Icons.info,
                    label: 'Suggestion or Complaint',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestCard({required IconData icon, required String label}) {
    return Card(
      color: Colors.grey[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.brown, size: 40),
            const SizedBox(height: 10),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle apply button press
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Apply'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: NewRequestPage()));
