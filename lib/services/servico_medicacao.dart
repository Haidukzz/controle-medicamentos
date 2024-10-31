import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/medicacao.dart';

class ServicoMedicacao with ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Medicacao>> obterMedicacoes() {
    return _db.collection('medicacoes').snapshots().map(
      (snapshot) => snapshot.docs.map(
        (doc) => Medicacao.fromMap(doc.data(), doc.id),
      ).toList(),
    );
  }

  Future<void> adicionarMedicacao(Medicacao medicacao) async {
    await _db.collection('medicacoes').add(medicacao.toMap());
  }

  Future<void> atualizarMedicacao(Medicacao medicacao) async {
    await _db.collection('medicacoes').doc(medicacao.id).update(medicacao.toMap());
  }

  Future<void> excluirMedicacao(String id) async {
    await _db.collection('medicacoes').doc(id).delete();
  }
}
