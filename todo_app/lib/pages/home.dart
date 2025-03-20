import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/components/dialog_box.dart';
import 'package:todo_app/components/tile.dart';
import 'package:todo_app/data/database.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //refrence the hive box

  final _myBox = Hive.box('myBox');
  tododatabase db = tododatabase();

  @override
  void initState() {
    // if this is the first time the app is run,
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there exist data
      db.loadData();
    }
    // TODO: implement initState
    super.initState();
  }

  // text controller
  final _controller = TextEditingController();

  // list of things to do

  void ifboxchecked(bool? value, int index) {
    setState(() {
      db.thelist[index][1] = !db.thelist[index][1];
    });
    db.updateData();
  }

  // save new task
  void save_task() {
    setState(() {
      db.thelist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void Create_a_Task() {
    showDialog(
      context: context,
      builder: (context) {
        return dialog_box(
          controller: _controller,
          onSave: save_task,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deletetask(int index) {
    setState(() {
      db.thelist.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(
          child: Text(
            'To do List',
            style: TextStyle(color: Colors.white, fontSize: 24.0),
          ),
        ),
      ),
      // a button to add  new task
      floatingActionButton: FloatingActionButton(
        onPressed: Create_a_Task,
        child: Icon(Icons.add),
      ),

      // list of things to do
      body: ListView.builder(
        itemCount: db.thelist.length,
        itemBuilder: (context, index) {
          return TheTile(
            name_of_task: db.thelist[index][0],
            check_of_task: db.thelist[index][1],
            onChanged: (value) => ifboxchecked(value, index),
            deleteFunction: (context) => deletetask(index),
          );
        },
      ),
    );
  }
}
