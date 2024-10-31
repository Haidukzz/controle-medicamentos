import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/medicacao.dart';
import '../services/servico_medicacao.dart';
import 'package:provider/provider.dart';

class VerListaMedicacoes extends StatefulWidget {
  @override
  _VerListaMedicacoesState createState() => _VerListaMedicacoesState();
}

class _VerListaMedicacoesState extends State<VerListaMedicacoes> {
  String? editingId;
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _usoController = TextEditingController();
  final _dosagemController = TextEditingController();
  final _intervaloHorasController = TextEditingController();
  DateTime? _dataInicio;

  @override
  Widget build(BuildContext context) {
    final servicoMedicacao = Provider.of<ServicoMedicacao>(context);

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text('Lista de Medicações'),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: StreamBuilder<List<Medicacao>>(
        stream: servicoMedicacao.obterMedicacoes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar dados', style: TextStyle(color: Colors.white)));
          }

          final medicacoes = snapshot.data ?? [];

          if (medicacoes.isEmpty) {
            return Center(child: Text('Nenhuma medicação cadastrada.', style: TextStyle(color: Colors.white)));
          }

          return ListView.builder(
            itemCount: medicacoes.length,
            itemBuilder: (context, index) {
              final medicacao = medicacoes[index];
              final isEditing = medicacao.id == editingId;

              if (isEditing) {
                _nomeController.text = medicacao.nome;
                _descricaoController.text = medicacao.descricao;
                _usoController.text = medicacao.uso;
                _dosagemController.text = medicacao.dosagem;
                _intervaloHorasController.text = medicacao.intervaloHoras?.toString() ?? '';
                _dataInicio = medicacao.dataInicio;
              }

              return Card(
                color: Colors.blueGrey[700],
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: isEditing
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextField(
                              controller: _nomeController,
                              decoration: InputDecoration(labelText: 'Nome', labelStyle: TextStyle(color: Colors.teal[300])),
                              style: TextStyle(color: Colors.teal[300]),
                            ),
                            TextField(
                              controller: _descricaoController,
                              decoration: InputDecoration(labelText: 'Descrição', labelStyle: TextStyle(color: Colors.teal[300])),
                              style: TextStyle(color: Colors.teal[300]),
                            ),
                            TextField(
                              controller: _usoController,
                              decoration: InputDecoration(labelText: 'Uso', labelStyle: TextStyle(color: Colors.teal[300])),
                              style: TextStyle(color: Colors.teal[300]),
                            ),
                            TextField(
                              controller: _dosagemController,
                              decoration: InputDecoration(labelText: 'Dosagem', labelStyle: TextStyle(color: Colors.teal[300])),
                              style: TextStyle(color: Colors.teal[300]),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              controller: _intervaloHorasController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Intervalo em horas',
                                labelStyle: TextStyle(color: Colors.teal[300]),
                              ),
                              style: TextStyle(color: Colors.teal[300]),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      final DateTime? picked = await showDatePicker(
                                        context: context,
                                        initialDate: _dataInicio ?? DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101),
                                      );
                                      if (picked != null) {
                                        setState(() {
                                          _dataInicio = picked;
                                        });
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey[800]),
                                    child: Text(
                                      _dataInicio != null
                                          ? 'Data: ${DateFormat('dd/MM/yyyy').format(_dataInicio!)}'
                                          : 'Selecionar Data',
                                      style: TextStyle(color: Colors.teal[300]),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      editingId = null;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey[700]),
                                  child: Text('Cancelar', style: TextStyle(color: Colors.teal[300])),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    final updatedMedicacao = Medicacao(
                                      id: medicacao.id,
                                      nome: _nomeController.text,
                                      descricao: _descricaoController.text,
                                      uso: _usoController.text,
                                      dosagem: _dosagemController.text,
                                      dataInicio: _dataInicio,
                                      intervaloHoras: int.tryParse(_intervaloHorasController.text),
                                    );
                                    servicoMedicacao.atualizarMedicacao(updatedMedicacao);
                                    setState(() {
                                      editingId = null;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[300]),
                                  child: Text('Salvar', style: TextStyle(color: Colors.blueGrey[900])),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : ListTile(
                        leading: Icon(Icons.medical_services, color: Colors.teal[300], size: 30),
                        title: Text(
                          medicacao.nome,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Descrição: ${medicacao.descricao}", style: TextStyle(color: Colors.white70)),
                            Text(
                              "Data de Início: ${medicacao.dataInicio != null ? DateFormat('dd/MM/yyyy').format(medicacao.dataInicio!) : 'Não especificada'}",
                              style: TextStyle(color: Colors.white70),
                            ),
                            Text(
                              "Intervalo: ${medicacao.intervaloHoras} horas",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.teal[300]),
                              onPressed: () {
                                setState(() {
                                  editingId = medicacao.id;
                                });
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.teal[300]),
                              onPressed: () {
                                servicoMedicacao.excluirMedicacao(medicacao.id);
                              },
                            ),
                          ],
                        ),
                      ),
              );
            },
          );
        },
      ),
    );
  }
}
