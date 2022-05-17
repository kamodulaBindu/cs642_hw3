FROM node:12.7-alpine AS build
WORKDIR /Users/himabindukamodula/Documents/SWE_642/HW3_642/
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build
