// ignore_for_file: dead_code
import 'dart:convert';
import 'package:demo2/Models/cart.dart';
import 'package:demo2/Widget/home_widgets/Catalog_List.dart';
import 'package:demo2/Widget/home_widgets/catalog_header.dart';
import 'package:demo2/core/store.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:demo2/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:demo2/Models/ProductData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final url = "https://cartdata.000webhostapp.com/MobilePhone.json";

  @override
  void initState(){
    super.initState();
    loadData();
  }

  loadData() async{

   await Future.delayed(const Duration(seconds:2));

    //final catalogJson =  await rootBundle.loadString("assets/files/product.json");
  final response =  await http.get(Uri.parse(url));
  final catalogJson = response.body;
   final decodedData = jsonDecode(catalogJson);
   var productsData = decodedData["products"];
      
   catalogModel.items =
    List.from(productsData)
    .map<Item>((item) => Item.fromMap(item))
    .toList();
   setState(() {
     
   }
   );
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return  Scaffold(
      backgroundColor:context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation,RemoveMutation},
        builder:(context, store, status) => FloatingActionButton(
          backgroundColor: context.theme.buttonColor,
          onPressed: ()=> Navigator.pushNamed(context, MyRoutes.cartRoute),
          child: const Icon(CupertinoIcons.cart,color: Colors.white,),
          ).badge(
            color: Vx.red500,
            size: 22,
            count: _cart?.items.length,
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold
            )
            
            ),
      ),
     body: SafeArea(
       child: Container(
         padding: Vx.m32,
         child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           children: [
           const catalogHeader(),
            if(catalogModel.items != null && catalogModel.items!.isNotEmpty)
             const CatalogList().expand()
            else
              const CircularProgressIndicator().centered().expand(),
            
           ]
           ),
       ),
     ),
    );
  }
}







