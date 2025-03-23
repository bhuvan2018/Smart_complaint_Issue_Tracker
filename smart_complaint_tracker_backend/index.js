const express = require("express");
const dotenv = require("dotenv");
const cors = require("cors");
dotenv.config();
const app = express();
app.use(express.json());
app.use(cors());

const PORT = process.env.PORT || 5000;

app.get("/", (req, res) => {
  res.send("Smart Complaint Tracker Backend is Running 🚀");
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});