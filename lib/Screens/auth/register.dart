import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:try_hive/Screens/constants.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  bool loading = false;

  final _mybox = Hive.box("usersBox");

  void registerUser(String name, String email, String password) async {
    try{
      _mybox.put("username", name);
      _mybox.put("email", email);
      _mybox.put("password", password);

      print("$name - $email - $password");

      Navigator.pushNamed(context, "/");
    }catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formState,
        child: ListView(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.07),
          children: [
            navAlternative(context, "login", "Log In"),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.03,
              ),
              child: TextFormField(
                validator: (value) {
                  if (value == "") {
                    return "Input field cannot be left blank";
                  }
                  return null;
                },
                controller: _userName,
                decoration: inputDecorTheme("Username"),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.03,
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
                vertical: MediaQuery.of(context).size.height * 0.03,
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
                vertical: MediaQuery.of(context).size.height * 0.03,
              ),
              child: TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                validator: (value) {
                  if (value != _password.text) {
                    return "Passwords dont match.";
                  }
                  return null;
                },
                controller: _confirmPassword,
                decoration: inputDecorTheme("Confirm Password"),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.03,
              ),
              child: TextButton(
                onPressed: () {
                  if (_formState.currentState!.validate()) {
                    setState(() {
                      loading = true;
                    });
                    registerUser(_userName.text, _email.text, _password.text);
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.brown,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: loading == false
                ? const Text(
                    "REGISTER",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "processing...",
                        style: TextStyle(
                          fontSize: 20,
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
        ),
      ),
    );
  }
}
