import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppointmentScreen extends StatelessWidget {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController purposeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> appointmentUp(BuildContext context) async {
    String apiUrl = 'http://10.0.2.2:8000/api/appointments';
    Map<String, String> headers = {"Content-type": "application/json"};
    Map<String, String> jsonBody = {
      "date": dateController.text,
      "time": timeController.text,
      "purpose": purposeController.text,
      "doctor": descriptionController.text,
    };

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: json.encode(jsonBody),
      );

      if (response.statusCode == 201) {
        // Show success message
        showSuccessSnackBar(context, 'Appointment Successful');

      } else {
        // Show error message
        showFailureSnackBar(context, 'Failed to create');
      }
    } catch (e) {
      // Show error message
      showFailureSnackBar(context, 'Error: $e');
    }
  }

  void showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  void showFailureSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text('Appointments'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(
              image: AssetImage('images/health.png'),
              width: 150,
              height: 150,
            ),
            TextFormField(
              controller: dateController,
              decoration: InputDecoration(labelText: 'Date'),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: timeController,
              decoration: InputDecoration(labelText: 'Time'),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: purposeController,
              decoration: InputDecoration(labelText: 'Purpose'),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Select Doctor'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Handle submit button tap
                // Access the entered values using the controllers
                // String date = dateController.text;
                // String time = timeController.text;
                // String purpose = purposeController.text;
                // String description = descriptionController.text;
                appointmentUp(context);

                // Perform submission logic or navigate to the next screen
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
