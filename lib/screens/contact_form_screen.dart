import 'package:flutter/material.dart';
import '../models/contact.dart';
import '../services/contact_service.dart';

class ContactFormScreen extends StatefulWidget {
  final Contact? contact;
  const ContactFormScreen({this.contact});

  @override
  _ContactFormScreenState createState() => _ContactFormScreenState();
}

class _ContactFormScreenState extends State<ContactFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _contactService = ContactService();
  late String _name, _phone, _email;

  @override
  void initState() {
    super.initState();
    if (widget.contact != null) {
      _name = widget.contact!.nome;
      _phone = widget.contact!.telefone;
      _email = widget.contact!.email;
    } else {
      _name = '';
      _phone = '';
      _email = '';
    }
  }

  void _saveContact() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final contact = Contact(
        id: widget.contact?.id,
        nome: _name,
        telefone: _phone,
        email: _email,
      );
      if (widget.contact == null) {
        await _contactService.addContact(contact);
      } else {
        await _contactService.updateContact(contact);
      }
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contact == null ? 'Add Contact' : 'Edit Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(labelText: 'Name'),
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                initialValue: _phone,
                decoration: const InputDecoration(labelText: 'Phone'),
                onSaved: (value) => _phone = value!,
              ),
              TextFormField(
                initialValue: _email,
                decoration: const InputDecoration(labelText: 'Email'),
                onSaved: (value) => _email = value!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveContact,
                child: Text(widget.contact == null ? 'Save' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}