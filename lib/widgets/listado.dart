import 'dart:ffi';

import 'package:flutter/material.dart';
import '../bd/basededatos.dart';
class ListadoUsuarios extends StatefulWidget {
  const ListadoUsuarios({super.key});

  @override
  State<ListadoUsuarios> createState() => _ListadoUsuariosState();
}



class _ListadoUsuariosState extends State<ListadoUsuarios> with WidgetsBindingObserver{
  TextEditingController cNombre = TextEditingController();
  TextEditingController cApellido = TextEditingController();
  TextEditingController cCorreo = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  int respuesta = 0;
  List<Map<String,dynamic>> usuario =[];
  void listar()async{
    final u = await Basededatos.getUsuarios();
    setState(() {
      usuario = u;
    });
  }
  @override
  void initState(){
    super.initState();
      listar();
  }

  @override
  void didChangeAppLifecycleState(final AppLifecycleState state){
    if (state == AppLifecycleState.resumed){
      setState(() {
        listar();
      });
    }
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LISTADO USUARIOS"),
        backgroundColor: Colors.black,
        actions: [IconButton(
          onPressed: (){
            Navigator.pushNamed(context, '/frmregistro'); 
          }, 
          icon: const Icon(Icons.person_add_alt))
        ],
      ),
      body: ListView.builder(
        itemCount: usuario.length,
        itemBuilder: (context, index) => Card(
          color:Colors.white,
          margin: const EdgeInsets.all(5),
          child: ListTile(
            title: Text(usuario[index]["nombres"] + " " + usuario[index]["apellidos"], style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
            subtitle: Text(usuario[index]["correo"], style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
          trailing: SizedBox(
            width: 100,
            child: Row(
             children: [
               IconButton(
                 onPressed: (){
                  Navigator.pushNamed(context, '/editar',
                  arguments: {"id": usuario[index]["id"], 
                              "nombres":usuario[index]["nombres"], 
                              "apellidos":usuario[index]["apellidos"],
                              "correo":usuario[index]["correo"],});
                 },
                 icon: const Icon(Icons.edit)
                ),
               IconButton(
                 onPressed: (){
                   mostrarAlerta2(usuario[index]["id"]);
                  },
                 icon: const Icon(Icons.delete)
                ),
             ],
            ),
          ),
          ),
        )
      ),
    );
  }

  void eliminar(int id) async{
    await Basededatos.eliminarUsu(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Borrado sactifactoriamente!")));
    listar();
  }
  
  

  mostrarAlerta2(int id){
     Widget okBoton = TextButton(
      onPressed: (){
        eliminar(id);
        Navigator.pop(context);
      },
      child: const Text("Aceptar")
    );

    Widget Cancelar = TextButton(
      onPressed: (){
        Navigator.pop(context);
      },
      child: const Text("Cancelar")
    );
    
    AlertDialog alerta = AlertDialog(
      title: const Text("Confirmacion"),
      content: const Text("¿Desea eliminar?"),
      actions: [
        okBoton,Cancelar
      ],
    );

    showDialog(
     context: context,
     builder: (BuildContext context){
      return alerta;
     }
    );
  }
}
