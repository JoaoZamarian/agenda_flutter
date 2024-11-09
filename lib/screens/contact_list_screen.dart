import 'package:flutter/material.dart';
import '../session_manager.dart';
import 'login_screen.dart';

class ContactListScreen extends StatelessWidget {
  final SessionManager _sessionManager = SessionManager();

  Future<void> _logout(BuildContext context) async {
    await _sessionManager.clearUserToken();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Center(child: Text('List of contacts here')),
    );
  }
}
