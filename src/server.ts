import fastify from "fastify";
import cors from "@fastify/cors";
import { appRoutes } from "./router/routes";

const app = fastify();

app.register(cors, {
  origin: "*",
});
app.register(appRoutes);

app.listen({ port: 3000 }, () => {
  console.log("Server is running on port 3000");
});
