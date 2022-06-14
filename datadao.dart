import 'package:firebase_database/firebase_database.dart';
import 'package:ia2022/data.dart';

class DataDao {
  final DatabaseReference _messagesRef = FirebaseDatabase.instance.reference().child('messages');

  void saveMessage(Data message) {
    _messagesRef.push().set(message.toJson());
  }

  Query getMessageQuery() {
    return _messagesRef;
  }

}





