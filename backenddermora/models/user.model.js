const mongoose = require("mongoose");
const dbConfig = require("../config");
const DB_URL = "mongodb://localhost:27017/dermora";
const bcrypt = require("bcrypt");
const auth = require("../helpers/auth");

const userSchema = mongoose.Schema(
  {
    email: String,
    fullName: String,
    password: String,
    age: { type: Number, default: 0 },
    sex: { type: String, default: "" },
    image: { type: String, default: "" },
    address: {
      country: { type: String, default: "" },
      city: { type: String, default: "" },
      street: { type: String, default: "" },
      postCode: { type: Number },
    },
    kind: { type: String, default: "user" },
    doctorInfo: {
      isAvailable: { type: Boolean, default: false },
      noOfPatients: Number,
      workDetails: {
        clinicName: String,
        address: String,
        jobTitle: String,
        experience: String,
      },
      patients: Array,
      requests: {
        type: [{ id: Number, status: { type: Boolean, default: false } }],
      },
    },
    userInfo: {
      skinType: String,
      skinConcerns: Array,
    },
    friends: {
      // users for doctors and vice versa
      type: [
        {
          name: String,
          id: String,
          image: String,
          friendId: String,
          chatId: String,
          status: Boolean,
        },
      ],
      default: [],
    },
    friendRequests: {
      type: [
        {
          name: String,
          id: String,
          time: String,
          age: Number,
          city: String,
          image: String,
        },
      ],
      default: [],
    },
    sentRequests: {
      type: [
        {
          name: String,
          id: String,
          time: String,
          age: Number,
          city: String,
          image: String,
        },
      ],
      default: [],
    },
  },
  { minimize: false }
);

const User = mongoose.model("user", userSchema);
exports.User = User;

//////////////////////////////////////////////////////

exports.getUser = (userId) => {
  return new Promise((resolve, reject) => {
    mongoose
      .connect(DB_URL, {
        useUnifiedTopology: true,
        useNewUrlParser: true,
      })
      .then(() => {
        return User.findById(userId);
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

exports.updateProfile = (name, skinType, image, id) => {
  return new Promise((resolve, reject) => {
    mongoose
      .connect(DB_URL, {
        useUnifiedTopology: true,
        useNewUrlParser: true,
      })
      .then(() => {
        return User.updateMany(
          { _id: id },
          {
            $set: {
              fullName: name,
              "userInfo.skinType": skinType,
              image: image,
            },
          },
          { multi: true }
        );
      })
      .then((res) => {
        mongoose.disconnect();
        resolve(res);
      })
      .catch((err) => {
        mongoose.disconnect();
        reject(err);
      });
  });
};
exports.updateAgeSex = (age, sex, id) => {
  return new Promise((resolve, reject) => {
    mongoose
      .connect(DB_URL, {
        useUnifiedTopology: true,
        useNewUrlParser: true,
      })
      .then(() => {
        return User.findByIdAndUpdate(id, { age: age, sex: sex });
      })
      .then((res) => {
        mongoose.disconnect();
        resolve(res);
      })
      .catch((err) => {
        mongoose.disconnect();
        reject(err);
      });
  });
};
exports.updateConcerns = (concerns, id) => {
  return new Promise((resolve, reject) => {
    mongoose
      .connect(DB_URL, {
        useUnifiedTopology: true,
        useNewUrlParser: true,
      })
      .then(() => {
        return User.update(
          { _id: id },
          { $set: { "userInfo.skinConcerns": concerns } }
        );
      })
      .then((res) => {
        mongoose.disconnect();
        resolve(res);
      })
      .catch((err) => {
        mongoose.disconnect();
        reject(err);
      });
  });
};
////////////////////////////////////////////////////////

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
          address: {
            country: "",
            city: "",
            street: "",
            postCode: 0,
          },
          userInfo: { skinType: "", skinConcerns: [], doctors: [] },
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
  console.log(DB_URL);

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
