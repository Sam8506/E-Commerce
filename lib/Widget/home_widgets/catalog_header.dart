import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Widget/theme.dart';

class catalogHeader extends StatelessWidget {
  const catalogHeader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           children: [
            
             "CataLog App".text.xl4.bold.color(context.theme.accentColor).make(),
             "Sale of The Day".text.color(context.theme.accentColor).make()
           ]
           );
  }
}