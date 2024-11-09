class Contact {
  int? id;  // `id` é opcional, pois ele pode não estar definido antes de ser salvo no banco de dados
  String nome;
  String telefone;
  String email;

  Contact({
    this.id,
    required this.nome,
    required this.telefone,
    required this.email,
  });

  // Converte um objeto Contact em um Map para salvar no banco
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': nome,
      'phone': telefone,
      'email': email,
    };
  }

  // Cria um objeto Contact a partir de um Map
  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map['id'] as int?,  // `id` é opcional
      nome: map['name'] as String,
      telefone: map['phone'] as String,
      email: map['email'] as String,
    );
  }
}
