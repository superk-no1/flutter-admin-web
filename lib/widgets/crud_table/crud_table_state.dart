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
  ].obs;
  var nextId = 6.obs;

  var selectedItems = <TableItemModel>{}.obs;
  var isAllSelected = false.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  CrudTableState() {
    ///Initialize variables
  }
}
