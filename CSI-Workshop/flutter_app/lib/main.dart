import 'package:flutter/material.dart';
import 'Task.dart';
import 'NewTask.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List list = ['a', 'b'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/background.jpg',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                'Hello There',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff173D7B),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                'Tasks to complete:',
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Container(
            height: 400,
            child: ListView.builder(
              itemCount: Task_list.get_list().length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(Task_list.get_list().toString()),
                  onDismissed: (direction) {
                    setState(() {
                      Task_list.remove_item(index);
                    });
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Task deleted!'),
                    ));
                  },
                  child: Card(
                    color: Colors.blue[50],
                    child: ListTile(
                      title: Text(
                          Task_list.get_task_info(index)['task'].toString()),
                      subtitle: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                Task_list.get_task_info(
                                        index)["task_description"]
                                    .toString(),
                                style: TextStyle(
                                  color: Colors.black54,
                                )),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Category: ' +
                                Task_list.get_task_info(index)["task_type"]
                                    .toString()),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Due: ' +
                                Task_list.get_task_info(index)["task_time"]
                                    .toString()),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.pinkAccent,
        splashColor: Colors.purple,
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => NewTask()));
        },
      ),
    );
  }
}
