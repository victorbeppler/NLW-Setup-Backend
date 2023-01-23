import { PrismaClient } from "@prisma/client";
import fastify from "fastify";

const app = fastify();
const prisma = new PrismaClient();

app.get("/consult/habit", async () => {
  const habit = await prisma.habit.findMany();
  return habit;
});
app.listen({ port: 3000 }, () => {
  console.log("Server is running on port 3000");
});
