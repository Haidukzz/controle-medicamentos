import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/servico_medicacao.dart';
import 'screens/pagina_inicial.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAK9fXmKE-yT8DdchdosEnR28NMk4rVwuk",
      authDomain: "controle-de-medicamentos-8f122.firebaseapp.com",
      projectId: "controle-de-medicamentos-8f122",
      storageBucket: "controle-de-medicamentos-8f122.appspot.com",
      messagingSenderId: "367426872948",
      appId: "1:367426872948:android:e42543137d149a63d01321",
      measurementId: "",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ServicoMedicacao()),
      ],
      child: MaterialApp(
        title: 'Controle de Medicações',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PaginaInicial(), // Define a `PaginaInicial` como tela inicial
      ),
    );
  }
}
