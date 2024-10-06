import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:try_hive/screens/constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool loading = false;

  final _myBox = Hive.box("usersBox");

  void loginUser() async {
    if (_myBox.get("email") == _email.text && _myBox.get("password") == _password.text) {
      print(_myBox.get("email"));
      print(_myBox.get("password"));

      Navigator.pushNamed(context, "/");
    } else {
      print("Invalid input");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
          key: _formState,
          child: ListView(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.07),
            children: [
              navAlternative(context, "register", "Sign Up"),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.05,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == "") {
                      return "Email field required";
                    }
                    return null;
                  },
                  controller: _email,
                  decoration: inputDecorTheme("Email"),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.05,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  validator: (value) {
                    if (value == "") {
                      return "Password field cannot be left blank";
                    }
                    return null;
                  },
                  controller: _password,
                  decoration: inputDecorTheme("Password"),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.05,
                ),
                child: TextButton(
                  onPressed: () {
                    if (_formState.currentState!.validate()) {
                      setState(() {
                        loading = true;
                      });
                      loginUser();
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.brown,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: loading == false
                        ? const Text(
                            "LOGIN",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              letterSpacing: 1.2,
                            ),
                          )
                        : const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "processing...",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              SizedBox(width: 10),
                              CircularProgressIndicator(
                                color: Colors.white,
                              )
                            ],
                          ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
