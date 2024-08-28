import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/table_item_model.dart';
import 'crud_table_logic.dart';

class CrudTableView extends StatefulWidget {
  const CrudTableView({super.key});

  @override
  State<CrudTableView> createState() => _CrudTableViewState();
}

class _CrudTableViewState extends State<CrudTableView> {
  final CrudTableLogic logic = Get.put(CrudTableLogic());
  final state = Get.find<CrudTableLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          _buildTableTitle(),
          _buildTableContent(),
        ],
      );
    });
  }

  Widget _buildTableTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ElevatedButton.icon(
            onPressed: logic.showAddDialog,
            icon: const Icon(Icons.add),
            label: const Text('添加'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () => logic.showDeleteDialog(
              TableItemModel(id: 0, name: '', description: ''),
            ),
            child: const Text('删除选中'),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () => logic.toggleSelectAll(
              !state.isAllSelected.value,
            ),
            child: Obx(() => Text(
                  state.isAllSelected.value ? '取消全选' : '全选',
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildTableContent() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: DataTable(
        columns: [
          DataColumn(
            label: Checkbox(
              value: state.isAllSelected.value,
              onChanged: (value) => logic.toggleSelectAll(value ?? false),
            ),
          ),
          const DataColumn(label: Text('ID')),
          const DataColumn(label: Text('名称')),
          const DataColumn(label: Text('描述')),
          const DataColumn(label: Text('操作')),
        ],
        rows: state.items.map((item) {
          return DataRow(
            cells: [
              DataCell(
                Obx(() => Checkbox(
                      value: state.selectedItems.contains(item),
                      onChanged: (selected) =>
                          logic.toggleSelection(item, selected ?? false),
                    )),
              ),
              DataCell(Text(item.id.toString())),
              DataCell(Text(item.name)),
              DataCell(Text(item.description)),
              DataCell(
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => logic.showEditDialog(item),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => logic.showDeleteDialog(item),
                    ),
                  ],
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
