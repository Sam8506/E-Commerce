import 'package:firebase_auth/firebase_auth.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import '../Widget/home_widgets/Catalog_image.dart';

class dbList extends StatefulWidget {
  const dbList({Key? key}) : super(key: key);

  @override
  State<dbList> createState() => _dbListState();
}

class _dbListState extends State<dbList> {
 //final user = FirebaseAuth.instance.currentUser!;
  //TextEditingController pick = TextEditingController();
  late DatabaseReference _dbreference;
  late DatabaseReference sendOrder;
  late Query _fetchData;
  //String databaseJSON = "";
 
  

  Widget _orderList({required Map products}){
    // return Container(
    //   child: Text('HEllo'),
    // );
    
     return SingleChildScrollView(
       child: VxBox(
        child: Row(
          children: [
         Hero(
           tag: Key(products['id'].toString()),
           child: CataLogImage(
             image: products['image'],
             ),
         ),
           Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                  products['name'].toString().text.bold.color(context.theme.accentColor).lg.make(),
                  products['desc'].toString().text.make(),
                  10.heightBox,
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      products['price'].toString().text.bold.xl.make(),
                      ElevatedButton(
                        onPressed: (){},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
                          shape: MaterialStateProperty.all(
                            StadiumBorder(),
                          )
                        ),
                        child: "Add to Cart".text.make()
                        )
                    ],
                  ).pOnly(right: 8)
               ]
               ).scrollVertical()
             )
        ],
        )
         ).roundedLg.color(context.cardColor).square(150).make().py16(),
     );
    // return Container(
    //   margin: const EdgeInsets.all(8),
    //   padding: const EdgeInsets.all(8),
    //   height: 100,
    //   decoration: BoxDecoration(
    //     color: Colors.pink[50]
    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Text('Pickup Address:- '+products['name']),
    //       Text('Delivery Address:- '+products['desc']),
    //       Text('Price:- '+products['price'].toString()),
    //       // Text('Document Type:- '+oRder['Type']),

    //     ],
    //   ),
    // );
  }


  @override
  void initState() {
    sendOrder = FirebaseDatabase.instance.ref();
    _dbreference = FirebaseDatabase.instance.ref();
    _fetchData = FirebaseDatabase.instance.ref().child('products');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('DataBase Ordes'),
      ),
      body: Column(
            children: [
               Expanded(
                 child: Container(
                 // height: double.infinity,
                  // child: TextButton(
                  //   child:Text('Op'),
                  //   onPressed: (){
                  //     _createOrder();
                  //   },
                  // ),
                  child: FirebaseAnimatedList(
                    query: _fetchData ,
                    itemBuilder: (BuildContext context,
                     DataSnapshot snapshot,
                      Animation<double>animation,
                      int index){
                        Map products;
                        products = snapshot.value as Map;
                        if(products.isNotEmpty){
                          return _orderList(products: products);
                        }else{
                          return Container(
                            child: Center(
                              child: Text('Opps! No Previous Order Found')
                              )
                            );
                        }
                          
                    },
                    ),
                ),
               ),
            ]
      )
            );
}
 
  // _createOrder() async{
    
  //   _dbreference.child("products").child("2").set( { 
  //           "name": "Pixel 5",
  //           "desc": "Google Pixel phone 5th generation",
  //           "price": 699,
  //           "color": "#00ac51",
  //           "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxatSEfWIzjYV70axsv6eNRnRBMIZNy9LEQw&usqp=CAU"
        
        
  //      } );
  // }

}


  