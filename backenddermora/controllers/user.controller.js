const userModel = require("../models/user.model");
const validationResult = require("express-validator").validationResult;

exports.getUser = (req, res, next) => {
  console.log("getting user");
  userId = req.params.id;
  userModel.getUser(userId).then((result) => {
    console.log("result");
    res.status(200).send({
      message: "Success",
      data: result,
    });
  });
};

exports.getArticles = (req, res, next) => {
  console.log("getting articles");
  return res.send("Authorized and articles");
};
exports.updateProfile = async (req, res, next) => {
  console.log("updating profile");
  try {
    const result1 = await userModel.updateAgeSex(req.body.age, req.body.sex);
    // const result2 = await userModel.updateConcerns(req.body.concerns);
    if (req.file) {
      const image = req.file.filename;
      req.body.image = image;
    }
    const result3 = await userModel.updateProfile(
      req.body.name,
      req.body.skinType,
      req.body.image,
      req.body.id
    );

    res.status(200);
  } catch (err) {
    res.status(500).send(err);
  }
};
exports.updateAgeSex = (req, res, next) => {
  console.log("updating sex and age");
  userModel
    .updateAgeSex(req.body.age, req.body.sex, req.body.id)
    .then((result) => {
      console.log(result);
      res.send(result);
    });
};

exports.updateConcerns = (req, res, next) => {
  console.log("updating concerns");
  console.log(req.body.concerns);
  userModel.updateConcerns(req.body.concerns, req.body.id).then((result) => {
    console.log(result);
    res.send(result);
  });
};
