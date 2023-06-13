import 'dart:convert';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatelessWidget {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> signUp(BuildContext context) async {
    String apiUrl = 'http://10.0.2.2:8000/api/register';
    Map<String, String> headers = {"Content-type": "application/json"};
    Map<String, String> jsonBody = {
      "name": nameController.text,
      "email": emailController.text,
      "password": passwordController.text,
    };

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: json.encode(jsonBody),
      );

      if (response.statusCode == 200) {
        // Show success message
        showSuccessSnackBar(context, 'Sign up successful');

      } else {
        // Show error message
        showFailureSnackBar(context, 'Sign up failed');
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
        title: Text('Sign Up'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('images/health.png'),
              width: 150,
              height: 150,
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            // SizedBox(height: 20.0),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            // SizedBox(height: 20.0),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            // SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                signUp(context);
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}




// void signUp() async {
//   String apiUrl = 'http://10.0.2.2:8000/api/register';
//   Map<String, String> headers = {"Content-type": "application/json"};
//   String jsonBody = '''
//          {
//         "email":"donyi1e@gmail.com",
//         "password":"password",
//         "name":"donnie"
//         }
//     ''';
//
//   try {
//   final response = await http.post(
//   Uri.parse(apiUrl),
//   headers: headers,
//   body: jsonBody,
//   );
//
//   if (response.statusCode == 200) {
//   // Successful registration
//   print('Registration successful');
//   // Do something else
//   } else {
//   // Registration failed
//   print('Registration failed');
//   // Handle error
//   }
//   } catch (error) {
//   print('Error: $error');
//   // Handle error
//   }
// }

