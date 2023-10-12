# Use the official Go base image with version 1.17
FROM golang:1.21

# Set the working directory inside the container
WORKDIR /app

# Copy your Go application source code into the container
COPY . .

# Build your Go application
RUN go build -o main

# Expose a port if your application listens on a specific port
# EXPOSE 8080

# Command to run your Go application
CMD ["./main"]
