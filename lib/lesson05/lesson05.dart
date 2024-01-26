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
  TextEditingController updateController = TextEditingController();

  void cancel() {
    Navigator.pop(context);
  }

  void add() {
    setState(() {
      names.add(addController.text);
    });
    cancel();
  }

  void delete(int index) {
    setState(() {
      names.removeAt(index);
    });

    cancel();
  }

  void update(int index){
    setState(() {
      names[index] = updateController.text;
    });
    cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: names.isEmpty
            ? const Center(child: Text("No data"))
            : ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, index) {
              return bodyList('${names[index]}', index);
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return alertDialog("Add data", addController, "Add", (){add();});
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget bodyList(String text, int index, ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        color: Colors.amber,
        child: Center(
            child: ListTile(
              title: Text(text),
              trailing: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    button(Icons.delete, () {showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("do you wanna delete?"),
                            actions: [
                              buttonText("Cancel", (){cancel();}),
                              buttonText("Delete", (){delete(index);}),
                            ],
                          );
                        });}),
                    button(Icons.edit, () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return alertDialog(
                                'update data', updateController, "Edit", () {update(index);});
                          });
                    }),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Widget button(IconData iconData, Function() onTap) {
    return IconButton(onPressed: onTap, icon: Icon(iconData));
  }

  Widget alertDialog(String text, TextEditingController textEditingController,
      String textO, Function() onTap) {
    return AlertDialog(
        title: Text(text),
        content: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: text,
            )),
        actions: [
          buttonText('Cancel', () {
            cancel();
          }),
          buttonText(textO, onTap)
        ]);
  }

  Widget buttonText(String text, Function() onTap) {
    return TextButton(
      onPressed: onTap,
      child: Text(text),
    );
  }
}
