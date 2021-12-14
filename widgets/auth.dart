import 'package:flutter/material.dart';
import '../widgets/animation.dart';
import '../widgets/picker.dart';
import 'dart:io';

class AuthWidget extends StatefulWidget {

  final void Function(String email, String password, String username, File image ,bool is_Login, BuildContext context) submitAuth;

  final bool is_loading;

  AuthWidget(this.submitAuth, this.is_loading);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  final formKey = GlobalKey<FormState>();
  var is_Login = true;
  String email = "";
  String username = "";
  String password = "";
  File _userImageFile;

  void pickimageFile(File image) {
    _userImageFile = image;
  }

  void tryToSubmt() {
    final isValid =formKey.currentState.validate();

    FocusScope.of(context).unfocus();

    if(_userImageFile == null && !is_Login) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please pick a image"),
        backgroundColor: Theme.of(context).errorColor,
      )
      );
      return;
    }

    if(isValid) {
      formKey.currentState.save();
      widget.submitAuth(email.trim(), username.trim(), password, _userImageFile  ,is_Login, context);
    }
    print(email);
    print(username);
    print(password);
  }

  @override
  Widget build(BuildContext context) {


    return  SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background.png'),
                      fit: BoxFit.fill
                  )
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 30,
                    width: 80,
                    height: 200,
                    child: FadeAnimation(1, Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/light-1.png')
                          )
                      ),
                    )),
                  ),
                  Positioned(
                    left: 140,
                    width: 80,
                    height: 150,
                    child: FadeAnimation(1.3, Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/light-2.png')
                          )
                      ),
                    )),
                  ),
                  Positioned(
                    right: 40,
                    top: 40,
                    width: 80,
                    height: 150,
                    child: FadeAnimation(1.5, Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/clock.png')
                          )
                      ),
                    )),
                  ),
                  Positioned(
                    child: FadeAnimation(1.6, Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Center(
                        child: Text(is_Login ? "Login": "Sign Up", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                      ),
                    )),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  FadeAnimation(1.8, Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, .2),
                              blurRadius: 20.0,
                              offset: Offset(0, 10)
                          )
                        ]
                    ),
                    child: Form(
                      key:formKey ,
                      child: Column(
                        children: <Widget>[

                          ImagePicke(pickimageFile),



                        TextFormField(

                          onSaved: (value) {
                              email = value;
                          },
                                      validator: (value) {
                                        if(!value.contains("@") || value.isEmpty ) {
                                          return "must be a valid email";
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        labelText: "Email Address"
                                      ),

                                      ),
                                    if(!is_Login)
                                      TextFormField(

                                        onSaved: (value) {
                                          username = value;
                                        },
                                        validator: (value) {
                                          if(value.isEmpty || value.length < 5) {
                                            return "must be a username";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            labelText: "Username"
                                      ),
                                      ),
                                      TextFormField(

                                        onSaved: (value) {
                                          password = value;
                                        },
                                        validator: (value) {
                                          if(value.isEmpty || value.length < 5) {
                                            return "must be a password";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            labelText: "password"
                                        ),
                                        obscureText: true,
                                      ),
                                      SizedBox(height: 12,),
                                      if(widget.is_loading)
                                        CircularProgressIndicator(),
                                      if(!widget.is_loading)

                                      ElevatedButton(onPressed: (){
                                        tryToSubmt();
                                      }, child: Text(is_Login ? "Login": "Sign Up"),),

                                      if(!widget.is_loading)
                                      TextButton( child: Text(is_Login ? "Create An Account" : "i aleardy have an account"),
                                        onPressed: (){
                                       setState(() {
                                         is_Login = !is_Login;
                                       });
                                        },)
                        ],
                      ),
                    ),
                  )),
                  SizedBox(height: 30,),

                ],
              ),
            )
          ],
        ),
      ),
    );

    // return Card(
    //   margin: EdgeInsets.all(20),
    //   child: SingleChildScrollView(
    //     child: Padding(
    //         padding: EdgeInsets.all(16),
    //         child: Form(child:
    //           Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               TextFormField(
    //               keyboardType: TextInputType.emailAddress,
    //               decoration: InputDecoration(
    //                 labelText: "Email Address"
    //               ),
    //
    //               ),
    //               TextFormField(
    //                 decoration: InputDecoration(
    //                     labelText: "Username"
    //               ),
    //               ),
    //               TextFormField(
    //                 decoration: InputDecoration(
    //                     labelText: "password"
    //                 ),
    //                 obscureText: true,
    //               ),
    //               SizedBox(height: 12,),
    //               ElevatedButton(onPressed: (){}, child: Text("Login"),),
    //               TextButton(onPressed: (){}, child: Text("Create An Account"),)
    //           ],)
    //           ,)
    //     ),
    //   ),
    // );
  }
}
