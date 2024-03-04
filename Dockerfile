# Use the official Node.js image as the base image
FROM node:20-slim AS build

# Set the working directory
WORKDIR /starter

# Copy only the package.json and package-lock.json files
COPY test-script.js ./

# Install dependencies
RUN npm install

# Create a new stage for the runtime environment
FROM node:20-slim

# Set the working directory
WORKDIR /starter

# Copy only the necessary files from the previous stage
COPY --from=build /starter .

# Copy other project files
COPY .env.example .env
COPY . .

# Set the NODE_ENV to production
ENV NODE_ENV production

# Start your application
CMD ["npm", "start"]

EXPOSE 8080
