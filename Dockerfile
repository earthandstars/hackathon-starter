# Use the official Node.js image as the base image
FROM node:20-slim

# Set the working directory
WORKDIR /starter

# Copy the entire project into the container
COPY . .

# Install dependencies
RUN npm install

# Set the NODE_ENV to production
ENV NODE_ENV production

# Start your application
CMD ["npm", "start"]

EXPOSE 8080
