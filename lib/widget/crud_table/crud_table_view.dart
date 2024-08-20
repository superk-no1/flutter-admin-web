import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'crud_table_controller.dart';

class CrudTableView extends StatefulWidget {
  const CrudTableView({super.key});

  @override
  State<CrudTableView> createState() => _CrudTableViewState();
}

class _CrudTableViewState extends State<CrudTableView> {
  final TableController tableController = Get.put(TableController());

  @override
  Widget build(BuildContext context) {
    Get.put(TextEditingController(), tag: 'add_name');
    Get.put(TextEditingController(), tag: 'add_description');
    Get.put(TextEditingController(), tag: 'edit_name');
    Get.put(TextEditingController(), tag: 'edit_description');

    return Obx(() {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('商品列表', style: TextStyle(fontSize: 20),),
                const SizedBox(width: 5,),
                ElevatedButton.icon(
                  onPressed: tableController.showAddDialog,
                  icon: const Icon(Icons.add),
                  label: const Text('添加'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    // Text color
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    // Button padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 900,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2), // 设置边框颜色和宽度
            ),
            child: DataTable(
              columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('名称')),
                DataColumn(label: Text('描述')),
                DataColumn(label: Text('操作')),
              ],
              rows: tableController.items.map((item) {
                return DataRow(
                  cells: [
                    DataCell(Text(item.id.toString())),
                    DataCell(Text(item.name)),
                    DataCell(Text(item.description)),
                    DataCell(
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () =>
                                tableController.showEditDialog(item),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () =>
                                tableController.showDeleteDialog(item),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      );
    });
  }
}
