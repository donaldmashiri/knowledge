import 'package:flutter/material.dart';
import 'package:knowledge/MyPrescriptionScreen.dart';
import 'package:knowledge/MyReferralsScreen.dart';
import 'package:knowledge/ReportScreen.dart';
import 'package:knowledge/appointment.dart';
import 'package:knowledge/viewAppintments.dart';
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AppointmentScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.view_list), // Add an icon to the leading property
                title: Text(
                  'View Appointments',
                  style: TextStyle(
                    color: Colors.white, // Set the text color to white
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewAppointmentsScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.description), // Add an icon to the leading property
                title: Text('My Prescription',
                  style: TextStyle(
                    color: Colors.white, // Set the text color to white
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyPrescriptionScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.receipt), // Add an icon to the leading property
                title: Text('Referals',
                  style: TextStyle(
                    color: Colors.white, // Set the text color to white
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyReferralsScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.assignment),
                title: Text(
                  'Reports',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => Builder(
                  //       builder: (BuildContext context) => ReportScreen(
                  //         appointments: appointments,
                  //         prescriptions: prescriptions,
                  //       ),
                  //     ),
                  //   ),
                  // );
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
