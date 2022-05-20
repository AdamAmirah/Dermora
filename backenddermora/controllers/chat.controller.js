const chatModel = require("../models/chat.model");
const validationResult = require("express-validator").validationResult;
const messageModel = require("../models/message.model");

exports.getChat = (req, res, next) => {
  let chatId = req.params.id;
  let userId = req.body.userId;

  messageModel
    .getMessages(chatId)

    .then((messages) => {
      if (messages.length === 0) {
        chatModel.getChat(chatId).then((chat) => {
          //console.log(chat)
          let friendData = chat.users.find((user) => user._id != userId);
          res.status(200).send({
            userId: userId,
            messages: messages,
            friendData: friendData,
            chatId: chatId,
          });
        });
      } else {
        let friendData = messages[0].chat.users.find(
          (user) => user._id != userId
        );

        res.status(200).send({
          userId: userId,
          messages: messages,
          friendData: friendData,
          chatId: chatId,
        });
      }
    });
};

exports.createChat = (req, res, next) => {
  console.log("creating a chat");

  chatModel
    .createChat(req.body)
    .then(() => {
      res.status(200).send({
        message: "Success",
      });
    })
    .catch((err) => {
      res.status(500).send({
        message: err,
      });
    });
};
