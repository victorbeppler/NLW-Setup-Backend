import express from "express";

const route = express.Router();

route.get("/status", async (req, res) => {
  console.log("teste");
  res.status(200).json({
    status: "ok",
  });
});

export default route;
