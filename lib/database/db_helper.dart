import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper getInstance = DBHelper._();
  Database? myDb;
  static final String smartNoteTable = "smart_Note_tb";
  static final String smartNoteId = "smart_Note_id";
  static final String smartNoteTitle = "smart_Note_title";
  static final String smartNoteDesc = "smart_Note_description";
  static final String smartNoteCreatedAt = "smart_Note_CreatedAt";

  Future<Database> initDB() async {
    if (myDb != null) {
      return myDb!;
    } else {
      myDb = await openDB();
      return myDb!;
    }
  }

  Future<Database> openDB() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, "smartNoteDatabase.db");
    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        db.execute(
          "create table ($smartNoteId integer primary key autoincrement, $smartNoteTitle text, $smartNoteDesc text, $smartNoteCreatedAt text ) ",
        );
      },
    );
  }

  //* Create Smart Note
  Future<bool> addSmartNote({
    required String mTitle,
    required String mDesc,
  }) async {
    Database db = await initDB();
    int rowsEffected = await db.insert(smartNoteTable, {
      smartNoteTitle: mTitle,
      smartNoteDesc: mDesc,
      smartNoteCreatedAt: DateTime.now().millisecondsSinceEpoch,
    });
    return rowsEffected > 0;
  }

  //* read smart note
  Future<List<Map<String, dynamic>>> fetchAllSmartNotes() async {
    Database db = await initDB();

    return db.query(smartNoteTable);
  }

  //* update smart note
  Future<bool> updateSmartNote({
    required String mTitle,
    required String mDesc,
    required String id,
  }) async {
    Database db = await initDB();
    int rowsEffected = await db.update(
      smartNoteTable,
      {smartNoteTitle: mTitle, smartNoteDesc: mDesc},
      where: '$smartNoteId = ?',
      whereArgs: ['$id'],
    );
    return rowsEffected > 0;
  }

  //*delete smart note
  Future<bool> deleteSmartNote({required String id}) async {
    Database db = await initDB();
    int rowsEffected = await db.delete(
      smartNoteTable,
      where: "$smartNoteId = ?",
      whereArgs: ['$id'],
    );
    return rowsEffected > 0;
  }
}
