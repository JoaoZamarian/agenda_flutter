import '../database_helper.dart';
import '../models/contact.dart';

class ContactService {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  // Método para obter a lista de contatos
  Future<List<Contact>> getContacts() async {
    return await _dbHelper.getContacts();
  }

  // Método para adicionar um novo contato
  Future<void> addContact(Contact contact) async {
    await _dbHelper.insertContact(contact);
  }

  // Método para atualizar um contato existente
  Future<void> updateContact(Contact contact) async {
    await _dbHelper.updateContact(contact);
  }

  // Método para deletar um contato
  Future<void> deleteContact(int id) async {
    await _dbHelper.deleteContact(id);
  }
}