import 'package:demo2/Models/ProductData.dart';
import 'package:demo2/core/store.dart';
import 'package:velocity_x/velocity_x.dart';
class CartModel {
    late catalogModel _catalog;

  // Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  // Get Catalog
  catalogModel get catalog => _catalog;

  set catalog(catalogModel newCatalog) {
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => catalogModel.getByID(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add Item
  // Remove Item
}

class AddMutation extends VxMutation<MyStore>{
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart?._itemIds.add(item.id);

  }

}

class RemoveMutation extends VxMutation<MyStore>{
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart?._itemIds.remove(item.id);

  }

}

