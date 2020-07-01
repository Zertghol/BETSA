import 'dart:async';

import 'package:barnett_electric_timesheet_app/model/timesheet.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String tableTS = 'timesheet';
  final String columnSent = 'sent';
  final String columnName = 'name';
  final String columnJobNo = 'jobNo';
  final String columnJobName = 'JobName';
  final String columnWeek = 'week';
  final String columnMonHours = 'monHours';
  final String columnMonOT = 'monOT';
  final String columnMonDT = 'monDT';
  final String columnTueHours = 'tueHours';
  final String columnTueOT = 'tueOT';
  final String columnTueDT = 'tueDT';
  final String columnWedHours = 'wedHours';
  final String columnWedOT = 'wedOT';
  final String columnWedDT = 'wedDT';
  final String columnThurHours = 'thurHours';
  final String columnThurOT = 'thurOT';
  final String columnThurDT = 'thurDT';
  final String columnFriHours = 'friHours';
  final String columnFriOT = 'friOT';
  final String columnFriDT = 'friDT';
  final String columnSatHours = 'satHours';
  final String columnSatOT = 'satOT';
  final String columnSatDT = 'satDT';
  final String columnSunHours = 'sunHours';
  final String columnSunOT = 'sunOT';
  final String columnSunDT = 'sunDT';

  static Database _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'timesheets.db');

//    await deleteDatabase(path); // just for testing

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE timesheet(sent int,name Text,jobNo int primary key not null,jobName Text,week Text not null,monHours int,monOT int,monDT int, tueHours,tueOT int,tueDT int,wedHours int,wedOT int,wedDT int,thurHours int,thurOT int,thurDT int,friHours int,friOT int,friDT int,satHours int,satOT int,satDT int,sunHours int,sunOT int,sunDT int)');
  }

  Future<int> saveTimeSheet(TimeSheet ts) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableTS, ts.toMap());
//    var result = await dbClient.rawInsert(
//        'INSERT INTO $tableTimeSheet ($columnTitle, $columnDescription) VALUES (\'${ts.title}\', \'${ts.description}\')');

    return result;
  }

  Future<List> getAllTimeSheets() async {
    var dbClient = await db;
    var result = await dbClient.query(tableTS, columns: [columnSent, columnName, columnJobNo, columnJobNo, columnWeek, columnMonHours, columnMonOT, columnMonDT, columnTueHours, columnTueOT, columnTueDT, columnWedHours, columnWedOT, columnWedDT, columnThurHours, columnThurOT, columnThurDT, columnFriHours, columnFriOT, columnFriDT, columnSatHours, columnSatOT, columnSatDT, columnSunHours, columnSunOT, columnSunDT]);
//    var result = await dbClient.rawQuery('SELECT * FROM timesheet');

    return result.toList();
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(await dbClient.rawQuery('SELECT COUNT(*) FROM $tableTS'));
  }

  Future<TimeSheet> getTimeSheet(int jobNo, String week) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableTS,
        columns: [columnSent, columnName, columnJobNo, columnJobNo, columnWeek, columnMonHours, columnMonOT, columnMonDT, columnTueHours, columnTueOT, columnTueDT, columnWedHours, columnWedOT, columnWedDT, columnThurHours, columnThurOT, columnThurDT, columnFriHours, columnFriOT, columnFriDT, columnSatHours, columnSatOT, columnSatDT, columnSunHours, columnSunOT, columnSunDT],
        where: '$columnJobNo = ? AND  $columnWeek = ?',
        whereArgs: [jobNo, week]);
//    var result = await dbClient.rawQuery('SELECT * FROM $tableTimeSheet WHERE $columnId = $id');

    if (result.length > 0) {
      return new TimeSheet.fromMap(result.first);
    }

    return null;
  }

  Future<int> deleteTimeSheet(int jobNo, String week) async {
    var dbClient = await db;
    return await dbClient.delete(tableTS, where: '$columnJobNo = ? AND $columnWeek = ?', whereArgs: [jobNo, week]);
//    return await dbClient.rawDelete('DELETE FROM $tableTimeSheet WHERE $columnId = $id');
  }

  Future<int> updateTimeSheet(TimeSheet  ts) async {
    var dbClient = await db;
    return await dbClient.update(tableTS, ts.toMap(), where: "$columnJobNo = ? AND $columnWeek = ?", whereArgs: [ts.jobNo, ts.week]);
//    return await dbClient.rawUpdate(
//        'UPDATE $tableTimeSheet SET $columnTitle = \'${ts.title}\', $columnDescription = \'${ts.description}\' WHERE $columnId = ${ts.id}');
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}