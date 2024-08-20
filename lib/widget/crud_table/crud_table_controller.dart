import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:admin_web/models/table_item_model.dart';

class TableController extends GetxController {
  var items = <TableItemModel>[
    TableItemModel(id: 1, name: '名字1', description: '描述1',),
    TableItemModel(id: 2, name: '名字2', description: '描述2',),
    TableItemModel(id: 3, name: '名字3', description: '描述3',),
  ].obs;
  var nextId = 4.obs;

  void addItem(String name, String description) {
    items.add(TableItemModel(
      id: nextId.value++,
      name: name,
      description: description,
    ));
  }

  void editItem(TableItemModel item, String name, String description) {
    item.name = name;
    item.description = description;
    items.refresh();
  }

  void deleteItem(TableItemModel item) {
    items.remove(item);
  }

  void showAddDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('添加商品'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: Get.find<TextEditingController>(tag: 'add_name'),
              decoration: const InputDecoration(labelText: '名称'),
            ),
            TextField(
              controller:
                  Get.find<TextEditingController>(tag: 'add_description'),
              decoration: const InputDecoration(labelText: '描述'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              final name =
                  Get.find<TextEditingController>(tag: 'add_name').text;
              final description =
                  Get.find<TextEditingController>(tag: 'add_description').text;
              addItem(name, description);
              Get.back();
            },
            child: const Text('添加'),
          ),
        ],
      ),
    );
  }

  void showEditDialog(TableItemModel item) {
    Get.find<TextEditingController>(tag: 'edit_name').text = item.name;
    Get.find<TextEditingController>(tag: 'edit_description').text =
        item.description;

    Get.dialog(
      AlertDialog(
        title: const Text('编辑商品'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: Get.find<TextEditingController>(tag: 'edit_name'),
              decoration: const InputDecoration(labelText: '名称'),
            ),
            TextField(
              controller:
                  Get.find<TextEditingController>(tag: 'edit_description'),
              decoration: const InputDecoration(labelText: '描述'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              final name =
                  Get.find<TextEditingController>(tag: 'edit_name').text;
              final description =
                  Get.find<TextEditingController>(tag: 'edit_description').text;
              editItem(item, name, description);
              Get.back();
            },
            child: const Text('保存'),
          ),
        ],
      ),
    );
  }

  void showDeleteDialog(TableItemModel item) {
    Get.dialog(
      AlertDialog(
        title: const Text('删除商品'),
        content: const Text('你确定要删除商品吗？'),
        actions: [
          TextButton(
            onPressed: () {
              deleteItem(item);
              Get.back();
            },
            child: const Text('删除'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('取消'),
          ),
        ],
      ),
    );
  }
}
