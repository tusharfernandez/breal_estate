import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            NewsCard(
              imagePath: 'assets/news/playground.jpeg',
              title: "New Playground Equipment Installed at Central Park",
              description: "New playground equipment has been installed at Central Park...",
              date: "Wed, Aug 28th 2024",
            ),
            const SizedBox(height: 16),
            NewsCard(
              imagePath: 'assets/news/communitygarden.jpg',
              title: "Community Garden Flourishes with New Volunteers",
              description: "Our community garden is thriving thanks to the dedication...",
              date: "Wed, Aug 28th 2024",
            ),
            const SizedBox(height: 16),
            NewsCard(
              imagePath: 'assets/news/blockparty.jpg',
              title: "Annual Block Party: A Night to Remember",
              description: "Last weekend’s block party was a huge success, bringing...",
              date: "Wed, Aug 28th 2024",
            ),
          ],
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String date;

  const NewsCard({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.date,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
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
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const Icon(Icons.arrow_forward, color: Colors.orange),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
