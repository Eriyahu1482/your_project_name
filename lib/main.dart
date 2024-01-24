import 'package:flutter/material.dart';
import 'auth_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final AuthService authService = AuthService();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                bool loggedIn = await authService.login(
                  usernameController.text,
                  passwordController.text,
                );
                if (loggedIn) {
                  print('Login successful');
                } else {
                  print('Invalid username or password');
                }
              },
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () async {
                bool registered = await authService.register(
                  usernameController.text,
                  passwordController.text,
                );
                if (registered) {
                  print('Registration successful');
                } else {
                  print('Username already exists');
                }
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}