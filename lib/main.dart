import 'package:demo2/DataBase/product_list.dart';
import 'package:demo2/Widget/theme.dart';
import 'package:demo2/core/store.dart';
import 'package:demo2/pages/Login_Page.dart';
import 'package:demo2/pages/cartPage.dart';
import 'package:demo2/pages/home_page.dart';
import 'package:demo2/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(VxState(
     store: MyStore(),
    child: (const Myapp())
    )
    );  
}

class Myapp extends StatelessWidget {
  const Myapp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      
      theme:MyTheme.lightTheme(context),
      darkTheme:MyTheme.darkTheme(context),

      initialRoute: MyRoutes.loginRoute,
    routes: {
      "/" : (context) => const LoginPage(),
      MyRoutes.homeRoute: (context) => const HomePage(),
      MyRoutes.loginRoute: (context) => const LoginPage(),
      MyRoutes.cartRoute: (context) => const cartPage(),
      MyRoutes.dbList:(context) => const dbList(),
    },
    );
  }
}