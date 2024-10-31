import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/medicacao.dart';
import '../services/servico_medicacao.dart';
import 'package:intl/intl.dart';

class AdicionarMedicacao extends StatefulWidget {
  @override
  _AdicionarMedicacaoState createState() => _AdicionarMedicacaoState();
}

class _AdicionarMedicacaoState extends State<AdicionarMedicacao> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _usoController = TextEditingController();
  final _dosagemController = TextEditingController();
  final _intervaloHorasController = TextEditingController();

  DateTime? _dataInicio;

  Future<void> _selecionarDataInicio(BuildContext context) async {
    final dataSelecionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (dataSelecionada != null) {
      setState(() {
        _dataInicio = dataSelecionada;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final servicoMedicacao = Provider.of<ServicoMedicacao>(context);

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text('Adicionar Medicação'),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              _buildTextField(
                controller: _nomeController,
                label: 'Nome',
              ),
              SizedBox(height: 10),
              _buildTextField(
                controller: _descricaoController,
                label: 'Descrição',
              ),
              SizedBox(height: 10),
              _buildTextField(
                controller: _usoController,
                label: 'Uso',
              ),
              SizedBox(height: 10),
              _buildTextField(
                controller: _dosagemController,
                label: 'Dosagem',
              ),
              SizedBox(height: 10),
              _buildDatePicker(context),
              SizedBox(height: 10),
              _buildTextField(
                controller: _intervaloHorasController,
                label: 'Intervalo (Horas)',
                isNumber: true,
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      servicoMedicacao.adicionarMedicacao(
                        Medicacao(
                          id: '',
                          nome: _nomeController.text,
                          descricao: _descricaoController.text,
                          uso: _usoController.text,
                          dosagem: _dosagemController.text,
                          dataInicio: _dataInicio,
                          intervaloHoras: int.tryParse(_intervaloHorasController.text),
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[300],
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text("Salvar", style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required TextEditingController controller, required String label, bool isNumber = false}) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.teal[300]),
        filled: true,
        fillColor: Colors.blueGrey[800],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, preencha o campo $label';
        }
        return null;
      },
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return InkWell(
      onTap: () => _selecionarDataInicio(context),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Data de Início',
          labelStyle: TextStyle(color: Colors.teal[300]),
          filled: true,
          fillColor: Colors.blueGrey[800],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          _dataInicio != null ? DateFormat('dd/MM/yyyy').format(_dataInicio!) : 'Selecione uma data',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
