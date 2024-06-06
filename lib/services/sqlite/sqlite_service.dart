// import 'package:sqflite/sqflite.dart';

// class SqliteService {

//   late var _databasesPath;

//   static final SqliteService _sqliteService = SqliteService._internal();
//   SqliteService._internal()async {
//     databasesPath = await getDatabasesPath();
//   }

//   factory SqliteService() {
//     return _sqliteService;
//   }

//   Future<void> init() async {
//     // Initialize the database
//   }

//   Future<void> insert(String table, Map<String, dynamic> data) async {
//     // Insert data into the table
//   }

//   Future<void> update(String table, Map<String, dynamic> data) async {
//     // Update data in the table
//   }

//   Future<void> delete(String table, int id) async {
//     // Delete data from the table
//   }
//   Future<void> getDatabasePath() async {
//     // Get the database path
//   }

//   Future<List<Map<String, dynamic>>> select(String table) async {
//     // Select data from the table
//     return [];
//   }

//   Future<void> close() async {
//     // Close the database
//   }
// }
