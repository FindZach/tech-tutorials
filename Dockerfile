# Use an official Node.js runtime as a parent image
FROM node:18.19

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies, including the Angular CLI globally
RUN npm install -g @angular/cli@18.2.1 && npm install

# Copy the rest of the application code
COPY . .

# Build the Angular application for SSR
RUN ng build --configuration production && ng run tech-tutorials:server:production

# Expose the port the app runs on
EXPOSE 4000

# Start the Angular Universal server
CMD ["node", "app/dist/tech-tutorials/server/server.mjs"]
