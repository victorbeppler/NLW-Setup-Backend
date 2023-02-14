FROM node:16-alpine

WORKDIR /usr/app

COPY ./package.json .

RUN npm i
RUN npx prisma generate
RUN npm i --save-dev prisma@latest                    
RUN npm i @prisma/client@latest

COPY . .

CMD ["npm","run", "start"]
