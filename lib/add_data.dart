import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'List_map_provider.dart';
class AddData extends StatelessWidget {
  const AddData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Me"),
      ),
      body: Center(
        child: IconButton(
          onPressed: (){
            context.read<ListMapProvider> ().addData({
              "name":"Contacts Name",
              "mobNo":"9857895848",
            });
          },
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
