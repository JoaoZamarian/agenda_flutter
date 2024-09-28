import 'package:flutter/material.dart';
import '../models/contact.dart';
import '../services/contact_service.dart';
import 'contact_form_screen.dart';

class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  _loadContacts() async {
    final loadedContacts = await ContactService.getContacts();
    setState(() {
      contacts = loadedContacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda de Contatos'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            title: Text(contact.nome),
            subtitle: Text('${contact.telefone} | ${contact.email}'),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => _editContact(contact),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewContact,
        child: Icon(Icons.add),
      ),
    );
  }

  _addNewContact() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ContactFormScreen()),
    ).then((_) => _loadContacts());
  }

  _editContact(Contact contact) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ContactFormScreen(contact: contact)),
    ).then((_) => _loadContacts());
  }
}
