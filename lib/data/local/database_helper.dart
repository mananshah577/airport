import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = "airport.db";
  static const _databaseVersion = 1;
  static const table = 'airport';
  static const columnId = '_id';
  static const columnAirportIcao = 'icao';
  static const columnAirportIata = 'iata';
  static const columnAirportName = 'name';
  static const columnAirportCity = 'city';
  static const columnAirportState = 'state';
  static const columnAirportCountry = 'country';
  static const columnAirportElevation = 'elevation';
  static const columnAirportLatitude = 'lat';
  static const columnAirportLongitude = 'lon';
  static const columnAirportTimeZone = 'tz';

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $table($columnAirportIcao TEXT PRIMARY KEY,$columnAirportIata TEXT,$columnAirportName TEXT,$columnAirportCity TEXT,$columnAirportState TEXT,$columnAirportCountry TEXT,$columnAirportElevation INTEGER,$columnAirportLatitude REAL,$columnAirportLongitude REAL,$columnAirportTimeZone TEXT)');
  }

  Future<dynamic> fetchAirportData() async {
    Database? db = await instance.database;
    return await db!.rawQuery("SELECT * FROM $table");
  }

  Future<void> insertAirport(Map<String, dynamic> airport) async {
    final db = await database;
    await db?.insert(table, airport);
  }
}
