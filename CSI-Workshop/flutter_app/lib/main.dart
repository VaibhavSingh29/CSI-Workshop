import 'package:flutter/material.dart';
import 'package:flutter_app/NewTask.dart';
import 'package:flutter_app/Task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  List list=["a", "b"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
         Stack(
           children: [
             Container(
               height: 200,
               width: MediaQuery.of(context).size.width,
               color: Colors.greenAccent,
             ),
             Text('Hello there!!'),

           ],
         ),
          Text('Tasks to complete 12'),
          Container(
            height: 400,
            child: ListView.builder(
              itemCount: Task_list.get_list().length,
              itemBuilder: (context, index){
                return Dismissible(
                  key: Key(Task_list.get_list().toString()),
                  onDismissed: (direction){
                    setState(() {
                      Task_list.remove_item(index);
                      Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text("Item deleted"),)
                      );
                    });
                  },
                  child: ListTile(
                    title: Row(
                      children: [
                       Text( Task_list.get_task_info(index)['task'].toString()),
                      ],
                    ),
                    subtitle: Column(
                      children: [
                        Text( Task_list.get_task_info(index)['task_description'].toString()),
                        Text( Task_list.get_task_info(index)['task_type'].toString()),
                        Text( Task_list.get_task_info(index)['task_time'].toString()),

                      ],
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
        onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NewTask()));
        },
      ),
    );
  }
}
