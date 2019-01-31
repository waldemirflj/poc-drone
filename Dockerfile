# Grab the latest node image
FROM node:8.15.0-alpine

# Set the working directory inside the container to /app
WORKDIR /usr/src/app

# Add package.json/npm-shrinkwrap.json to the directory
COPY api/package.json .
COPY api/npm-shrinkwrap.json .

# Install dependencies
RUN apk add --update build-base && \
    npm install -g @adonisjs/cli && \
    npm install

# Copy the rest into directory
COPY api/ .

COPY docker-entrypoint.sh .

RUN ["chmod", "+x", "/usr/src/app/docker-entrypoint.sh"]

# Expose port defined in .env file
EXPOSE 3333

# Start the app inside the container
ENTRYPOINT ["/usr/src/app/docker-entrypoint.sh"] 