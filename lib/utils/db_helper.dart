import 'package:objectbox/objectbox.dart';

import '../models/item.dart';

class DBHelper {
  /// Get all items
  static Future<List<Item>> getProduct(Store store) async {
    List<Item> items = store.box<Item>().getAll();
    return items;
  }

  /// Put item(s)
  static Future<List<int>> putItem(
    Store store, {
    required List<Item> data,
  }) async {
    return store.box<Item>().putMany(data);
  }

  static Future<bool> deleteItem(Store store, {required int itemId}) async {
    return store.box<Item>().remove(itemId);
  }
}
