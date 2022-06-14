// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:ia2022/home.dart';
// import 'package:ia2022/user.dart';
import 'package:ia2022/check.dart';
import 'package:ia2022/linkedlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:ia2022/filestorage.dart';
import 'package:intl/intl.dart';
import 'data.dart';
import 'dart:core';


import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'datadao.dart';

class Status extends StatefulWidget {

  const Status({Key? key}) : super(key: key);

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {

  static final DateFormat formatter = DateFormat('yyyy-MM-dd');

  var list = HariLinkedList();
  final _fKey = GlobalKey<FormState>();
  final _sKey = GlobalKey<ScaffoldState>();

  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      key: _sKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Request',
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Raleway',
              color: Colors.white,
              fontWeight: FontWeight.w500,
            )
        ),
        backgroundColor: Colors.green,
      ),
      body: Form(
        key: _fKey,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 24),
          child: Column(
              children: <Widget>[
                // if (state.contains('2/'))
                // TextFormField(
                //   controller: taskTitleController,
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return ("Enter a Date");
                //     } else {
                //       return null;
                //     }
                //   },
                //   decoration: const InputDecoration(
                //       hintText: "Today's Date"
                //   ),
                // ),
                TextFormField(
                  controller: descriptionController,
                  // validator: (value) {
                  //   if (value!.isEmpty) {
                  //     return ("Enter a Description");
                  //   } else {
                  //     return null;
                  //   }
                  // },
                  decoration: const InputDecoration(
                      hintText: "Description"
                  ),
                ),
                  Container(
                    child: SfDateRangePicker(
                      view: DateRangePickerView.month,
                      onSelectionChanged:
                      _onSelectionChanged,
                      minDate: DateTime.now(),
                    ),
                  ),
                  RaisedButton(
                      child: const Text("Personal Records"),
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Check()
                            )
                        );
                      }
                  ),
              ]
          ),
        ),
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs) {

    //Remove TIme from DateTime variable and convert to String
    String key = formatter.format(dateRangePickerSelectionChangedArgs.value);
    //Add our Date and Description to HariLinkedList
    list.addString(key, descriptionController.text);
    //Write our LinkedList to our File
    FileHandler.instances.writeData(list);

    //Store to Database
    final dataDao = DataDao();
    final message = Data(key, descriptionController.text);
    dataDao.saveMessage(message);
    //list.remove();
  }
}

//String key = dateRangePickerSelectionChangedArgs.value.toString();
