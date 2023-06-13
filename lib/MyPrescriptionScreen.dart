import 'package:flutter/material.dart';

class MyPrescriptionScreen extends StatelessWidget {
  final List<Map<String, dynamic>> prescriptions = [
    {
      'medication': 'Medication A',
      'dosage': '1 pill',
      'frequency': 'Twice a day',
      'duration': '7 days',
    },
    {
      'medication': 'Medication B',
      'dosage': '2 pills',
      'frequency': 'Once a day',
      'duration': '14 days',
    },
    {
      'medication': 'Medication C',
      'dosage': '1 pill',
      'frequency': 'Three times a day',
      'duration': '30 days',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Prescription'),
      ),
      body: ListView(
        children: [
          DataTable(
            columns: [
              DataColumn(label: Text('Medication')),
              DataColumn(label: Text('Dosage')),
              DataColumn(label: Text('Frequency')),
              DataColumn(label: Text('Duration')),
            ],
            rows: prescriptions.map((prescription) {
              return DataRow(
                cells: [
                  DataCell(Text(prescription['medication'])),
                  DataCell(Text(prescription['dosage'])),
                  DataCell(Text(prescription['frequency'])),
                  DataCell(Text(prescription['duration'])),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

