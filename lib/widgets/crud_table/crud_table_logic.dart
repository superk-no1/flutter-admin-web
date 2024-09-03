import 'package:admin_web/router/routes.dart';
import 'package:admin_web/widgets/crud_table/crud_table_state.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:admin_web/models/table_item_model.dart';

class CrudTableLogic extends GetxController {
  final CrudTableState state = CrudTableState();

  void _addItem(String name, String description) {
    state.items.add(TableItemModel(
      id: state.nextId.value++,
      name: name,
      description: description,
    ));
  }

  void _editItem(TableItemModel item, String name, String description) {
    item.name = name;
    item.description = description;
    state.items.refresh();
  }

  void _deleteItem(TableItemModel item) {
    state.items.remove(item);
    state.selectedItems.remove(item);
    state.isAllSelected.value = false;
  }

  void _deleteSelectedItems() {
    state.items.removeWhere((e) => state.selectedItems.contains(e));
    state.selectedItems.clear();
    state.isAllSelected.value = false;
  }

  void toggleSelection(TableItemModel item, bool selected) {
    if (selected) {
      state.selectedItems.add(item);
    } else {
      state.selectedItems.remove(item);
    }
    state.isAllSelected.value =
        state.selectedItems.length == state.items.length;
  }

  void toggleSelectAll(bool selectAll) {
    if (selectAll) {
      state.selectedItems.addAll(state.items);
    } else {
      state.selectedItems.clear();
    }
    state.isAllSelected.value = selectAll;
  }

  void showAddDialog() {
    RouteManager.showNormalDialog(
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('添加商品'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: state.nameController,
                decoration: const InputDecoration(labelText: '名称'),
              ),
              TextField(
                controller: state.descriptionController,
                decoration: const InputDecoration(labelText: '描述'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                final name = state.nameController.text;
                final description = state.descriptionController.text;
                _addItem(name, description);
                Navigator.of(context).pop();
              },
              child: const Text('添加'),
            ),
          ],
        );
      },
    );
  }

  void showEditDialog(TableItemModel item) {
    state.nameController.text = item.name;
    state.descriptionController.text = item.description;

    RouteManager.showNormalDialog(builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('编辑商品'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: state.nameController,
              decoration: const InputDecoration(labelText: '名称'),
            ),
            TextField(
              controller: state.descriptionController,
              decoration: const InputDecoration(labelText: '描述'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              final name = state.nameController.text;
              final description = state.descriptionController.text;
              _editItem(item, name, description);
              Navigator.of(context).pop();
            },
            child: const Text('保存'),
          ),
        ],
      );
    });
  }

  void showDeleteDialog(TableItemModel item) {
    RouteManager.showNormalDialog(
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('删除商品'),
          content: const Text('你确定要删除商品吗？'),
          actions: [
            TextButton(
              onPressed: () {
                _deleteItem(item);
                Navigator.of(context).pop();
              },
              child: const Text('删除'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('取消'),
            ),
          ],
        );
      },
    );
  }

  void showDeleteSelectedDialog() {
    RouteManager.showNormalDialog(
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('删除选中商品'),
          content: const Text('你确定要删除选中的商品吗？'),
          actions: [
            TextButton(
              onPressed: () {
                _deleteSelectedItems();
                Navigator.of(context).pop();
              },
              child: const Text('删除'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('取消'),
            ),
          ],
        );
      },
    );
  }

  void updateCurrentPageItems() {
    state.currentPageItems.value =
        state.items.sublist(state.currentStart, state.currentEnd);
  }

  void changePage(int page) {
    if (page > 0 && page <= state.totalPages) {
      state.currentPage.value = page;
      updateCurrentPageItems();
    }
  }
}
