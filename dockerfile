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

RUN npx prisma generate

CMD ["npm", "run", "start"]