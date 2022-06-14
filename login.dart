import 'package:flutter/material.dart';
import 'package:ia2022/authentication.dart';
import 'package:ia2022/signup.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coterie",
            style: TextStyle(
              fontSize: 30,
            )
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text( "Neighborhood Login",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Username",
                  )
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: "Password",
                  )
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: RaisedButton(
                  child: const Text("Login"),
                  onPressed: () {
                    context.read<Authentication>().signIn(
                      //name: nameController.text.trim(),
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                  }
              ),
            ),
            ElevatedButton(
                child: const Text("Sign up"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignUp()),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}



