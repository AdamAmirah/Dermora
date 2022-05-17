const express = require("express");

const errors = require("./helpers/errors");
const auth = require("./helpers/auth");

const unless = require("express-unless");

const app = express();
app.use(express.json());

const authRouter = require("./routes/auth.route");
const userRouter = require("./routes/user.route");

const server = require("http").createServer(app);
const io = require("socket.io")(server);
var cors = require("cors");
app.use(cors());

io.on("connection", function (client) {
  console.log("client connect...", client.id);

  client.on("typing", function name(data) {
    console.log(data);
    io.emit("typing", data);
  });

  client.on("message", function name(data) {
    console.log(data);
    io.emit("message", data);
  });

  client.on("location", function name(data) {
    console.log(data);
    io.emit("location", data);
  });

  client.on("connect", function () {
    console.log("hiiiiiiiiiiiiiiiiiiii");
  });

  client.on("disconnect", function () {
    console.log("client disconnect...", client.id);
    // handleDisconnect()
  });

  client.on("error", function (err) {
    console.log("received error from client:", client.id);
    console.log(err);
  });
});

auth.authenticateToken.unless = unless;

app.use(
  auth.authenticateToken.unless({
    path: [
      { url: "/login", methods: ["POST"] },
      { url: "/signup", methods: ["POST"] },
    ],
  })
);

app.use(errors.errorHandler);
app.use("/", authRouter);
app.use("/", userRouter);

const port = process.env.PORT || 3000;

server.listen(port, function (err) {
  if (err) throw err;
  console.log("Listening on port %d", port);
});
