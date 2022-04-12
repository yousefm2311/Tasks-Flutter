import 'package:bloc/bloc.dart';
import 'package:change_first_login/layout/add.dart';
import 'package:change_first_login/layout/chat.dart';
import 'package:change_first_login/layout/home.dart';
import 'package:change_first_login/shared/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppIntialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int CurrnetIndex = 0;
  List<Widget> slider = [
    const HomePage(),
    const ChatPage(),
    const AddPage(),
  ];
  List<String> appBarName = [
    'Home',
    'Chat',
    'Add',
  ];

  void ChangeBottom(int index) {
    CurrnetIndex = index;
    emit(AppChangeBottom());
  }

  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];
  late Database database;

  void createDatabase() {
    openDatabase(
      'm.db',
      version: 1,
      onCreate: (database, versoin) {
        print("Database Created");
        database
            .execute(
                "CREATE TABLE b(id INTEGER PRIMARY KEY,title TEXT,time TEXT, date TEXT,status TEXT)")
            .then((value) {
          print("Table Created");
        }).catchError((error) {
          print("Error Created");
        });
      },
      onOpen: (database) {
        // ignore: avoid_print
        getDataFromDatabase(database);
        print("Database Opened");
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabase());
    });
  }

   Insert({
    required String? title,
    required String? time,
    required String? date,
  }) async {
     await database.transaction((txn) async {
      txn
          .rawInsert(
        'INSERT INTO b(title,time,date,status) VALUES("$title","$time","$date","new")',
      )
          .then((value) {

        print('$value Inserted Successfully');
        emit(AppInsertDatabase());
        getDataFromDatabase(database);
      }).catchError((Error) {
        print('Error When Inserting New Record ${Error.toString()}');
      });
    });
  }

  void getDataFromDatabase(database)  {
    newTasks = [];
    doneTasks = [];
    archiveTasks = [];
    emit(AppGetLoadDatabase());
    database.rawQuery('SELECT * FROM b').then((value) {
      value.forEach((element){
        if(element['status'] == 'new') {
          newTasks.add(element);
        }
        else if(element['status'] == 'done'){
          doneTasks.add(element);
        }
        else{
          archiveTasks.add(element);
        }
      });
      emit(AppGetDatabase());
    });
  }

  void updateData({
  required String status,
  required int id,
}){
    database.rawUpdate('UPDATE b SET status = ? WHERE id = ?',['$status',id]).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdateDatabase());
    });
  }

  void deleteData({
    required int id,
  }){
    database.rawUpdate('DELETE FROM b WHERE id = ?',[id]).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDatabase());
    });
  }
  bool isBottomSheet = false;
  IconData Ico = Icons.edit;

  void changeBottomSheet({
    required bool isShow,
    required IconData icon,
  }) {
    isBottomSheet = isShow;
    Ico = icon;
    emit(AppChangeBottomSheet());
  }
}
