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
            return Container(
              height: 50,
              margin: const EdgeInsets.all(5),
              color: Colors.amber[600],
              child: Center(
                child: Text(controller.items[index].name),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog(
                title: "Add item",
                model: Item(""),
                onSubmit: (item) => controller.addItem(item),
              );
            },
          )
        },
      ),
    );
  }
}
