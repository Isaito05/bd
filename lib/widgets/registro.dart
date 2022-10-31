import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../bd/basededatos.dart';

class RegistroEs extends StatefulWidget {
  const RegistroEs({super.key});

  @override
  State<RegistroEs> createState() => _RegistroEsState();
}

class _RegistroEsState extends State<RegistroEs> {
  TextEditingController cNombre = TextEditingController();
  TextEditingController cApellido = TextEditingController();
  TextEditingController cCorreo = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  int respuesta = 0;
  late BuildContext cnte;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey.shade100,
       body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("imagenes/galaxia.jpg"),
                  fit: BoxFit.fill
                )
              ),

              child: Container(
                padding: const EdgeInsets.only(top: 90, left: 8),
                color: const Color(0xff3b5999).withOpacity(0.3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: "Welcome a ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 243, 237, 235),
                          fontSize: 25,
                          letterSpacing: 2
                        ),
                        children: [
                          TextSpan(
                           text: "Cariñositas Happys!!",
                           style: TextStyle(
                             color: Color.fromARGB(255, 243, 237, 235),
                             fontSize: 25,
                             fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text("Registrate",style: TextStyle(letterSpacing: 1, color: Colors.white, fontSize: 15),)
                  ],
                ),
              ),
            )
          ),
          
          Positioned(
            top:220,
            child: Container(
              height: 400,
              width: MediaQuery.of(context).size.width-40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 252, 252, 255),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(0.8),
                  blurRadius: 10,
                  spreadRadius: 5
                )]
              ),
              child: Column(
                children: [
                  cajaTexto("Digite nombre", Icons.people, cNombre),
                  cajaTexto("Digite apellido", Icons.people, cApellido),
                  cajaTexto("Digite correo", Icons.email, cCorreo),
                  cajaTexto("Digite password", Icons.password, cPassword),
                  btnregistrar()
                ],
              ),
            )
          )
        ],
       ),
    );
  }
  Widget cajaTexto(String hint, IconData ic, TextEditingController cnt){
      return Padding(
        padding: const EdgeInsets.only(left:8, right:8, bottom:4, top:10),
        child: TextField(
          controller: cnt,
          decoration: InputDecoration(
            prefixIcon: Icon(ic, color: Color.fromARGB(255, 29, 40, 201)),
            enabledBorder: const OutlineInputBorder(
              borderSide:BorderSide(color: Color.fromARGB(255, 29, 40, 201)),
              borderRadius: BorderRadius.all(Radius.circular(25))
            ),

            focusedBorder: const OutlineInputBorder(
               borderSide:BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
              borderRadius: BorderRadius.all(Radius.circular(25))
            ),
            hintText: hint, hintStyle: const TextStyle(fontSize: 20, color: Color.fromARGB(255, 29, 40, 201))
          ),
        ),
      );
    }

    Widget btnregistrar(){
    return Container(
            padding: const EdgeInsets.all(10),
             child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
                foregroundColor: Color.fromARGB(255, 255, 255, 255), backgroundColor: Color.fromARGB(255, 62, 73, 230),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10 ),
                textStyle: const TextStyle( fontSize: 20, fontWeight: FontWeight.bold)
              ),
              onPressed: (){
                 setState(() {
                    registrar();
                 });
              }, 
              child: const Text("Registrar", )),
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
        Navigator.pop(context);
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
     context: context,
     builder: (BuildContext context){
      return alerta;
     }
    );
  }
}