import 'package:flutter/material.dart';
import 'dart:async';
import 'signup_page.dart';
import 'user_details_page.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _obscureText = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset('asset/pokemon2.gif', width: 150, height: 150),
                  SizedBox(height: 30),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@') || value.split('@').length != 2 || value.split('@')[0].isEmpty || value.split('@')[1].isEmpty) {
                          return 'Please enter a valid email with only @';
                        }
                        return null;
                      },
                      onSaved: (value) => _email = value!,
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      obscureText: _obscureText,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      onSaved: (value) => _password = value!,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    child: _isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text('Login'),
                    onPressed: _isLoading
                        ? null
                        : () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        setState(() {
                          _isLoading = true;
                        });

                        // Simulate login process
                        Future.delayed(Duration(seconds: 2), () {
                          setState(() {
                            _isLoading = false;
                          });

                          // Navigate to UserDetailsPage
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UserDetailsPage()),
                          );
                        });
                      }
                    },
                  ),
                  TextButton(
                    child: Text('Forgot Password?'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                      );
                    },
                  ),
                  TextButton(
                    child: Text('Sign Up'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}