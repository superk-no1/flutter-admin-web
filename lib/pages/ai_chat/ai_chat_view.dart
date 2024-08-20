import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';

import '../../common/constants.dart';
import '../../widget/admin_menu_bar.dart';
import 'ai_chat_logic.dart';

class AiChatPage extends StatefulWidget {
  const AiChatPage({super.key});

  @override
  State<AiChatPage> createState() => _AiChatPageState();
}

class _AiChatPageState extends State<AiChatPage> {
  final logic = Get.put(AiChatLogic());
  final state = Get.find<AiChatLogic>().state;

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(Constants.webName),
      ),
      sideBar: AdminMenuBar(),
      body: _buildMainView(),
    );
  }

  Widget _buildMainView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 30),
      child: Column(
        children: [
          _buildMsgList(),
          _buildInputBar(),
        ],
      ),
    );
  }

  Widget _buildMsgList() {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
          reverse: true,
          itemCount: state.messages.length,
          itemBuilder: (context, index) {
            int reverseIndex = state.messages.length - index - 1;
            final message = state.messages[reverseIndex];
            return ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              leading: message.isUserMessage
                  ? null
                  : const CircleAvatar(
                      backgroundImage: AssetImage(
                          '../../../assets/images/robot1.png'), // Replace with your asset path or network image
                    ),
              title: Align(
                alignment: message.isUserMessage
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color:
                        message.isUserMessage ? Colors.blue : Colors.grey[300],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    message.text,
                    style: TextStyle(
                      color:
                          message.isUserMessage ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              subtitle: message.isUserMessage ? null : SizedBox.shrink(),
            );
          },
        );
      }),
    );
  }

  Widget _buildInputBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: state.textController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Obx(() {
            return ElevatedButton(
              onPressed: state.isLoading.value ? null : logic.sendMessage,
              child: state.isLoading.value
                  ? const CircularProgressIndicator()
                  : const Text('Send'),
            );
          }),
        ],
      ),
    );
  }
}
