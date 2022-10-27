import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class Basededatos{
  static Future<void> crearTable(Database database) async{
    await database.execute("""CREATE TABLE usuario(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      nombres TEXT NOT NULL,
      apellidos TEXT NOT NULL,
      correo TEXT NOT NULL,
      password TEXT NOT NULL,
      fechaReg TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
    """);
  }

  static Future<Database> db() async{
    return openDatabase(
      'mibd.db',
      version: 1,
      onCreate: (Database database, int version) async{
        await crearTable(database);
      }
    );
  }

  static Future<int> regUsuario(String nombres,
                                String apellidos,
                                String correo,
                                String password) async{
    final c = await db();
    final datos = {'nombres':nombres,
                   'apellidos':apellidos,
                   'correo':correo,
                   'password':password};
    final id = await c.insert('usuario', datos);
    return id;
  }

  // static Future<int> totalReg() async{
  //   final c = await db();
  //   final id = await c.rawQuery("SELECT (*) FROM usuario");
  //   int r = id.length;
  //   return r;
  // }

//  lista todos los usuarios
  static Future<List<Map<String,dynamic>>> getUsuarios() async{
    final c = await db();
    return c.query("usuario", orderBy: "id");
  }

// recupera el usuario que corresponda con el id
  static Future<List<Map<String,dynamic>>> getUsuario(int id) async{
    final c = await db();
    return c.query("usuario", where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<void> eliminarUsu(int id) async{
    final c = await db();
    try{
      await c.delete("usuario", where: "id = ?", whereArgs: [id]);
    }catch(err){
      debugPrint("Error, no se pudo eliminar");
    }
  }

  static Future<int> edtUsuario(int id,
                                String nombres,
                                String apellidos,
                                String correo) async{
    final c = await db();
    final datos = {'nombres':nombres,
                   'apellidos':apellidos,
                   'correo':correo};
    final r = await c.update('usuario', datos, where: "id = ?", whereArgs:[id]);
    return r;
  }
}