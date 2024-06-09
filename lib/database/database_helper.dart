import 'package:localstore/localstore.dart';
import '../models/item.dart';

class DatabaseHelper {
  final _db = Localstore.instance;

  Future<void> addItem(Item item) async {
    item.id = _db.collection('items').doc().id;
    await _db.collection('items').doc(item.id).set(item.toMap());
  }

  Future<void> updateItem(Item item) async {
    await _db.collection('items').doc(item.id).set(item.toMap());
  }

  Future<void> deleteItem(String id) async {
    await _db.collection('items').doc(id).delete();
  }

  Future<List<Item>> getItems() async {
    final items = await _db.collection('items').get();
    return items?.entries.map((e) => Item.fromMap(e.value)).toList() ?? [];
  }
}
