import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
 static final _databaseName = "app_database.db";
 static final _databaseVersion = 1;

 static final profileTable = 'profile';
 static final landTable = 'land';

 static final profileColumnId = '_id';
 static final profileColumnName = 'name';
 static final profileColumnRole = 'role';
 static final profileColumnAddress = 'address';

 static final landColumnId = '_id';
 static final landColumnLandName = 'name';
 static final landColumnAddress = 'address';
 static final landColumnAreaSize = 'area_size';
 static final landColumnOwnershipCertificate = 'ownership_certificate';
 static final landColumnIspoCertificate = 'ispo_certificate';

 // Singleton class
 DatabaseHelper._privateConstructor();
 static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

 // Database reference
 static late Database _database;

 // Getter for the database instance
 static Future<Database> get database async {
    if (_database == null) {
      _database = await _initDatabase();
    }
    return _database;
 }

Future<List<Map<String, dynamic>>> getProfiles() async {
  // Use DatabaseHelper.database getter
  final db = await DatabaseHelper.database;
  return await db.query(profileTable);
}

Future<void> _insertProfile(BuildContext context, String name, String role, String address) async {
    // Wait for the database to be initialized
  await DatabaseHelper.database;
  // Ensure database is initialized
  final db = await DatabaseHelper.database;
  }

Future<void> deleteProfile(int id) async {
  // Use DatabaseHelper.database getter
  final db = await DatabaseHelper.database;
 await db.delete(
    profileTable,
    where: '$profileColumnId = ?',
    whereArgs: [id],
 );
}

  Future<void> updateProfile(int id, String name, String role, String address) async {
    // Use DatabaseHelper.database getter
    final db = await DatabaseHelper.database;
 await db.update(
    profileTable,
    {
      profileColumnName: name,
      profileColumnRole: role,
      profileColumnAddress: address,
    },
    where: '$profileColumnId = ?',
    whereArgs: [id],
 );
}

 // Initialize the database
 static Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE $profileTable (
            $profileColumnId INTEGER PRIMARY KEY,
            $profileColumnName TEXT NOT NULL,
            $profileColumnRole TEXT NOT NULL,
            $profileColumnAddress TEXT NOT NULL
          )
          ''');
        return db.execute('''
          CREATE TABLE $landTable (
            $landColumnId INTEGER PRIMARY KEY,
            $landColumnLandName TEXT NOT NULL,
            $landColumnAddress TEXT NOT NULL,
            $landColumnAreaSize TEXT NOT NULL,
            $landColumnOwnershipCertificate TEXT NOT NULL,
            $landColumnIspoCertificate TEXT NOT NULL
          )
          ''');
      },
    );
 }

}