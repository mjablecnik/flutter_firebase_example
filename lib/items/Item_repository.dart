import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'item_model.dart';

class ItemRepository extends GetxService {
  final CollectionReference _items = FirebaseFirestore.instance.collection('items');

  Future<List<Item>> get getItems => _items
      .orderBy('created', descending: false)
      .get()
      .then((QuerySnapshot snapshot) =>
          snapshot.docs.map((DocumentSnapshot s) => Item.fromJson(s.data())..id = s.id).toList(),
      );

  void addItem(Item item) => _items.add(item.toJson());

  void updateItem(Item item) => _items.doc(item.id).update(item.toJson());

  void deleteItem(Item item) => _items.doc(item.id).delete();
}