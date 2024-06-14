import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = "BD.db";
  static final _databaseVersion = 1;

  static final table = 'Funcionarios';
  static final columnSenha = 'senha';
  static final columnName = 'name';

  DatabaseHelper._construtor();
  static final DatabaseHelper instance = DatabaseHelper._Construtor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (db, version) {
        db.execute(
          ''' CREATE TABLE $table (
      $columnName STRING PRIMARY KEY, 
      $columnSenha INTEGER NOT NULL)''',
        );
      },
    );
  }
}
