# Use an official Node.js runtime as the base image
FROM node:14

# Create a working directory
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the application code to the working directory
COPY . .

# Build the application
RUN npm run build

# Expose the port
EXPOSE 8080

# Set an environment variable
ENV API_KEY=c64dcb50920070242c5bf284de3d4efd

# Start the application
CMD ["npm", "run", "serve"]
