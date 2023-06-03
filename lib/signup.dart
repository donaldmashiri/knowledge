import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatelessWidget {
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
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                signUp();
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}




void signUp() async {
String apiUrl = 'http://10.0.2.2:8000/api/register';
Map<String, String> headers = {"Content-type": "application/json"};
String jsonBody = '''
    {
      "email":"MSU2@gmail.com",
      "password":"MSUmsu123",
      "name":"MSUmsu123",
      "usernames":"MSU2msu123"
    }
  ''';

try {
final response = await http.post(
Uri.parse(apiUrl),
headers: headers,
body: jsonBody,
);

if (response.statusCode == 200) {
// Successful registration
print('Registration successful');
// Do something else
} else {
// Registration failed
print('Registration failed');
// Handle error
}
} catch (error) {
print('Error: $error');
// Handle error
}
}

