import 'package:state_management_bloc/models/catalog.dart';
import 'package:state_management_bloc/models/item.dart';

class CartModel {
  late CatalogModel _catalog;
  final List<int> _itemIds = [];

  // ignore: unnecessary_getters_setters
  CatalogModel get catalog => _catalog;

  // ignore: unnecessary_getters_setters
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  List<ItemModel> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(ItemModel item) {
    _itemIds.add(item.id);
  }

  void remove(ItemModel item) {
    _itemIds.remove(item.id);
  }
}
