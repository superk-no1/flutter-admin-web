import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/table_item_model.dart';

class CrudTableState {
  var items = <TableItemModel>[
    TableItemModel(
      id: 1,
      name: '名字1',
      description: '描述1',
    ),
    TableItemModel(
      id: 2,
      name: '名字2',
      description: '描述2',
    ),
    TableItemModel(
      id: 3,
      name: '名字3',
      description: '描述3',
    ),
    TableItemModel(
      id: 4,
      name: '名字4',
      description: '描述4',
    ),
    TableItemModel(
      id: 5,
      name: '名字5',
      description: '描述5',
    ),
    TableItemModel(
      id: 6,
      name: '名字6',
      description: '描述6',
    ),
    TableItemModel(
      id: 7,
      name: '名字7',
      description: '描述7',
    ),
    TableItemModel(
      id: 8,
      name: '名字8',
      description: '描述8',
    ),
  ].obs;

  var currentPageItems = <TableItemModel>[].obs;
  final RxInt currentPage = 1.obs;
  final RxInt itemsPerPage = 3.obs;

  var nextId = 6.obs;

  var selectedItems = <TableItemModel>{}.obs;
  var isAllSelected = false.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  int get totalPages => (items.length / itemsPerPage.value).ceil();

  int get currentStart => (currentPage.value - 1) * itemsPerPage.value;

  int get currentEnd => min(currentStart + itemsPerPage.value, items.length);

  String currentPerPageStr(int value) => '$value条/页';

  CrudTableState() {
    currentPageItems.value = items.sublist(0, itemsPerPage.value);
  }
}
