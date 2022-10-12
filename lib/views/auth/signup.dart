import 'package:flutter/material.dart';
import 'package:todo_easycompany/data/services/auth.dart';
import 'package:todo_easycompany/views/auth/signin.dart';
import 'package:todo_easycompany/views/todo_list.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({ Key? key }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  //------ VARIABLES ------//
  bool showPassword = false;
  final _formKey = GlobalKey<FormState>();
  
  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController = TextEditingController();

  AuthMethods authMethods = AuthMethods();  

  //------ METHODS ------//
  void signUp() async {
    authMethods.signUpWithEmailAndPassword(_emailTextEditingController.text, _passwordTextEditingController.text)
      .then((value) {        
        Map<String, dynamic> userMap = {
          "email": _emailTextEditingController.text,
        };
        // databaseMethods.uploadUserInfo(userMap);        
        // SharedPref.saveLoggedInSharedPreference(true);
        // SharedPref.saveEmailSharedPreference(_emailTextEditingController.text);
        // SharedPref.saveUsernameSharedPreference(_usernameTextEditingController.text);
        // SharedPref.saveImgUrlSharedPreference(imgUrl != '' ? imgUrl : '');
        
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TodoList()));
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 56),
            color: Colors.white.withOpacity(0.8),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Create an account", style: TextStyle(color: Colors.black, fontSize: 50, fontWeight: FontWeight.bold),),
                  SizedBox(height: 12,),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(height: 24,),
                        TextFormField(
                          controller: _emailTextEditingController,
                          style: TextStyle(color: Colors.black, fontSize: 13),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.black, fontSize: 14),                            
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5), 
                              borderSide: BorderSide(color: Colors.black, width: 2.5)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5), 
                              borderSide: BorderSide(color: Colors.black, width: 2.5)
                            ),
                          ),
                        ),
                        SizedBox(height: 12,),
                        TextFormField(
                          controller: _passwordTextEditingController,
                          style: TextStyle(color: Colors.black, fontSize: 13),
                          cursorColor: Colors.black,
                          obscureText: !showPassword,
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.black, fontSize: 14),                            
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              }, 
                              icon: Icon(Icons.visibility)
                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5), 
                              borderSide: BorderSide(color: Colors.black, width: 2.5)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5), 
                              borderSide: BorderSide(color: Colors.black, width: 2.5)
                            ),
                          ),
                        ),
                        SizedBox(height: 12,),
                        SizedBox(height: 16,),
                        SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            onPressed: () => signUp(),
                            child: Text("Sign up", style: TextStyle(color: Colors.white, fontSize: 18),),
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          child: TextButton(
                            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage())),
                            child: Text("Sign in", style: TextStyle(color: Colors.black, fontSize: 18),)
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}