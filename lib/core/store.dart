import 'package:demo2/Models/ProductData.dart';
import 'package:demo2/Models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore{
  catalogModel? catalog;
  CartModel? cart;

  MyStore() {
    catalog = catalogModel();
    cart = CartModel();
    cart?.catalog = catalog!;
  }
}