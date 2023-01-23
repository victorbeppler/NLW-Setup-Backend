import { PrismaClient } from "@prisma/client";
import fastify from "fastify";
import cors from "@fastify/cors";

const app = fastify();
const prisma = new PrismaClient();

app.register(cors,{
  origin: "*",
});

app.get("/consult/habit", async () => {
  const habit = await prisma.habit.findMany();
  return habit;
});

app.listen({ port: 3000 }, () => {
  console.log("Server is running on port 3000");
});
