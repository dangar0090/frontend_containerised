# Stage 1: Build

FROM node:16-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Stage 2: Release

FROM builder

COPY --from=builder /app/public /app

EXPOSE 5001

CMD ["npm" , "start"]