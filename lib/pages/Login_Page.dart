// ignore_for_file: file_names, prefer_typing_uninitialized_variables
import 'package:demo2/pages/sign.dart';
import 'package:demo2/utils/routes.dart';
import 'package:flutter/material.dart';

var email;
var password;
class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);
    
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool onChangeButton = false;
  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async{
    if(_formkey.currentState!.validate()){
    
    Login(email: email, password: password).login();
    setState(() {
    onChangeButton = true;
  });
  // ) : setState(() {
  //   onChangeButton = false;
  // });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        onChangeButton = false;
      });
      
    }
  
                  
  }

  @override
  Widget build(BuildContext context) {

    return  Material(
      //color:context.,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(
                height: 40.0,
              ),
              Image.asset("assets/images/loginPhoto.png",
              fit: BoxFit.cover,
             // height: 600, //this is a example of singlechildScrolView if image is big then we have to use scroll just uncomment and see :)
              ),
              const SizedBox(
                height: 20.0,
              ),
               Text(
                "One Step To Go $name",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              ),
              const SizedBox(    //use for space between one step go and username field
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child:Column(
                children: [
                  TextFormField(
                decoration: InputDecoration(
                  border:  OutlineInputBorder(
                        borderRadius:  BorderRadius.circular(25.0),
                    ),
                   hintText: "Enter Username",
                  labelText: "Username",
                ),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Please Enter Username";
                  }
                  return null;
                },
                onChanged: (value){
                      name = value;
                      setState(() {});
                    },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                obscureText: true,
                controller: password,
                decoration: InputDecoration(
                   border:  OutlineInputBorder(
                        borderRadius:  BorderRadius.circular(25.0),
                    ),
                 hintText: "Enter Password",
                  labelText: "Password",
                ),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Please Enter Password";
                  }
                  else if(value.length!=6){
                    return "Wrong Password";
                  }
                  return null;
                },
              ),
              
              const SizedBox(
                height: 40.0,
              ),
               
              Material(
                color: Colors.deepPurple[800],
                borderRadius: BorderRadius.circular(onChangeButton?30: 8),
                child: InkWell(
                  onTap: () => moveToHome(context),
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    height:  40,
                    width: onChangeButton?50:120,
                    alignment: Alignment.center,
                    child: onChangeButton? const Icon(
                      Icons.done,
                      color: Colors.white,
                    ) : const Text(
                      "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    ),
                    
                  ),
                ),
              ),
              ],
              )
              )
              
            ],
          ),
        ),
      )
      
    );
  }
}