// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

class Login{
  
  final email;
  final password;
  Login({required this.email ,required this.password});

  login() async {
    
    final auth =FirebaseAuth.instance;
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password).then((value)
      {
         print(value.user); 
         return true;
      }
      );
    }catch(e)
    {
      log(e.toString());
      return false;
    }
  }//login
}