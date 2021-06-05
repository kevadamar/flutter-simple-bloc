import 'package:state_management_bloc/models/item.dart';

class CatalogModel {
  static List<String> itemNames = [
    'Buku pemrograman C++',
    'Buku pemrograman C#',
    'Buku pemrograman Dart',
    'Buku pemrograman PHP',
  ];

  ItemModel getById(int id) => ItemModel(id, itemNames[id % itemNames.length]);

  ItemModel getByPosition(int position) {
    return getById(position);
  }
}
