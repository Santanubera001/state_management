import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/add_data.dart';

import 'List_map_provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Page"),
      ),
      body: Consumer<ListMapProvider>(
          builder:(ctx, Provider, __){
            var allData=Provider.getData();
            return allData.isNotEmpty? ListView.builder(
              itemCount: allData.length,
              itemBuilder:(_,index)
              {
                return ListTile(
                   title:Text('${allData[index]['name']}'),
                  subtitle: Text('${allData[index]['mobNo']}'),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(onPressed: (){
                          context.read<ListMapProvider>().updateData({
                            "name":"Updated Name",
                            "mobNo":"8974874888",
                          }, index);
                        }, icon: Icon(Icons.edit,color: Colors.blue,)),
                        IconButton(onPressed: (){
                          context.read<ListMapProvider>().deleteData(index);
                        }, icon: Icon(Icons.delete,color: Colors.red,)),
                      ],
                    ),
                  ),
                );
              },):Center(child: Text("No Contacts Yet"),);
          }, ),
      floatingActionButton: FloatingActionButton(onPressed:(){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddData(),));
      },
        child: Icon(Icons.add)
      ),
    );
  }
}
