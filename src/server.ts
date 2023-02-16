import express from "express";
import cors from "cors";
import habit from "./router/routes";
import status from "./router/status";
const app = express();

app.use(cors());

app.use(
  express.urlencoded({
    extended: true,
  })
);
app.use(express.json());

app.listen(4005, () => {
  console.log("Server is running on port 3005");
  app.use("/", status);
  app.use("/api", habit);
  // app.use("/habitsTeste", () => {
  //   return {
  //     status: "ok",
  //   };
  // });
});
