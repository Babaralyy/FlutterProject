import 'package:first_fluuter_project/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 100.0,
                ),
                Image.asset("assets/images/login_image.png", fit: BoxFit.cover),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Welcome $name",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),


                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Username", hintText: "Enter username"),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Username can not be empty";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Enter password",
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Password can not be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        InkWell(
                          onTap: () async {
                            if(_formKey.currentState!.validate()){
                              setState(() {
                                changeButton = true;
                              });
                              await Future.delayed(Duration(seconds: 1));
                              await Navigator.pushNamed(
                                  context, MyRoutes.homeRoute);
                              setState(() {
                                changeButton = false;
                              });
                            }

                          },
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changeButton ? 50.0 : 150.0,
                            height: 50.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                // shape: changeButton? BoxShape.circle : BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(
                                    changeButton ? 50.0 : 8.0)),
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),

                )
              ],
            ),
          ),
        ));
  }
}
