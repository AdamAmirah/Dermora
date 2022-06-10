const mongoose = require("mongoose");
const dbConfig = require("../config");
const DB_URL = "mongodb://localhost:27017/dermora";
const bcrypt = require("bcrypt");
const auth = require("../helpers/auth");

const routineSchema = mongoose.Schema(
  {
    morningRoutine: {
      time: String,
      products: {
        type: [{ image: String, label: String, type: String }],
        default: [],
      },
    },
    nightRoutine: {
      time: String,
      products: {
        type: [{ image: String, label: String, type: String }],
        default: [],
      },
    },
  },
  { minimize: false }
);

const Routine = mongoose.model("routine", routineSchema);
exports.Routine = Routine;

exports.getRoutine = (time) => {
  return new Promise((resolve, reject) => {
    mongoose
      .connect(DB_URL, {
        useUnifiedTopology: true,
        useNewUrlParser: true,
      })
      .then(() => {
        if (time == "morning") {
          let routine = Routine.find({}, "morningRoutine");
          let list = [];
          for (product of routine.products) {
            console.log(product);
          }
          return routine;
        } else {
          return Routine.find({}, "nightRoutine");
        }
      })
      .then((res) => {
        // mongoose.disconnect();
        resolve(res);
      })
      .catch((err) => {
        mongoose.disconnect();
        reject(err);
      });
  });
};

// exports.addProductToRoutine = async (data, time) => {
//   try {
//     await mongoose.connect(DB_URL, {
//       useUnifiedTopology: true,
//       useNewUrlParser: true,
//     });

//     if (time == "morning") {
//       let newRoutine = new Routine({
//         morningRoutine: {
//           time: ,
//           products: data,
//         },
//       });
//       await newRoutine.save();
//     } else {
//       let newRoutine = new Routine({
//         nightRoutine: {
//           time: data.time,
//           products: data.,
//         },
//       });
//       await newRoutine.save();
//     }
//   } catch (error) {
//     mongoose.disconnect();
//     throw new Error(error);
//   }
// };
