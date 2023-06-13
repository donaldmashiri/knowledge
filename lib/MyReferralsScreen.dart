import 'package:flutter/material.dart';

class MyReferralsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> referrals = [
    {
      'referralType': 'Specialist A',
      'doctor': 'Dr. John Doe',
      'date': 'June 3, 2023',
    },
    {
      'referralType': 'Specialist B',
      'doctor': 'Dr. Jane Smith',
      'date': 'June 5, 2023',
    },
    {
      'referralType': 'Specialist C',
      'doctor': 'Dr. David Williams',
      'date': 'June 7, 2023',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Referrals'),
      ),
      body: ListView(
        children: [
          DataTable(
            columns: [
              DataColumn(label: Text('Referral Type')),
              DataColumn(label: Text('Doctor')),
              DataColumn(label: Text('Date')),
            ],
            rows: referrals.map((referral) {
              return DataRow(
                cells: [
                  DataCell(Text(referral['referralType'])),
                  DataCell(Text(referral['doctor'])),
                  DataCell(Text(referral['date'])),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
