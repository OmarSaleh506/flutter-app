import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formkey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var _email = "";
  var _password = "";
  var _username = "";
  bool isLoginPage = false;
  // startAuth() {
  //   final validity = _formkey.currentState!.validate();
  //   FocusScope.of(context).unfocus();
  //   if (validity) {
  //     _formkey.currentState!.save();
  //     submitform(_email, _password, _username);
  //   }
  // }

  // submitform(String email, String password, String usaername) async {
  //   final auht = FirebaseAuth.instance;
  //   UserCredential authResult;
  //   try {
  //     if (isLoginPage) {
  //       authResult = await auht.signInWithEmailAndPassword(
  //           email: email, password: password);
  //     } else {
  //       authResult = await auht.signInWithEmailAndPassword(
  //           email: email, password: password);
  //       String uid = authResult.user!.uid;
  //       await FirebaseFirestore.instance
  //           .collection("users")
  //           .doc(uid)
  //           .set({"username": usaername, "email": email});
  //     }
  //   } catch (err) {
  //     print(err);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView(children: [
        Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isLoginPage)
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      key: ValueKey('UserName'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'incorrect UserName';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _username = value!;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10),
                              borderSide: new BorderSide()),
                          labelText: "Enter UserName",
                          labelStyle: GoogleFonts.roboto()),
                    ),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    key: ValueKey('email'),
                    validator: (value) {
                      if (value!.isEmpty || !value.contains("@")) {
                        return 'incorrect email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10),
                            borderSide: new BorderSide()),
                        labelText: "Enter Email",
                        labelStyle: GoogleFonts.roboto()),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    key: ValueKey('Password'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'incorrect Password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value!;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10),
                            borderSide: new BorderSide()),
                        labelText: "Enter Password",
                        labelStyle: GoogleFonts.roboto()),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 70,
                    width: double.infinity,
                    padding: EdgeInsets.all(7),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: isLoginPage
                            ? Text(
                                "SignUp",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isLoginPage = !isLoginPage;
                        });
                      },
                      child: isLoginPage
                          ? Text("Already a Member?")
                          : Text('Not a Member?'),
                    ),
                  )
                ],
              )),
        )
      ]),
    );
  }
}
