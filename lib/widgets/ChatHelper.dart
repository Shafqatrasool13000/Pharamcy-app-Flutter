import './ChatItemModel.dart';

class ChatHelper {

  static var chatList = [ChatItemModel("Mild Fever", "Thank you very much for the swift reply", "16/02/2020"),ChatItemModel("Skin Irritation", "Okay. Duely noted", "02/02/2020"),
  ChatItemModel("Back Pain", "Received! Thanks", "16/07/2018"),ChatItemModel("Low Body Mass", "Session closed", "16/07/2018")];

  static ChatItemModel getChatItem(int position) {
    return chatList[position];
  }

  static var itemCount = chatList.length;

}