import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_list/database/database_sqlite.dart';

class ApplicationController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
    print("abrindo conexão");
    openData();
  }

  @override
  void onClose() {
    print("fechando banco");
    super.onClose();
  }

//abrindo o banco duas vezes
  Future<Database> openData() async {
    final database = await DatabaseSqlite().openConnnection();
    return database;
  }
}
