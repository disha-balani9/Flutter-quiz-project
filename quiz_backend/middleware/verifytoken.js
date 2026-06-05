const jwt = require("jsonwebtoken");
require("dotenv").config();

function verifyToken(req, res, next) {

  const bearerHeader = req.headers["authorization"];

  if (!bearerHeader) {
    return res.json({
      message: "Token Required"
    });
  }

  const token = bearerHeader.split(" ")[1];

  jwt.verify(
    token,
    process.env.JWT_SECRET,

    (err, decoded) => {

      if (err) {
        return res.json({
          message: "Invalid Token"
        });
      }

      req.user = decoded;

      next();
    }
  );
}

module.exports = verifyToken;