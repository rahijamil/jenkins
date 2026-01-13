# Use the official Nginx image
FROM nginx:alpine

# Copy your static website files (index.html, etc.) into Nginx's default folder
COPY index.html /usr/share/nginx/html

# Expose port 80 for web traffic
EXPOSE 80
