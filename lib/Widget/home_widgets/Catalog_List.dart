import 'package:demo2/Models/ProductData.dart';
import 'package:demo2/Widget/home_widgets/Catalog_image.dart';
import 'package:demo2/Widget/home_widgets/add_to_cart.dart';
import 'package:demo2/pages/home_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class CatalogList extends StatelessWidget {
  const CatalogList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.isMobile? ListView.builder(
      shrinkWrap: true,
      itemCount: catalogModel.items!.length,
      itemBuilder: (context,index){
        final catalog = catalogModel.getByPosition(index);
        return InkWell(
          onTap: () => Navigator.push(
            context,
           MaterialPageRoute(
             builder: (context)=>HomeDetailPage(
              catalog: catalog
              )
             )
             ),
          child: CatalogItem(catalog:catalog)
          );
      }
      ) :
      GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      shrinkWrap: true,
      itemCount: catalogModel.items!.length,
      itemBuilder: (context,index){
        final catalog = catalogModel.getByPosition(index);
        return InkWell(
          onTap: () => Navigator.push(
            context,
           MaterialPageRoute(
             builder: (context)=>HomeDetailPage(
              catalog: catalog
              )
             )
             ),
          child: CatalogItem(catalog:catalog)
          );
      }
      );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem( { Key? key, required this.catalog })
   : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
       Hero(
         tag: Key(catalog.id.toString()),
         child: CataLogImage(
           image: catalog.image,
           ),
       ),
         Expanded(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
                catalog.name.text.bold.color(context.theme.accentColor).lg.make(),
                catalog.desc.text.make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    AddToCart(catalog:catalog)
                  ],
                ).pOnly(right: 8)
             ]
             )
           )
      ],
      )
    ).roundedLg.color(context.cardColor).square(150).make().py16();
  }
}

