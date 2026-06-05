const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
require("dotenv").config();

const app = express();

app.use(cors());
app.use(bodyParser.json());

const authRoutes = require("./routes/authRoutes");
const questionRoutes = require("./routes/questionroutes");
const notificationRoutes = require("./routes/notificationsroutes");

app.use("/", authRoutes);
app.use("/", questionRoutes);
app.use("/", notificationRoutes);

app.listen(process.env.PORT, () => {
  console.log(
    `Server running on port ${process.env.PORT}`
  );
});