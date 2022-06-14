// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ia2022/authentication.dart';
import 'package:ia2022/data.dart';
import 'package:ia2022/datadao.dart';
import 'package:ia2022/request page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //final fb = FirebaseDatabase.instance.reference().child('messages');
  final _firebaseRef = FirebaseDatabase().reference().child('messages');

  @override
  Widget build(BuildContext context) {
    String? displayName = FirebaseAuth.instance.currentUser!.displayName;
    final send = Provider.of<Authentication>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard",
            style: TextStyle(
              fontSize: 30,
            )
        ),
      ),
      body:
      Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(30),
                child: Text("Welcome " + displayName,
                    style: const TextStyle(
                      fontSize: 30,
                    )
                ),
              ),
              RaisedButton(
                  child: const Text("Tasks"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Status()
                      )
                    );
                  }
              ),
              RaisedButton(
                  child: const Text("Sign out"),
                  onPressed: () async {
                    await send.signOut();
                    //context.read<Authentication>().signOut;
                  }
              ),
              Expanded(
                  child: FirebaseAnimatedList(
                      query: _firebaseRef,
                      itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
                        return ListTile(
                          title: Text(snapshot.value['text']),
                          subtitle: Text(snapshot.value['date']),
                          leading: IconButton(icon: const Icon(Icons.check_box_outline_blank_outlined),
                            onPressed: () =>
                            _firebaseRef.child(snapshot.key).remove(),
                          ),
                        );
                      }
                  )
              )
            ],
          )
        )
      );
    }
}


