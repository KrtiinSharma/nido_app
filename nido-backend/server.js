// server.js
const express = require("express");
const bodyParser = require("body-parser");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
const cors = require("cors");

const app = express();
const PORT = process.env.PORT || 5000;
const SECRET_KEY = "your_secret_key";

app.use(cors());
app.use(bodyParser.json());

let users = [];

// Signup endpoint
app.post("/api/signup", (req, res) => {
  const { mobile, name, email, password } = req.body;

  // Check if user already exists
  const existingUser = users.find((user) => user.mobile === mobile);
  if (existingUser) {
    return res.status(400).json({ message: "User already exists" });
  }

  // Hash the password
  const hashedPassword = bcrypt.hashSync(password, 8);

  // Create new user
  const newUser = { mobile, name, email, password: hashedPassword };
  users.push(newUser);

  // Generate JWT token
  const token = jwt.sign({ mobile }, SECRET_KEY, { expiresIn: "1h" });
  res.status(201).json({ token });
});

// Login endpoint
app.post("/api/login", (req, res) => {
  const { mobile, password } = req.body;

  // Find user
  const user = users.find((user) => user.mobile === mobile);
  if (!user) {
    return res.status(404).json({ message: "User not found" });
  }

  // Check password
  const passwordIsValid = bcrypt.compareSync(password, user.password);
  if (!passwordIsValid) {
    return res.status(401).json({ token: null, message: "Invalid password" });
  }

  // Generate JWT token
  const token = jwt.sign({ mobile }, SECRET_KEY, { expiresIn: "1h" });
  res.status(200).json({ token });
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
