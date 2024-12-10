import 'package:flutter/material.dart';

class BODPage extends StatelessWidget {
  const BODPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of board members data
    final List<Map<String, String>> boardMembers = [
      {
        'name': 'Mr. John',
        'image': 'assets/BOD/bod1.jpg',
      },
      {
        'name': 'Mr. David',
        'image': 'assets/BOD/bod2.jpg',
      },
      {
        'name': 'Mr. David',
        'image': 'assets/BOD/bod3.jpg',
      },
      {
        'name': 'Mr. John',
        'image': 'assets/BOD/bod4.jpg',
      },
      {
        'name': 'Mr. David',
        'image': 'assets/BOD/bod5.jpg',
      },
      {
        'name': 'Mr. John',
        'image': 'assets/BOD/bod6.jpg',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Board of Directors',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Grid of cards (2 rows, 3 columns)
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3 columns
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1, // Square cards
              ),
              itemCount: boardMembers.length, // 6 items for 2 rows
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadowColor: Colors.black.withOpacity(0.2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Circular Image for the profile with a border
                      ClipOval(
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: Colors.blueAccent,
                              width: 3,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              boardMembers[index]['image']!,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Name under the image
                      Text(
                        boardMembers[index]['name']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
