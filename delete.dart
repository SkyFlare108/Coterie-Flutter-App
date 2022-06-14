import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ia2022/filestorage.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Delete extends StatefulWidget{
  const Delete({Key? key}) : super(key: key);

  @override
  _DeleteState createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Delete Task"),
          backgroundColor: Colors.red,
        ),
        body: Center(
            child: Column(
                children: <Widget> [
                  Container(
                      padding: const EdgeInsets.all(20),
                      child: const Text("Select the date you would like to delete a task on")
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: SfDateRangePicker(
                      view: DateRangePickerView.month,
                      onSelectionChanged: _onSelectionChanged,
                    ),
                  ),
                ]
            )
        )
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs) {
    String search = formatter.format(dateRangePickerSelectionChangedArgs.value);
    //print(search);
    // String search2 = dateRangePickerSelectionChangedArgs.value.toString();
    // print(search2);
    FileHandler.instances.delete(search);
  }
}
