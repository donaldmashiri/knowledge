import 'package:flutter/material.dart';

class AppointmentScreen extends StatelessWidget {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController purposeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

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
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Handle submit button tap
                // Access the entered values using the controllers
                String date = dateController.text;
                String time = timeController.text;
                String purpose = purposeController.text;
                String description = descriptionController.text;

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
