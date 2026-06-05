const express = require("express");
const router = express.Router();

const db = require("../config/db");


router.get("/questions/:category", (req, res) => {

  const category = req.params.category;

  const sql = "SELECT * FROM questions WHERE category=?";

  db.query(sql, [category], (err, result) => {

    if (err) return res.json(err);

    res.json(result);
  });
});

router.post("/questions/:category", (req, res) => {
const category = req.params.category;
  const {
  category
    question,
    option1,
    option2,
    option3,
    option4,
    answer
  } = req.body;

  const sql = " INSERT INTO questions (category,question, option1, option2, option3, option4, answer) VALUES (?,?, ?, ?, ?, ?, ?)";



  db.query(

    sql,

    [
      question,
      option1,
      option2,
      option3,
      option4,
      answer
    ],

    (err, result) => {

      if (err) {
        return res.json(err);
      }

      res.json({
        message: "Question Added"
      });
    }
  );
  });

router.put("/questions/:id",(req,res)=>{

  const {
    question,
    option1,
    option2,
    option3,
    option4,
    answer
  } = req.body;
const sql="Update questions SET question=?,option1=?,option2=?,option3=?,option4=?,answer=?  WHERE id=?";
db.query(sql,[question,option1,option2,option3,option4,answer,req.params.id],(err,result)=>{
if(err){
return res.json(err);
}
res.json({
message:"questions updated"
});
}
);
}
);
router.delete("/questions/:id",(req,res)=>{
const sql="DELETE From questions Where id=?";
db.query(sql,[req.params.id],(err,result)=>{
if(err){
return res.json(err);
}
res.json({
message:"question deleted"
});
});
});
router.get("/questions", (req, res) => {

  const sql = "SELECT * FROM questions";

  db.query(sql, (err, result) => {

    if (err) {
      return res.json(err);
    }

    res.json(result);
  });
});
module.exports = router;