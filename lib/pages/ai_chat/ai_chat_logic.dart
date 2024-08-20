import 'package:get/get.dart';

import '../../models/message_model.dart';
import 'ai_chat_state.dart';

class AiChatLogic extends GetxController {
  final AiChatState state = AiChatState();

  void sendMessage() async {
    final text = state.textController.text;
    if (text.isEmpty) return;

    state.messages.add(Message(text: text, isUserMessage: true));
    state.textController.clear();
    state.isLoading.value = true;

    final response = await _sendToBackend(text);

    state.messages.add(Message(text: response, isUserMessage: false));
    state.isLoading.value = false;
  }

  Future<String> _sendToBackend(String message) async {
    //todo 添加真实api请求
    await Future.delayed(const Duration(seconds: 1));

    return 'Server response to: $message';
  }
}
