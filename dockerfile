# Base image
FROM node:16-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy remaining project files
COPY . .

# Set environment variables
ENV NODE_ENV=production
ENV DATABASE_URL=file:./dev.db

# Install SQLite dependencies
RUN apk add --no-cache sqlite

# Create the SQLite database
RUN sqlite3 dev.db ""

# Run the server
CMD ["npm", "start"]