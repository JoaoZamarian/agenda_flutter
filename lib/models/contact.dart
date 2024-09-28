class Contact {
  String nome;
  String telefone;
  String email;

  Contact({required this.nome, required this.telefone, required this.email});

  Contact copyWith({String? nome, String? telefone, String? email}) {
    return Contact(
      nome: nome = this.nome,
      telefone: telefone = this.telefone,
      email: email = this.email,
    );
  }
}
