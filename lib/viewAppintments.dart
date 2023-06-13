import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:knowledge/CameraScreen.dart';
import 'package:http/http.dart' as http;

class ViewAppointmentsScreen extends StatefulWidget {
  @override
  _ViewAppointmentsScreenState createState() => _ViewAppointmentsScreenState();
}

class _ViewAppointmentsScreenState extends State<ViewAppointmentsScreen> {
  final List<Map<String, String>> appointments = [
    {
      'date': 'June 1, 2023',
      'time': '10:00 AM',
      'purpose': 'General Check-up',
      'doctor': 'Dr. John Doe',
      'status': 'Approved',
    },
    {
      'date': 'June 3, 2023',
      'time': '2:30 PM',
      'purpose': 'Dental Cleaning',
      'doctor': 'Dr. Jane Smith',
      'status': 'Not Approved',
    },
    {
      'date': 'June 5, 2023',
      'time': '4:00 PM',
      'purpose': 'Eye Examination',
      'doctor': 'Dr. David Williams',
      'status': 'Approved',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Appointments'),
      ),
      body: ListView(
        children: appointments.map((appointment) {
          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Appointment Details'),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Date: ${appointment['date']}'),
                        Text('Time: ${appointment['time']}'),
                        Text('Purpose: ${appointment['purpose']}'),
                        Text('Doctor: ${appointment['doctor']}'),
                        Text('Status: ${appointment['status']}'),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => CameraScreen(
                            //       cameraController: _cameraController,
                            //     ),
                            //   ),
                            // );
                          },
                          child: Text('Start Appointment'),
                        ),
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
            child: DataTable(
              columns: [
                DataColumn(label: Text('Date')),
                DataColumn(label: Text('Time')),
                DataColumn(label: Text('Purpose')),
                DataColumn(label: Text('Doctor')),
                DataColumn(label: Text('Status')),
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(Text(appointment['date']!)),
                    DataCell(Text(appointment['time']!)),
                    DataCell(Text(appointment['purpose']!)),
                    DataCell(Text(appointment['doctor']!)),
                    DataCell(Text(appointment['status']!)),
                  ],
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

