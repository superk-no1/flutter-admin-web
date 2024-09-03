import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          _buildTableEnd(),
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
            onPressed: () => logic.showDeleteSelectedDialog(),
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
          const Spacer(),
          Text('选中数量: ${state.selectedItems.length}'),
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
        rows: state.currentPageItems.map((item) {
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

  Widget _buildTableEnd() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
              '共计${state.items.length}条，当前${state.currentStart + 1}-${state.currentEnd}条'),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () => logic.changePage(state.currentPage.value - 1),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
            ),
            child: const Icon(Icons.chevron_left),
          ),
          const SizedBox(width: 10),
          Text('第 ${state.currentPage.value} 页'),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () => logic.changePage(state.currentPage.value + 1),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
            ),
            child: const Icon(Icons.chevron_right),
          ),
          const SizedBox(width: 10),
          Obx(() => DropdownButton<int>(
                value: state.itemsPerPage.value,
                icon: const Icon(Icons.arrow_drop_down_sharp),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                onChanged: (int? newValue) {
                  state.itemsPerPage.value = newValue ?? 0;
                  state.currentPage.value = 1;
                  logic.updateCurrentPageItems();
                },
                items: <int>[3, 5, 6].map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(state.currentPerPageStr(value)),
                  );
                }).toList(),
              )),
        ],
      ),
    );
  }
}
