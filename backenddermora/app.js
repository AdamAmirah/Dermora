const express = require("express");

const errors = require("./helpers/errors");
const auth = require("./helpers/auth");

const unless = require("express-unless");

const app = express();
app.use(express.json());

const authRouter = require("./routes/auth.route");

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

const port = process.env.PORT || 3000;

app.listen(port, (err) => {
  console.log("Listening from port 3000");
});
