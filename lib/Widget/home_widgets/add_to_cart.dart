import 'package:demo2/core/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../Models/ProductData.dart';
import '../../Models/cart.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

   
  @override
  Widget build(BuildContext context) {
    VxState.watch(context,on: [AddMutation,RemoveMutation]);
    final CartModel? _cart = (VxState.store as MyStore).cart; 
    bool isInCart = _cart!.items.contains(catalog);

    
    return ElevatedButton(
      onPressed: (){
        if(!isInCart){       
          AddMutation(catalog);
          ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(milliseconds: 500),
                  backgroundColor: const Color.fromARGB(255, 10, 35, 226),
                content: "${catalog.name} Added Into Cart Successfully..".text.make()
              
              )
              );
      
        }else{
          ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(milliseconds: 500),
                  backgroundColor: Colors.red,
                content: "${catalog.name} Already Added Into Cart..".text.make()
              
              )
              );
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
        shape: MaterialStateProperty.all(
          StadiumBorder(),
        )
      ),
      child: isInCart?Icon(Icons.done):Icon(CupertinoIcons.cart_fill_badge_plus)
      );
  }
}