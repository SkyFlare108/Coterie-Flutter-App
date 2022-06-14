import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ia2022/authentication.dart';

class SignUp extends StatefulWidget{
  const SignUp({Key? key}) : super(key: key);


  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.abc),
        backgroundColor: Colors.green,
        title: const Text("Sign Up"),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                TextFormField(
                    controller: email,
                    decoration: const InputDecoration(
                      labelText: "Email",
                    )
                ),
                TextFormField(
                    controller: password,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      errorText: "Password must be at least 6 characters",
                    )
                ),
                TextFormField(
                    controller: name,
                    decoration: const InputDecoration(
                      labelText: "Name",
                    )
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<Authentication>().signUp(
                          email: email.text.trim(),
                          password: password.text.trim(),
                          name: name.text.trim(),
                        );
                      }, child: const Text("Register"),
                    ),
                ),
              ]
          )
      ),
    );
  }
}

