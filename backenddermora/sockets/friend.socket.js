const sendFriendRequest = require("../models/chat.model").sendFriendRequest;

module.exports = (io) => {
  io.on("connection", (socket) => {
    socket.on("joinNotificationRoom", (id) => {
      socket.join(id);
      console.log("join", id);
    });
    socket.on("sendFriendRequest", (data) => {
      console.log(data);
      // when a user sends a request to a doctor

      sendFriendRequest(data) // update the db
        .then(() => {
          socket.emit("requestSent"); // emit that a request has been sent  and update the user button in flutter
          io.to(data.userId).emit("newFriendRequest", {
            name: data.name,
            id: data.id,
            image: data.image,
            city: data.city,
            age: data.age,
            time: data.time,
          });
        })
        .catch((err) => {
          socket.emit("requestFailed");
        });
    });
    socket.on("requestAccepted", (data) => {
      io.to(data.userId).emit("requestAccepted");
    });
  });
};
