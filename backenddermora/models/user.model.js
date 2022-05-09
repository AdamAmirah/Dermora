const mongoose = require("mongoose");
const dbConfig = require("../config");
const DB_URL = dbConfig.db;
const bcrypt = require("bcrypt");
const auth = require("../helpers/auth");

const userSchema = mongoose.Schema({
  email: String,
  fullName: String,
  password: String,
  age: Number,
  sex: String,
  image: { type: String, default: "" },
  address: {
    type: [
      {
        country: { type: String, default: "" },
        city: { type: String, default: "" },
        street: { type: String, default: "" },
        postCode: { type: Number },
      },
    ],
    default: [],
  },
  kind: { type: String, default: "user" },
  doctorInfo: {
    type: [
      {
        isAvailable: { type: Boolean, default: false },
        noOfPatients: Number,
        workDetails: Object,
        patients: Array,
        requests: {
          type: [{ id: Number, status: { type: Boolean, default: false } }],
        },
      },
    ],
    default: [],
  },
  userInfo: {
    type: [{ skinType: String, skinConcerns: Array, doctors: Array }],
    default: [],
  },
  friends: {
    // users for doctors and vice versa
    type: [{ name: String, image: String, id: String, chatId: String }],
    default: [],
  },
});

const User = mongoose.model("user", userSchema);

exports.createUser = (email, password, name) => {
  return new Promise((resolve, reject) => {
    mongoose
      .connect(DB_URL, { useUnifiedTopology: true, useNewUrlParser: true })
      .then(() => {
        return User.findOne({ email: email });
      })
      .then((user) => {
        if (user) {
          mongoose.disconnect();
          reject("Email exists");
        } else return bcrypt.hash(password, 10);
      })
      .then((hashedPassword) => {
        let user = new User({
          email: email,
          password: hashedPassword,
          fullName: name,
        });
        return user.save();
      })
      .then(() => {
        mongoose.disconnect();
        resolve();
      })
      .catch((err) => {
        mongoose.disconnect();
        reject(err);
      });
  });
};

exports.login = (email, password) => {
  console.log("welcome");
  return new Promise((resolve, reject) => {
    mongoose
      .connect(DB_URL, { useUnifiedTopology: true, useNewUrlParser: true })
      .then(() => User.findOne({ email: email }))
      .then((user) => {
        console.log(user);
        if (!user) {
          mongoose.disconnect();
          console.log("this email does not exist");
          reject("this email does not exist");
        } else {
          bcrypt.compare(password, user.password).then((same) => {
            if (!same) {
              mongoose.disconnect();
              console.log("password is incorrect");
              reject("password is incorrect");
            } else {
              mongoose.disconnect();
              const token = auth.generateAccessToken(email);
              console.log(user);
              resolve({ user, token });
            }
          });
        }
      })
      .catch((err) => {
        mongoose.disconnect();
        console.log(err);
        reject(err);
      });
  });
};
