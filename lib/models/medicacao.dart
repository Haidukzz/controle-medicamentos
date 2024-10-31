class Medicacao {
  String id;
  String nome;
  String descricao;
  String uso;
  String dosagem;
  DateTime? dataInicio;  // Adicionado
  int? intervaloHoras;    // Adicionado

  Medicacao({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.uso,
    required this.dosagem,
    this.dataInicio,       // Adicionado
    this.intervaloHoras,    // Adicionado
  });

  factory Medicacao.fromMap(Map<String, dynamic> data, String id) {
    return Medicacao(
      id: id,
      nome: data['nome'] ?? '',
      descricao: data['descricao'] ?? '',
      uso: data['uso'] ?? '',
      dosagem: data['dosagem'] ?? '',
      dataInicio: data['dataInicio'] != null ? DateTime.parse(data['dataInicio']) : null,  // Adicionado
      intervaloHoras: data['intervaloHoras'] != null ? data['intervaloHoras'] as int : null, // Adicionado
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'descricao': descricao,
      'uso': uso,
      'dosagem': dosagem,
      'dataInicio': dataInicio?.toIso8601String(),  // Adicionado
      'intervaloHoras': intervaloHoras,             // Adicionado
    };
  }
}
