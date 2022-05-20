class Chat {
  final String name, lastMessage, image, time, chatId, friendId;
  final bool isActive;

  Chat({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
    this.chatId = '',
    this.friendId = '',
  });
}
