const express = require("express");
const router = express.Router();

const db = require("../config/db");

const jwt = require("jsonwebtoken");

const verifyToken =
require("../middleware/verifytoken");

require("dotenv").config();

const SECRET_KEY =
process.env.JWT_SECRET;
// SIGNUP
router.post("/signup", (req, res) => {
  const { name, email, password } = req.body;

  const sql = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";

  db.query(sql, [name, email, password], (err, result) => {
    if (err) return res.json(err);
    res.json({ message: "User Registered" });
  });
});

router.get("/users",(req,res)=>{
const sql="select * from users";
db.query(sql,(err,result)=>{
if(err){
return res.json(err);
}
res.json(result);
});

});
router.put("/users/:id",(req,res)=>{
const {name,email,password}=req.body;
 const sql = "UPDATE users set name=?,email=?,password=? where id=?";
  db.query(sql,[name,email,password,req.params.id],(err,result)=>{
  if (err){
  return res.json(err)

  }
 res.json({
 message:"user updated"
 });
 }
  );

});

//  DELETE USER API


router.delete("/users/:id", (req, res) => {

  const sql = "DELETE FROM users WHERE id=?";

  db.query(

    sql,

    [req.params.id],

    (err, result) => {

      if (err) {
        return res.json(err);
      }

      res.json({
        message: "User Deleted"
      });
    }
  );
});


// ========================
// 🔐 LOGIN WITH JWT
// ========================

router.post("/login", (req, res) => {

  const { email, password } = req.body;

  const sql =
      "SELECT * FROM users WHERE email=? AND password=?";

  db.query(

    sql,

    [email, password],

    (err, result) => {

      if (err) {
        return res.json(err);
      }

      if (result.length > 0) {

        const user = result[0];

        // 🔥 CREATE TOKEN
        const token = jwt.sign(

          {
            id: user.id,
            email: user.email
          },

          SECRET_KEY,

          {
            expiresIn: "1h"
          }
        );

        res.json({

          message: "Login Success",

          token: token,

          user: user
        });

      } else {

        res.json({
          message: "Invalid Credentials"
        });
      }
    }
  );
});



router.get("/profile", verifyToken, (req, res) => {

  res.json({

    message: "Protected Data Accessed",

    user: req.user
  });
});




module.exports = router;