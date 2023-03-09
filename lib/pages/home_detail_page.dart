import 'package:demo2/Models/ProductData.dart';
import 'package:demo2/Widget/home_widgets/add_to_cart.dart';
import 'package:demo2/Widget/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  
  final Item catalog;
  const HomeDetailPage({Key? key,required this.catalog}) :assert(catalog!=null),
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined,color: context.theme.buttonColor,),
          onPressed: (){
            Navigator.pop(context);
          },
          ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: Container(
        color: context.theme.cardColor,
        child: ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      "\$${catalog.price}".text.bold.xl4.color(Vx.red800).make(),
                      AddToCart(catalog: catalog,).wh(120, 40)
                    ],
          ).p16(),
      ),
      backgroundColor: context.theme.canvasColor,
      body: Column(
            children: [
                Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.image)
              ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: context.theme.cardColor,
                  width: context.screenWidth,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        catalog.name.text.bold.color(context.theme.accentColor).xl4.make(),
                      catalog.desc.text.xl.make(),
                      SizedBox(
                        height: 10.0,
                      ),
                      "Clita dolore aliquyam  erat, sed si kasd rebum lorem accusam, justo aliquyam magna sadipscing clita. Lorem takimata et diam diam invidunt. Et dolor sadipscing stet erat eos consetetur labore dolor, dolor accusam no dolore et tempor justo accusam et dolores. Dolore diam diam est est voluptua erat."
                       .text.make().p8()
                      ],
                    ).py64(),
                  ),
                ),
              )
              )
             
          ],
        ),
      
    );
  }
}