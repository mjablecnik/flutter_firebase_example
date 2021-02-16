import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login/auth/auth_controller.dart';
import 'package:login/items/item_model.dart';
import 'package:login/dialog/dialog_view.dart';
import 'package:get/get.dart';
import 'package:login/items/item_controller.dart';

class ItemView extends GetView<ItemController> {
  final authController = Get.find<AuthController>();

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: authController.logout,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            var item = controller.items[index];
            return Container(
              height: 50,
              margin: const EdgeInsets.all(5),
              color: Colors.amber[600],
              child: Row(
                children: [
                  Spacer(),
                  Text(item.name),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: ButtonBar(
                      children: [
                        GestureDetector(
                          onTap: () => openDialog(context, item, "Change item name", controller.changeItem),
                          child: Icon(Icons.edit),
                        ),
                        GestureDetector(
                          onTap: () => controller.removeItem(item),
                          child: Icon(Icons.clear),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => openDialog(context, Item(""), "Add item", controller.addItem),
      ),
    );
  }

  openDialog(context, item, title, onSubmit) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          title: title,
          model: item,
          onSubmit: onSubmit,
        );
      },
    );
  }
}
