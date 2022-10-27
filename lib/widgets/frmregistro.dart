import 'package:flutter/material.dart';
import '../bd/basededatos.dart';
class FrmRegistro extends StatefulWidget {
  const FrmRegistro({super.key});

  @override
  State<FrmRegistro> createState() => _FrmRegistroState();
}

class _FrmRegistroState extends State<FrmRegistro> {
  TextEditingController cNombre = TextEditingController();
  TextEditingController cApellido = TextEditingController();
  TextEditingController cCorreo = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  int respuesta = 0;
  late BuildContext cnt;
  @override
  Widget build(BuildContext context) {
     cnt = context;
     return Scaffold(
      appBar: AppBar(
        title: const  Text("REGISTRAR USUARIOS"),
        actions: [IconButton(
          onPressed: (){
            Navigator.pushNamed(context, '/listado'); 
          }, 
          icon: const Icon(Icons.face))
        ],
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [nombre(),apellido(),correo(),password(),btnregistrar()],
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
                label: Text("DIGITE NOMBRE")
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
  
  Widget password(){
    return Container(
            padding: const EdgeInsets.all(10),
            child:  TextField(
              controller: cPassword,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("DIGITE PASSWORD")
              ),
            ),
          );
  }

  Widget btnregistrar(){
    return Container(
            padding: const EdgeInsets.all(10),
             child: ElevatedButton(
              onPressed: (){
                 setState(() {
                   registrar();
                 });
              }, 
              child: const Text("Registrar")),
          );
  }

  void registrar()async{
     respuesta = await Basededatos.regUsuario(cNombre.text, cApellido.text, 
                                          cCorreo.text, cPassword.text);
    cNombre.text = "";
    cApellido.text = "";
    cCorreo.text = "";
    cPassword.text = "";
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
      content: const Text("USUARIO REGISTRADO"),
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