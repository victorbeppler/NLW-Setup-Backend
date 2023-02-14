# Base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

COPY package*.json ./

# generated prisma files
COPY prisma ./prisma/

# COPY ENV variable
COPY .env ./

# COPY tsconfig.json file
COPY tsconfig.json ./

# COPY
COPY . .

RUN npm install

RUN npm install --save-dev prisma@4.9.0

RUN npm install --save-dev prisma-erd-generator@1.2.5

RUN npx prisma generate

CMD ["npm", "run", "start"]