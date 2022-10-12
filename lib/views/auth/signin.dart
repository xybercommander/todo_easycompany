import 'package:flutter/material.dart';
import 'package:todo_easycompany/data/services/auth.dart';
import 'package:todo_easycompany/views/auth/signup.dart';
import 'package:todo_easycompany/views/todo_list.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({ Key? key }) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  //------ VARIABLES ------//
  bool showPassword = false;
  final _formKey = GlobalKey<FormState>();
  // late Stream<QuerySnapshot> userStream;
  
  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController = TextEditingController();

  AuthMethods authMethods = AuthMethods();
  // DatabaseMethods databaseMethods = DatabaseMethods();

  //------ METHODS ------//
  void signIn(context) async {
    // userStream = await databaseMethods.getUserInfoByEmail(_emailTextEditingController.text); 
    authMethods.signInWithEmailAndPassword(_emailTextEditingController.text, _passwordTextEditingController.text)
      .then((value) { 
        if(value == null) {
          showDialog(
            context: context, 
            builder: (context) {
              return AlertDialog(
                content: Text("Password is invalid"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context), 
                    child: Text("Ok")
                  )
                ],
              );
            }
          );
        } else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TodoList()));
        }               
      });                 
  }


  //------ UI -------//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
            color: Colors.white.withOpacity(0.8),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [              
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Login", style: TextStyle(color: Colors.black, fontSize: 50, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  SizedBox(height: 24,),
                  Container(
                    child: Column(
                      children: [
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
                              icon: Icon(Icons.visibility),
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
                        SizedBox(height: 16,),
                        SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            onPressed: () => signIn(context),
                            child: Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 18),),
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 4,),
                        SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          child: TextButton(
                            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpPage())),
                            child: Text("Sign Up", style: TextStyle(color: Colors.black, fontSize: 18),)
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