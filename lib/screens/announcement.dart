import 'package:flutter/material.dart';

class AnnouncementsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Announcements',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0, // Removes the shadow
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // First Announcement
            AnnouncementTile(
              icon: Icons.notifications,
              title: 'Simplify your property management with BReal',
              subtitle:
                  'Manage your Real Estate portfolio Effortlessly, Anytime, Anywhere, with Powerful tools Design...',
              dateTime: 'Wed, Aug 29th 2024 09:47 PM',
            ),
            Divider(color: Colors.grey),
            // Second Announcement
            AnnouncementTile(
              icon: Icons.notifications,
              title: 'New Property Management Features Available',
              subtitle:
                  'Explore the latest features to streamline your property management workflow!',
              dateTime: 'Thu, Aug 30th 2024 10:30 AM',
            ),
            Divider(color: Colors.grey),
            // Third Announcement
            AnnouncementTile(
              icon: Icons.notifications,
              title: 'Important System Update: 1.0.5',
              subtitle:
                  'The new update improves performance and introduces new tools for real estate managers.',
              dateTime: 'Fri, Sep 1st 2024 08:15 AM',
            ),
          ],
        ),
      ),
    );
  }
}

class AnnouncementTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String dateTime;

  AnnouncementTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.only(bottom: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon and Title
            Row(
              children: [
                Icon(icon, color: Colors.blue),
                SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            // Subtitle
            Text(
              subtitle,
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 8.0),
            // Date and Time
            Text(
              dateTime,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: AnnouncementsPage()));
