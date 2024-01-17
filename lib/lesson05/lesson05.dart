import 'package:flutter/material.dart';

class Lesson05 extends StatefulWidget {
  const Lesson05({super.key});

  @override
  State<Lesson05> createState() => _Lesson05State();
}

class _Lesson05State extends State<Lesson05> {

  //CRUD
  List<String> names = [
    'Alice',
    'Bob',

  ];

  TextEditingController addController = TextEditingController();


  void cancel(){
    Navigator.pop(context);
  }

  void add(){
    setState(() {
      names.add(addController.text);
    });
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 100,
                    color: Colors.yellow,
                    child: ListTile(
                      title: Text('${names[index]}'),
                      subtitle: Text('$index'),
                      trailing: IconButton(onPressed: (){

                      }, icon: const Icon(Icons.delete),),
                    )),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Добавить данные'),
                content:  TextField(
                  controller: addController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Добавить данные',
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      cancel();// Закрыть AlertDialog
                    },
                    child: const Text('Отмена'),
                  ),
                  TextButton(
                    onPressed: () {
                      add();// Закрыть AlertDialog
                    },
                    child: const Text('Добавить'),
                  ),
                ],
              );
            },
          );
        },
        child: const Text('add'),
      ),
    );
  }
}
