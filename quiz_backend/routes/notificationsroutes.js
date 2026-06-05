const express = require("express");
const router = express.Router();

const db = require("../config/db");

module.exports = router;
router.get("/notifications", (req, res) => {

  const sql = "SELECT * FROM notifications ORDER BY id DESC";

  db.query(sql, (err, result) => {

    if (err) {
      return res.json({ error: err });
    }

    res.json(result);
  });
});
//Add notifictaions

router.post("/notifications", (req, res) => {

  const { title, message } = req.body;

  const sql = `
    INSERT INTO notifications
    (title, message)

    VALUES (?, ?)
  `;

  db.query(

    sql,

    [title, message],

    (err, result) => {

      if (err) {
        return res.json(err);
      }

      res.json({
        message: "Notification Added"
      });
    }
  );
});
module.exports = router;