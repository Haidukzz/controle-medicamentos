import 'package:flutter/material.dart';
import 'adicionar_medicacao.dart';
import 'ver_lista_medicacoes.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text('Controle de Medicações'),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                'Bem-vindo ao Controle de Medicações',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[300],
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Escolha uma funcionalidade:',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ),
            SizedBox(height: 30),
            _buildOptionCard(
              context,
              icon: Icons.list,
              title: 'Ver Lista de Medicações',
              subtitle: 'Exibe todas as medicações que você deve tomar',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VerListaMedicacoes()),
                );
              },
            ),
            _buildOptionCard(
              context,
              icon: Icons.add,
              title: 'Adicionar Nova Medicação',
              subtitle: 'Permite cadastrar uma nova medicação',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdicionarMedicacao()),
                );
              },
            ),            
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard(BuildContext context,
      {required IconData icon,
      required String title,
      required String subtitle,
      required Function() onTap}) {
    return Card(
      color: Colors.blueGrey[700],
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal[300], size: 30),
        title: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.white70),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.teal[300]),
        onTap: onTap,
      ),
    );
  }
}
