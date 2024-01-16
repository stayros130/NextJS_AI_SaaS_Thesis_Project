# Use an official Node runtime as a parent image
FROM node:latest

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (or yarn.lock)
COPY package*.json ./

# Install dependencies
RUN npm install

# Bundle app source inside Docker image
COPY . .

# Build your Next.js app
RUN npm run build

# Your app binds to port 3000, so use the EXPOSE instruction
EXPOSE 3000

# Define the command to run your app
CMD [ "npm", "start" ]
