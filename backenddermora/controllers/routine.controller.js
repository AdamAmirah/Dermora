const routineModel = require("../models/routine.model");

exports.getRoutine = (req, res, next) => {
  console.log("getting routine");
  let time = req.body.time;
  routineModel.getRoutine(time).then((result) => {
    res.status(200).send({
      message: "Success",
      data: result,
    });
  });
};

//  exports.createRoutine = (req, res, next) => {
//   console.log("creating routine");
//   let time = req.body.time;
//   let data = req.body.products;

//   routineModel.addProductToRoutine(time, data).then(() => {
//     res.status(200).send({
//       message: "Success",
//     });
//   });
// };
