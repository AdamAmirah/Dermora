const userModel = require("../models/user.model");
const validationResult = require("express-validator").validationResult;

exports.signUp = (req, res, next) => {
  if (validationResult(req).isEmpty()) {
    userModel
      .createUser(req.body.email, req.body.password, req.body.name)
      .then((result) =>
        res.status(200).send({
          message: "Success",
          data: result,
        })
      )
      .catch((err) => {
        next(err);
      });
  } else {
    return res.send(validationResult(req).array());
  }
};

exports.login = (req, res, next) => {
  if (validationResult(req).isEmpty()) {
    userModel
      .login(req.body.email, req.body.password)
      .then((result) => {
        res.status(200).send({
          message: "Success",
          data: result,
        });
      })
      .catch((err) => {
        next(err);
      });
  } else {
    return res.send(validationResult(req).array());
  }
};

exports.home = (req, res, next) => {
  return res.send("Authorized");
};
