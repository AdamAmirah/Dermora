const router = require("express").Router();
const routineController = require("../controllers/routine.controller");
const bodyParser = require("body-parser");

router.get("/routine", routineController.getRoutine);

// router.post(
//   "/createRoutine",
//   bodyParser.urlencoded({ extended: true }),
//   routineController.createRoutine
// );

module.exports = router;

// {
//     "morningRoutine": {
//         "time":"",
//         "products": [
//             {
//             "label" : "CeraVe Sa Cleanser",
//             "type" : "cleanser",
//             "image":"assets/images/Moisturizer.png"
//             }
//         ]
//     },
//     "nightRoutine": {
//         "time":"",
//         "products": [
//             {
//             "label" : "CeraVe Sa Cleanser",
//             "type" : "cleanser",
//             "image":"assets/images/Moisturizer.png"
//             }
//         ]
//     }

// }
