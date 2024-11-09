import 'package:flutter/material.dart';
import '../database_helper.dart';
import 'contact_list_screen.dart';
import 'register_screen.dart';
import '../session_manager.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _databaseHelper = DatabaseHelper();
  final _sessionManager = SessionManager();

  Future<void> _login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final loggedIn = await _databaseHelper.loginUser(username, password);

    if (loggedIn) {
      await _sessionManager.saveUserToken(username);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ContactListScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid username or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterScreen()),
              ),
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
