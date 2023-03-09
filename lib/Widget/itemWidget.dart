// ignore_for_file: file_names

import 'package:demo2/Models/ProductData.dart';
import 'package:flutter/material.dart';
 
class ItemWidget extends StatelessWidget {
  //const ItemWidget({ Key? key }) : super(key: key);
  final Item item;
  
  // ignore: unnecessary_null_comparison
  const ItemWidget({Key? key,  required this.item}) :assert(item!=null), super(key: key);
  @override
  Widget build(BuildContext context) {

   

    return Card(
      child: ListTile(
        onTap: () {
         print("${item.name} in Cart");
        },
          
        leading: Image.network(item.image), 
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",
        textScaleFactor: 1.5,
        style: TextStyle(
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold
          ),),
      ),
    );
  }
}