// import 'package:ia2022/login.dart';
// import 'package:ia2022/listnode.dart';
// import 'package:ia2022/map.dart';
import 'dart:collection';
import 'dart:io';
import 'package:ia2022/linkedlist.dart';

class FileHandler {

  FileHandler._privateConstructor();
  static final FileHandler instances = FileHandler._privateConstructor();
  static final SplayTreeMap _userMap = SplayTreeMap<String, String>();

  Future<File> get localFile async {
    return File('/Users/skyflare/StudioProjects/ia2022/assets/my_file.txt');
  }

  Future<void> writeData(HariLinkedList list) async{
    final file = await localFile;
    _userMap[list.front!.data.toString()] = list.front!.data2.toString();
    await file.writeAsString(_userMap.toString());
  }

  Future<void> clear() async{
    final file = await localFile;
    file.writeAsStringSync("");
  }

  Future<void> delete(String search) async{
    //print(search);
    final file = await localFile;
    if(_userMap.containsKey(search)){
      _userMap.remove(search);
      clear();
      await file.writeAsString(_userMap.toString());
      print("Success");
    } else{
      print("You didn't request on this day");
    }
  }

  void searchMap(String search) async{
    if(_userMap.containsKey(search)){
      //print(_userMap[search]);
      print("True");
    } else{
      print("False");
    }
  }
}


