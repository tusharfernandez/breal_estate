import 'package:flutter/material.dart';
import 'newrequest.dart'; // This should be the file for the new request page
import 'dashboard.dart'; // Import dashboard to navigate back

class MyRequestsPage extends StatelessWidget {
  const MyRequestsPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Requests',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0, // Removes shadow
        centerTitle: true, // Centers the title
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const DashboardPage(), // Navigate to DashboardPage
              ),
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NewRequestPage()),
              );
            },
            child: const Text(
              '+ New',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            // Card 1
            RequestCard(
              requestNo: '0002',
              requestDate: '12 Jun, 2024',
              requestTime: '17:00 PM',
              requestType: 'Pest Control',
              description:
                  'Ensure a Safe and Pest-Free Environment for Your Tenants by Submitting a Pest Control Request Through our Mobile App. Schedule Inspections, Track Service Progress, and Receive Real-Time Updates All in One Place.',
              status: 'In Progress',
            ),
            const SizedBox(height: 20),
            // Card 2
            RequestCard(
              requestNo: '0003',
              requestDate: '14 Jun, 2024',
              requestTime: '10:00 AM',
              requestType: 'Plumbing',
              description:
                  'Fix the Plumbing Issues to Ensure Smooth Water Flow for the Residents. Schedule the Inspection and Track Progress.',
              status: 'Completed',
            ),
            const SizedBox(height: 20),
            // Card 3
            RequestCard(
              requestNo: '0004',
              requestDate: '15 Jun, 2024',
              requestTime: '12:00 PM',
              requestType: 'Electrical',
              description:
                  'Fixing the Electrical Wiring Issues to Ensure the Safety of the Property. Track the Request Progress in Real-Time.',
              status: 'Submitted',
            ),
            const SizedBox(height: 20),
            // Card 4
            RequestCard(
              requestNo: '0005',
              requestDate: '20 Jun, 2024',
              requestTime: '14:00 PM',
              requestType: 'Maintenance',
              description:
                  'Request for general maintenance to ensure a smooth living experience for all residents.',
              status: 'Rejected',
            ),
          ],
        ),
      ),
    );
  }
}

class RequestCard extends StatelessWidget {
  final String requestNo;
  final String requestDate;
  final String requestTime;
  final String requestType;
  final String description;
  final String status;

  const RequestCard({
    required this.requestNo,
    required this.requestDate,
    required this.requestTime,
    required this.requestType,
    required this.description,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Request Number and Date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Request No: $requestNo'),
                Text('$requestDate $requestTime'),
              ],
            ),
            const SizedBox(height: 10),
            // Request Type
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Request Type:'),
                Text(
                  requestType,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Status (Customized for "Rejected")
            status == 'Rejected'
                ? Center(
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: const Center(
                            child: Text(
                              'Rejected',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  )
                : ProgressBar(status: status),
            const SizedBox(height: 10),
            // Description
            Text(
              description,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  final String status;

  const ProgressBar({required this.status});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildProgressPoint('Submitted', status == 'Submitted'),
        _buildProgressPoint('In Progress', status == 'In Progress'),
        _buildProgressPoint('Completed', status == 'Completed'),
      ],
    );
  }

  Widget _buildProgressPoint(String label, bool isActive) {
    return Column(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? Colors.orange : Colors.grey,
            border: Border.all(color: Colors.black),
          ),
          child: isActive
              ? label == 'Completed'
                  ? const Icon(
                      Icons.radio_button_checked,
                      size: 15,
                      color: Colors.orange,
                    )
                  : const Icon(
                      Icons.check,
                      size: 15,
                      color: Colors.white,
                    )
              : const SizedBox.shrink(),
        ),
        const SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}

