import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart'as path_provider;
import 'package:zonka_feedback/services/hive/open_hive_box.dart';
import 'package:zonka_feedback/services/hive/register_hive_adaptor.dart';
class HiveService {
  static final HiveService _hiveService = HiveService._internal();
  HiveService._internal();
  factory HiveService() {
    return _hiveService;
  }

 Future<void> init() async  {
     final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
     Hive.init(appDocumentDir.path);
     registerHiveAdaptor();
     await openHiveBox();
  }

  Future<Box> openBox(String boxName) async {
    return  Hive.openBox(boxName);
  }

  
  Future<void> putData(String boxName, String key, dynamic value) async {
    final box = await openBox(boxName);
    await box.put(key, value);
  }

  Future<dynamic> getData(String boxName, String key) async {
    final box = await openBox(boxName);
    return box.get(key);
  }

  Future<void> deleteData(String boxName, String key) async {
    final box = await openBox(boxName);
    await box.delete(key);
  }

  Future<void> clearBox(String boxName) async {
    final box = await openBox(boxName);
    await box.clear();
  }

  Future<void> closeBox(String boxName) async {
    final box = await openBox(boxName);
    await box.close();
  }

  Future<void> deleteBox(String boxName) async {
    await Hive.deleteBoxFromDisk(boxName);
  }

  Future<void> closeHive() async {
    await Hive.close();
  }

  Future<void> deleteHive() async {
    await Hive.deleteFromDisk();
  }

  Future<void> addData(String boxName, dynamic value) async {
    final box = await openBox(boxName);
    await box.add(value);
  }


  

}
