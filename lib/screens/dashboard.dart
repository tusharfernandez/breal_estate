import 'package:flutter/material.dart';
import 'myinvoices.dart';
import 'myrequests.dart';
import 'myproperty.dart';
import 'offers.dart'; 
import 'bod.dart';
import 'myvoting.dart';
import 'documents.dart';
import 'announcement.dart';
import 'events.dart';
import 'news.dart';

class DashboardPage extends StatefulWidget {
  final String? username;

  const DashboardPage({Key? key, this.username}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final icons = [
      Icons.receipt_long,
      Icons.request_quote,
      Icons.home,
      Icons.folder,
      Icons.article,
      Icons.announcement,
      Icons.event,
      Icons.local_offer,
      Icons.how_to_vote,
      Icons.supervised_user_circle,
    ];
    final titles = [
      "My Invoices",
      "My Requests",
      "My Property",
      "Documents",
      "News",
      "Announcement",
      "Events",
      "Offers",
      "My Voting",
      "BOD",
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting Text
              Text(
                'Hello, ${widget.username ?? 'Guest'}',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              // Experience Modernity Section
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 200,
                  color: Colors.grey[200],
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/experiencemodernity.jpg', // Replace with your image path
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: const Text(
                          'Experience Modernity',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: const Icon(
                          Icons.arrow_forward,
                          size: 30,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Smaller Grid of buttons
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // 4 buttons per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1, // Square buttons
                ),
                itemCount: titles.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () {
                      _navigateToPage(index);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.zero, // Remove extra padding
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(icons[index], size: 20, color: Colors.white),
                        const SizedBox(height: 5),
                        Text(
                          titles[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              // News Section
              const Divider(color: Colors.grey, thickness: 1),
              const SizedBox(height: 10),
              const Text(
                'News',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // News Cards
              _buildNewsCard(
                'Future Real Estate',
                'Join industry leaders and professionals at our upcoming Real Estate Event to explore the latest trends.',
                'assets/news/newsimage.jpg',
              ),
              const SizedBox(height: 20),
              _buildNewsCard(
                'Global Real Estate Trends',
                'Discover key insights and upcoming opportunities in the real estate market globally.',
                'assets/news/news2.jpg',
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.request_quote),
            label: 'My Requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_work),
            label: 'My Property',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0: // My Invoices
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyInvoicesPage()),
        );
        break;
      case 1: // My Requests
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyRequestsPage()),
        );
        break;
      case 2: // My Property
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyPropertyPage()),
        );
        break;
      case 3: // Documents
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DocumentsPage()),
        );
        break;
      case 4: // News
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewsPage()),
        );
        break;
      case 5: // Announcements
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AnnouncementsPage()),
        );
        break;
      case 6: // Events
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EventsPage()),
        );
        break;
      case 7: // Offers
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OffersPage()),
        );
        break;
      case 8: // My Voting
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyVotingPage()),
        );
        break;
      case 9: // BOD
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BODPage()),
        );
        break;
      default:
        break;
    }
  }

  Widget _buildNewsCard(String title, String description, String imagePath) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            // Left side: Text information
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Your action on button press
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                      backgroundColor: Colors.orange,
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // Right side: Image with rounded corners
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 120,
                height: 120,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
