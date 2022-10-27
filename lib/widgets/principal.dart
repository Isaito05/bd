import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Principal"),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             SizedBox(
              width: 200.0,
              child: ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/frmregistro');    
              }, 
              child: const Text("Frm Registro")),
              
            ),
            SizedBox(
              width: 200.0,
              child: ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/listado');    
              }, 
              child: const Text("LISTADO")),
              
            ),
            SizedBox(
              width: 200.0,
              child: ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/registro');    
              }, 
              child: const Text("REGISTRO ESTILOS")),
              
            ),
          ],    
        ),
      ),
     
    );
  }
}