import 'package:cvv/homepage.dart';
import 'package:flutter/material.dart';

void main() => runApp(const LoginApp());

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = "caynalle02@gmail.com";
  String _password = "Caynalle02*";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.greenAccent,
          backgroundColor: Colors.black
        ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Image.asset(
              'images/nahuhulog.jpeg', // Replace with the actual path to your image asset
              height: 150, // Adjust the height as needed
            ),
            const SizedBox(height: 20.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.greenAccent, width: 7.0),
                  ),
                  ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email is required';
                  } else if (!isValidEmail(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,

                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 7.0),
                ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password is required';
                    } else if (!isValidPassword(value)) {
                      return 'Please enter a valid password';
                      }
                      return null;
                      },

                onSaved: (value) {
                  _password = value!;
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Perform login logic here, e.g., validate credentials.
                    // Replace with your authentication logic.
                    if (_email == 'caynalle02@gmail.com') {
                      // Successful login, navigate to another screen.
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyApp()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid email')),
                      );
                    }
                  }
                },
                child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Perform login logic here, e.g., validate credentials.
                    // Replace with your authentication logic.
                    if ( _password == 'Caynalle02*') {
                      // Successful login, navigate to another screen.
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyApp()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid password')),
                      );
                    }
                  }
                },
                child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    // A simple email validation check.
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegExp.hasMatch(email);
  }
}

bool isValidPassword(String password) {
  // Your password validation logic goes here
  // For example, you might check the length or specific requirements
  return password.length >= 8; // Example: Require at least 8 characters
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: const Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}