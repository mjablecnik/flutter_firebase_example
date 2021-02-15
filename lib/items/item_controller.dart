import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:login/items/Item_repository.dart';
import 'package:login/items/item_model.dart';

class ItemController extends GetxController {
  final itemRepository = Get.find<ItemRepository>();

  final List<Item> _simpleList = <Item>[].obs;

  List<Item> get items => _simpleList;

  onInit() async {
    super.onInit();
    _simpleList.addAll(await itemRepository.getItems);
  }

  addItem(Item item) {
    _simpleList.add(item);
    return itemRepository.addItem(item);
  }
}
