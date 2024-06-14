import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/Path.dart';

Future<Database> openMyDatabase() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'BD.db');
  final database = await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      //Criar as tabelas aqui
    }
  );
  return database;
}