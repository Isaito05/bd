import 'package:flutter/material.dart';
import '../bd/basededatos.dart';

class Editar extends StatefulWidget {
  const Editar({super.key});

  @override
  State<Editar> createState() => _EditarState();
}

class _EditarState extends State<Editar> {
  TextEditingController cNombre = TextEditingController();
  TextEditingController cApellido = TextEditingController();
  TextEditingController cCorreo = TextEditingController();
  int respuesta = 0;
  int id = 0;
  late BuildContext cnt;
  void datos(String nombre, apellido, correo){
    // final u = await Basededatos.getUsuario();
    setState(() {
      cNombre.text=nombre;
      cApellido.text=apellido;
      cCorreo.text=correo;
    });
  }
  // @override
  // void initState(){
  //   super.initState();
  //     datos();
  // }
  
  @override
  Widget build(BuildContext context) {
    cnt = context;
    Map argumentos = ModalRoute.of(context)?.settings.arguments as Map;
    // ignore: non_constant_identifier_names
    String Snombre = argumentos ["nombres"];
    // ignore: non_constant_identifier_names
    String Sapellido = argumentos["apellidos"];
    // ignore: non_constant_identifier_names
    String Scorreo = argumentos["correo"];
    id = argumentos["id"];
    datos(Snombre, Sapellido ,Scorreo); 
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar usuario"),
        actions: [IconButton(
          onPressed: (){
            Navigator.pushNamed(context, '/listado'); 
          }, 
          icon: const Icon(Icons.face))
        ],
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [nombre(),apellido(),correo(),btneditar()],
        
      ),
    );
  }

  

  Widget nombre(){
    return Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: cNombre,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Digite su nombre")
              ),
            ),
          );
  }

  Widget apellido(){
    return Container(
            padding: const EdgeInsets.all(10),
            child:  TextField(
              controller: cApellido,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("DIGITE APELLIDO")
              ),
            ),
          );
  }

  Widget correo(){
    return Container(
            padding: const EdgeInsets.all(10),
            child:  TextField(
              controller: cCorreo,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("DIGITE CORREO")
              ),
            ),
          );
  }

  Widget btneditar(){
    return Container(
            padding: const EdgeInsets.all(10),
             child: ElevatedButton(
              onPressed: (){
                editar();
              }, 
              child:  Text("Editar $id")),
          );
  }

  void editar()async{
     respuesta = await Basededatos.edtUsuario(id, cNombre.text, cApellido.text,cCorreo.text);
      mostrarAlerta();
  }

  mostrarAlerta(){
    Widget okBoton = TextButton(
      onPressed: (){
        Navigator.pop(cnt);
      },
      child: const Text("Aceptar")
    );
    
    AlertDialog alerta = AlertDialog(
      title: const Text("Mensaje"),
      content: const Text("USUARIO EDITADO"),
      actions: [
        okBoton,
      ],
    );

    showDialog(
     context: cnt,
     builder: (BuildContext context){
      return alerta;
     }
    );
  }
}