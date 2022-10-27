import 'package:flutter/material.dart';
import '../widgets/principal.dart';
import '../widgets/frmregistro.dart';
import '../widgets/listado.dart';
import '../widgets/editar.dart';
import '../widgets/registro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RUTAS',
      initialRoute: '/principal',
      routes: {
        '/principal': (context) => const Principal(),
        '/frmregistro': (context) => const FrmRegistro(),
        '/listado': (context) => const ListadoUsuarios(),
        '/editar': (context) => const Editar(),
        '/registro': (context) => const RegistroEs(),
      }
    );
  }
}