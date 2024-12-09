import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  final database = await openDatabase(
    join(await getDatabasesPath(), 'inven_track.db'),
    onCreate: (db, version) async {
      // Create the 'units' table
      await db.execute('''CREATE TABLE units (
            id INTEGER PRIMARY KEY, 
            name TEXT NOT NULL UNIQUE
        )''');

      // Create the 'products' table
      await db.execute('''CREATE TABLE products (
            id INTEGER PRIMARY KEY, 
            name TEXT NOT NULL,
            unit_id INTEGER NOT NULL, 
            buyingPricePerUnit REAL NOT NULL,
            sellingPricePerUnit REAL NOT NULL,
            imageOfProduct TEXT,
            FOREIGN KEY (unit_id) REFERENCES units(id)
        )''');
    },
    version: 1,
  );
}
