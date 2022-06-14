import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ia2022/delete.dart';

class Check extends StatefulWidget{
  const Check({Key? key}) : super(key: key);

  @override
  _CheckState createState() => _CheckState();
}
class _CheckState extends State<Check> {
  dynamic listItems;
  int read = 0;

  Future<void> readFile() async {
    final input = File('/Users/skyflare/StudioProjects/ia2022/assets/my_file.txt').openRead();
    listItems = await input
        .transform(utf8.decoder)
        .transform(new CsvToListConverter())
        .toList();
     print(listItems[0][0].toString());
    setState(() {
      read++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text("Review Past Task"),
          ),
          body: Center(
            child: Column(
            children: <Widget> [
              Container(
                padding: const EdgeInsets.all(20),
                child: RaisedButton(
                  child: Text('Update'),
                  onPressed: readFile
                ),
              ),
              listItems == null
                  ? Container()
                  : Expanded(
                child: ListView.separated(
                  itemCount: listItems[0].length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.remove),
                      title: Text(listItems[0][index]),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                ),
              ),
            ]
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.delete),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Delete(),
                )
            );
          },
        ),
      );
  }
}
//
// void _onSelectionChanged(DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs) {
//   String search = dateRangePickerSelectionChangedArgs.value.toString();
//   FileHandler.instances.searchMap(search);
// }
