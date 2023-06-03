import 'package:flutter/material.dart';
import 'package:knowledge/appointment.dart';
import 'signup.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.blue, // Set the background color of the drawer
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('John Doe'),
                accountEmail: Text('johndoe@example.com'),
                currentAccountPicture: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('images/health.png'),
                          ),
                          // SizedBox(width: 10),
                          Text(
                            'Mobile Health Service',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.calendar_today), // Add an icon to the leading property
                title: Text(
                  'Book an Appointment',
                  style: TextStyle(
                    color: Colors.white, // Set the text color to white
                  ),
                ),
                onTap: () {
                  // Handle onTap for "Book an Appointment" link
                },
              ),
              ListTile(
                leading: Icon(Icons.view_list), // Add an icon to the leading property
                title: Text('View Appointments'),
                onTap: () {
                  // Handle onTap for "View Appointments" link
                },
              ),
              ListTile(
                leading: Icon(Icons.view_list), // Add an icon to the leading property
                title: Text('My Prescription'),
                onTap: () {
                  // Handle onTap for "View Appointments" link
                },
              ),
              ListTile(
                leading: Icon(Icons.view_list), // Add an icon to the leading property
                title: Text('Referals'),
                onTap: () {
                  // Handle onTap for "View Appointments" link
                },
              ),
              ListTile(
                leading: Icon(Icons.lock), // Add an icon to the leading property
                title: Text('Reports'),
                onTap: () {
                  // Handle onTap for "View Appointments" link
                },
              ),

            ],
          ),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('images/health.png'),
              width: 2500,
              height: 150,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle start date button tap
                  },
                  child: Text('Start Date'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle end date button tap
                  },
                  child: Text('End Date'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle start time button tap
                  },
                  child: Text('Start Time'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle make an appointment button tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppointmentScreen()),
                );
              },
              child: Text('Make an Appointment'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ],
        ),
      ),


    );
  }
}
