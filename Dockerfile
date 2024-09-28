# Use official Node.js image
FROM node:14

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app's files
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Run the app
CMD ["node", "app.js"]
