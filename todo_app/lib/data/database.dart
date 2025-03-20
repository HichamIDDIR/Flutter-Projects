import 'package:hive_flutter/hive_flutter.dart';

class tododatabase {
  List thelist = [];

  // refrence out box
  final _myBox = Hive.box('myBox');
  // run this method if thhis is the 1st time running the app, it will have 2 tasks to start with
  void createInitialData() {
    thelist = [
      ["This is a todo app, add a new task below ", false],
    ];
  }

  // load thedata from the data base
  void loadData() {
    thelist = _myBox.get("TODOLIST");
  }

  //update te data base
  void updateData() {
    _myBox.put("TODOLIST", thelist);
  }
}
