# Stage 1: Build environment
FROM node:20-slim AS build

WORKDIR /starter

COPY package*.json ./

RUN npm install --production

# Stage 2: Runtime environment
FROM node:20-slim

WORKDIR /starter

COPY --from=build /starter .

COPY .env.example .env

COPY . .

CMD ["npm", "start"]

EXPOSE 8080
