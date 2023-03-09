import 'dart:ffi';
import 'dart:io';

import 'package:google_fonts/google_fonts.dart';
import 'package:demo2/Models/cart.dart';
import 'package:demo2/core/store.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Models/cart.dart';

class cartPage extends StatelessWidget {
  const cartPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(context.theme.accentColor).make(),

      ),
      body: Column(
        children: [
          CartList().p32().expand(),
          SizedBox(
            height: 100,
          ),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  
  const _CartTotal({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    final CartModel? _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications: {},
            mutations: {RemoveMutation},
            builder: (context,_,n){
            return
             "\$${_cart!.totalPrice}"
             .text
             .xl5
             .color(context.accentColor)
             .make();
          },
        ),
          
          30.widthBox,
          ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                content: "Buying not supported yet".text.make()
              
              )
              );
          }, 
          style: ButtonStyle(
            backgroundColor: 
            MaterialStateProperty.all(context.theme.buttonColor)
          ),
          child: "Buy".text.white.make()
          ).w32(context),


        ],
      ),
    );
  }
}

class CartList extends StatefulWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  
  final CartModel? _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
     VxState.watch(context,on: [RemoveMutation]);
    return _cart!.items.isEmpty ? Container(
      child: Column(
        children: [
          Image.asset('assets/images/EmptyCart.png'),
          "No Item in Cart..".text.bold.xl2.make().p32()
        ],
      )
    ) :
    ListView.builder(
      itemCount: _cart!.items.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.done),
          trailing: IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () => RemoveMutation(_cart!.items[index]),
        
          ),
          title: _cart!.items[index].name.text.make(),
        );
      }
    );
      
  }
}