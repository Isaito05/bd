import 'package:flutter/material.dart';

class RegistroEs extends StatefulWidget {
  const RegistroEs({super.key});

  @override
  State<RegistroEs> createState() => _RegistroEsState();
}

class _RegistroEsState extends State<RegistroEs> {
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
                color: const Color(0xff3b5999).withOpacity(0.5),
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
                  
                ],
              ),
            )
          )
        ],
       ),
    );
  }
}