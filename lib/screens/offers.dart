import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key,);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Offers Page',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const OffersPage(),
    );
  }
}

class OffersPage extends StatelessWidget {
 const OffersPage({Key? key}) : super(key: key,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offers'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          OfferCard(
            imagePath: 'assets/dashboardimages/coffee.jpg', // Replace with your image asset path
            title: 'Exclusive 30% Discount in X Coffee shop',
            description: 'Treat yourself and collect more points while you’re at it.',
          ),
          const SizedBox(height: 16),
          OfferCard(
            imagePath: 'assets/dashboardimages/restaurantinterior.jpg', // Replace with your image asset path
            title: 'Discover today’s top deals.',
            description: 'Treat yourself and collect more points while you’re at it.',
          ),
          const SizedBox(height: 16),
          OfferCard(
            imagePath: 'assets/dashboardimages/gym.jpg', // Replace with your image asset path
            title: '50% Off on Premium Gym Membership',
            description: 'Get fit and save big with our exclusive fitness offers.',
          ),
          const SizedBox(height: 16),
          OfferCard(
            imagePath: 'assets/dashboardimages/spa.jpg', // Replace with your image asset path
            title: 'Relax with a 20% Discount at Our Luxury Spa',
            description: 'Unwind and rejuvenate with our special spa packages.',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'My Requests'),
          BottomNavigationBarItem(icon: Icon(Icons.house), label: 'My Property'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class OfferCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

   const OfferCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.orange,
                  ),
                  child: const Text('Learn more'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
