import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue,
          accentColor: Colors.orange),
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List todos = List();
  String input = "";

  @override
  void initState() {
    super.initState();

    todos.add("Item One");
    todos.add("Item Two");
    todos.add("Item Three");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('MyTodos'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  title: new Text("Add todo List"),
                  content: new TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          setState(() {
                            todos.add(input);
                          });
                          Navigator.of(context).pop();
                        },
                        child: new Text("Add")),
                  ],
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: new ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(todos[index]),
              child: Card(
                  elevation: 4.0,
                  margin: EdgeInsets.all(8.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  child: ListTile(
                    title: new Text(todos[index]),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          todos.removeAt(index);
                        });
                      },
                    ),
                  )),
            );
          }),
    );
  }
}
