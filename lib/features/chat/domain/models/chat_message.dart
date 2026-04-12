class ChatMessage {
  final String id;
  final String senderId;
  final String receiverId;
  final String text;
  final DateTime timestamp;

  ChatMessage({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.text,
    required this.timestamp,
  });
}

class ChatContact {
  final String userId;
  final String name;
  final String lastMessage;
  final DateTime lastMessageTime;
  final String imageUrl;

  ChatContact({
    required this.userId,
    required this.name,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.imageUrl,
  });
}
