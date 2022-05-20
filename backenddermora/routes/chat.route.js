const router = require("express").Router();
const chatController = require("../controllers/chat.controller");
const bodyParser = require("body-parser");

router.get("/chat/:id", chatController.getChat);
router.post("/createChat", chatController.createChat);

module.exports = router;
