import { PrismaClient } from "@prisma/client";
import fastify from "fastify";

const app = fastify();
const prisma = new PrismaClient();

app.get("/consult/habit", async () => {
  const habit = prisma.habit.findMany({
    where: {
      title: {
        startsWith: "Beber",
      },
    },
  });
  console.log(habit);
  return habit;
});
app.listen({ port: 3000 }, () => {
  console.log("Server is running on port 3000");
});
