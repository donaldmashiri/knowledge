import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignupButton extends StatelessWidget {
  final String url;
  final String tokenType;
  final String name;
  final String email;
  final String password;

  SignupButton({
    required this.url,
    required this.tokenType,
    this.name = 'John Doe',
    this.email = 'example@example.com',
    this.password = 'password123',
  });

  Future<void> _handleSignup() async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': '$tokenType YOUR_TOKEN_HERE',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Successful signup, handle the response here if needed
        print('Signup successful!');
      } else {
        // Handle error response
        print('Signup failed with status code ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions during the signup process
      print('Error occurred during signup: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleSignup,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          'Signup',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signup Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Signup Demo'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (value) {
                // Save the name value
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (value) {
                // Save the email value
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              onChanged: (value) {
                // Save the password value
              },
            ),
            SizedBox(height: 16),
            SignupButton(
              url: 'http://localhost:8000/api/register',
              tokenType: 'Bearer',
            ),
          ],
        ),
      ),
    );
  }
}
