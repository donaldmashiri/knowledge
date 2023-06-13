import 'dart:convert';

import 'package:flutter/material.dart';
import 'home.dart';
import 'signup.dart';
import 'package:http/http.dart' as http;



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Health',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> loginUp(BuildContext context) async {
    String apiUrl = 'http://10.0.2.2:8000/api/login';
    Map<String, String> headers = {"Content-type": "application/json"};
    Map<String, String> jsonBody = {
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
        showSuccessSnackBar(context, 'Login Successful');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        // Show error message
        showFailureSnackBar(context, 'Login Failed');
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
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        title: Text('Health Care'),
      ),
      // drawer: Drawer(),
      body: Container(
        // padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Image(
                image: AssetImage('images/health.png'),
                height: 80.0,
                width: 200.0,
                fit: BoxFit.contain,
              ),
              // Text(
              //   'Wrong Password and Email',
              //   style: TextStyle(
              //     color: Colors.red,
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),

              // SizedBox(height: 20.0),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return 'Please enter your password';
                //   }
                //   return null;
                // },
                // onSaved: (value) {
                //   _password = value!;
                // },

              // SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();
                    // Perform login or authentication logic here
                    // using the email and password entered

                    loginUp(context);
                  //
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: Text('Log In'),
              ),
              TextButton(
                onPressed: () {
                  // Handle signup button tapped
                  // Add your signup logic or navigation code here
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Text('Create Account Now'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}




// void loginUp() async {
//   String apiUrl = 'http://10.0.2.2:8000/api/login';
//   Map<String, String> headers = {"Content-type": "application/json"};
//   String jsonBody = '''
//     {
//       "email":"MSU2@gmail.com",
//       "password":"MSUmsu12367"
//     }
//   ''';
//
//   try {
//     final response = await http.post(
//       Uri.parse(apiUrl),
//       headers: headers,
//       body: jsonBody,
//     );
//
//     if (response.statusCode == 200) {
// // Successful registration
//       print('Login successful');
// // Do something else
//     } else {
// // Registration failed
//       print('Login failed');
// // Handle error
//     }
//   } catch (error) {
//     print('Error: $error');
// // Handle error
//   }
// }
