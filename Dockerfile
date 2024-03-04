# Use the official Node.js image as the base image
FROM node:20-slim

# Set the working directory
WORKDIR /starter

# Create a .dockerignore file and copy only necessary files
COPY .dockerignore ./
COPY package.json ./
COPY package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Set the NODE_ENV to production
ENV NODE_ENV production

# Start your application
CMD ["npm", "start"]
