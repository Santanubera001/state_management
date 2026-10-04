import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/List_map_provider.dart';
import 'package:state_management/List_page.dart';
import 'package:state_management/counter.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>ListMapProvider()),
      ChangeNotifierProvider(create: (context)=>Counter()),
    ], child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp(  {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: ListPage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("My Context Bulid");
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Consumer<Counter>(builder: (ctx, _, __) {
          print("My Ctx Build");
          return Text(
            '${Provider.of<Counter>(ctx, listen: true).getCount()}',
            style: TextStyle(fontSize: 28),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<Counter>(context, listen: false).incrementCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
