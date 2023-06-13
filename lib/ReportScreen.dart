import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  final List<Map<String, String>> appointments;
  final List<Map<String, String>> prescriptions;

  ReportScreen({required this.appointments, required this.prescriptions});

  @override
  Widget build(BuildContext context) {
    int approvedAppointments = appointments.where((appointment) => appointment['status'] == 'Approved').length;
    int notApprovedAppointments = appointments.where((appointment) => appointment['status'] == 'Not Approved').length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Reports'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Appointments Summary:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text('Total Appointments: ${appointments.length}'),
            Text('Approved Appointments: $approvedAppointments'),
            Text('Not Approved Appointments: $notApprovedAppointments'),
            SizedBox(height: 20),
            Text(
              'Prescriptions Summary:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text('Total Prescriptions: ${prescriptions.length}'),
          ],
        ),
      ),
    );
  }
}
