import 'package:flutter/material.dart';

class MyVotingPage extends StatefulWidget {
  @override
  _MyVotingPageState createState() => _MyVotingPageState();
}

class _MyVotingPageState extends State<MyVotingPage> {
  bool isRegistrationSelected = false;
  bool isNomineesSelected = false;
  bool isVotingSelected = false;
  bool isProxyAssigned = false;
  bool isSelfNomination = false;
  bool isNomineeSelected = false;
  bool isSubmitted = false;
  bool isPhysical = false;
  bool isVirtual = false;

  void toggleButton(String buttonType) {
    setState(() {
      if (buttonType == "proxy") {
        isProxyAssigned = !isProxyAssigned;
      } else if (buttonType == "selfNominate") {
        isSelfNomination = !isSelfNomination;
      } else if (buttonType == "physical") {
        isPhysical = !isPhysical;
        isVirtual = false;
      } else if (buttonType == "virtual") {
        isVirtual = !isVirtual;
        isPhysical = false;
      }
    });
  }

  Widget bodNomineeCard(String name, String image) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isNomineeSelected = true;
        });
      },
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(image),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            if (isNomineeSelected)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isVotingSelected = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: const Text('Vote'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: const Text(
          'My Voting',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Thin line below the header
              const Divider(thickness: 1, color: Colors.grey),

              // Header Card with Voting Info
             Card(
                color: const Color(0xFFFFF3E0), // Pale orange color
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Voting for Board of Directors 2024',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Board of Directors Voting Now Open! It\'s time to have your say in our community\'s future. Cast your vote through the app by October 30th. \n Every vote makes a difference!',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),


              const Divider(height: 30),

              // Three row buttons for Registration, Nominees, and Voting
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isRegistrationSelected = true;
                        isNomineesSelected = false;
                        isVotingSelected = false;
                      });
                    },
                    child: _buildSelectionCard('Registration', Icons.edit),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isRegistrationSelected = false;
                        isNomineesSelected = true;
                        isVotingSelected = false;
                      });
                    },
                    child: _buildSelectionCard('Nominees', Icons.people),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isRegistrationSelected = false;
                        isNomineesSelected = false;
                        isVotingSelected = true;
                      });
                    },
                    child: _buildSelectionCard('Voting', Icons.check_circle),
                  ),
                ],
              ),

              // Conditional Content based on Card selection
              if (isRegistrationSelected) _buildRegistrationCard(),

              if (isNomineesSelected)
                Column(
                  children: [
                    bodNomineeCard('Ali Ghuloom', 'assets/BOD/bod1.jpg'),
                    bodNomineeCard('Mr. John', 'assets/BOD/bod2.jpg'),
                    bodNomineeCard('Mr. David', 'assets/BOD/bod3.jpg'),
                    bodNomineeCard('Mr. John', 'assets/BOD/bod4.jpg'),
                    bodNomineeCard('Mr. David', 'assets/BOD/bod5.jpg'),
                    bodNomineeCard('Mr. John', 'assets/BOD/bod6.jpg'),
                  ],
                ),

              if (isVotingSelected && isSubmitted)
                const Center(
                  child: Text(
                    'Each Vote Makes A Difference!',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectionCard(String title, IconData icon) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, color: Colors.orange, size: 40),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 16, color: Colors.orange)),
          ],
        ),
      ),
    );
  }

  Widget _buildRegistrationCard() {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: const [
                Text('Owner Name: '),
                Spacer(),
                Text('Ali Ghuloom'),
              ],
            ),
            Row(
              children: const [
                Text('Property: '),
                Spacer(),
                Text('Villa Oasis 8348'),
              ],
            ),
            Row(
              children: const [
                Text('Voting Weight: '),
                Spacer(),
                Text('5%'),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Text('Attendance Type: '),
                const Spacer(),
                ElevatedButton(
                  onPressed: () => toggleButton("physical"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isPhysical ? Colors.orange : Colors.grey,
                  ),
                  child: const Text('Physical'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => toggleButton("virtual"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isVirtual ? Colors.orange : Colors.grey,
                  ),
                  child: const Text('Virtual'),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Text('Will you assign a proxy?'),
                const Spacer(),
                ElevatedButton(
                  onPressed: () => toggleButton("proxy"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isProxyAssigned ? Colors.orange : Colors.grey,
                  ),
                  child: const Text('Assign Proxy'),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Text('Do you nominate yourself?'),
                const Spacer(),
                ElevatedButton(
                  onPressed: () => toggleButton("selfNominate"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSelfNomination ? Colors.orange : Colors.grey,
                  ),
                  child: const Text('Nominate'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
