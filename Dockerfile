# Use an official Node.js runtime as a parent image
FROM node:16

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Angular application
RUN npm run build:ssr

# Expose the port the app runs on
EXPOSE 4000

# Start the Angular Universal server
CMD ["node", "dist/server/main.js"]
