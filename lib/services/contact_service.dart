import '../models/contact.dart';

class ContactService {
  static final List<Contact> _contacts = [];

  static Future<List<Contact>> getContacts() async {
    return _contacts;
  }

  static Future<void> addContact(Contact contact) async {
    _contacts.add(contact);
  }

  static Future<void> updateContact(Contact updatedContact) async {
    int index = _contacts.indexWhere((c) => c.nome == updatedContact.nome);
    if (index != -1) {
      _contacts[index] = updatedContact;
    }
  }

  static Future<void> deleteContact(Contact contact) async {
    _contacts.remove(contact);
  }
}
