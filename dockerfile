FROM node:16-alpine

WORKDIR /usr/app

COPY ./package.json .

RUN npm i
RUN npx prisma generate
RUN npm i --save-dev prisma@latest                    
RUN npm i @prisma/client@latest

COPY . .
COPY prisma ./prisma/
COPY --chown=node:node --from=builder /app/prisma /app/prisma
COPY --chown=node:node --from=builder /app/src /app/src

CMD ["npm","run", "start"]
