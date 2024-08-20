import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/message_model.dart';

class AiChatState {
  var messages = <Message>[].obs;
  var isLoading = false.obs;

  final TextEditingController textController = TextEditingController();

  AiChatState() {
    ///Initialize variables
  }
}
