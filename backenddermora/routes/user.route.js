const router = require("express").Router();
const userController = require("../controllers/user.controller");
const check = require("express-validator").check;
const bodyParser = require("body-parser");

router.get("/user/:id", userController.getUser);
router.get("/articles", userController.getArticles);

router.post(
  "/user/updateProfile",
  bodyParser.urlencoded({ extended: true }),
  userController.updateProfile
);
router.post(
  "/user/updateAgeSex",
  bodyParser.urlencoded({ extended: true }),
  userController.updateAgeSex
);

router.post(
  "/user/updateConcerns",
  bodyParser.urlencoded({ extended: true }),
  userController.updateConcerns
);
module.exports = router;
