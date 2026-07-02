# ============================================================================
# DOCKERFILE FOR DEVOPS BOOTCAMP APP - EDUCATIONAL VERSION WITH EXPLANATIONS
# ============================================================================
# This Dockerfile uses a multi-stage build pattern, which is a Docker best
# practice for production applications. It separates the BUILD stage 
# (where we install dependencies and compile) from the RUNTIME stage 
# (where we only keep what's needed to run the app). This keeps the final 
# image small and secure.
# ============================================================================

# STAGE 1: BUILD STAGE
# ============================================================================
# This stage installs dependencies and builds the application.
# We use Node.js here because we need npm and build tools.
FROM node:20-alpine AS builder

# Set working directory inside the container
# All subsequent commands will run from this directory
WORKDIR /app

# Copy package.json and package-lock.json (if it exists)
# These are copied BEFORE the source code for Docker layer caching.
# If source code changes but dependencies don't, Docker reuses the cached 
# node_modules layer instead of reinstalling everything.
COPY package.json package-lock.json* ./

# Install production and development dependencies
# npm ci (clean install) is preferred over npm install in Docker because
# it's more reliable and reproducible (uses exact versions from lock file)
RUN npm ci

# Copy the entire source code into the container
# This is done AFTER dependency installation to leverage Docker's layer cache
# More details: if we did this before npm ci, changing source code would 
# invalidate the node_modules cache
COPY . .

# Build the application using the Vite build script from package.json
# This compiles the Vue/JavaScript code and creates optimized static files
# in the 'dist/' directory (as configured in vite.config.js)
RUN npm run build

# ============================================================================
# STAGE 2: RUNTIME STAGE
# ============================================================================
# This stage contains only what's needed to serve the built application.
# We use nginx (a lightweight web server) instead of Node.js, which 
# significantly reduces image size (from ~400MB to ~50MB)

FROM nginx:alpine

# Set working directory for nginx
WORKDIR /usr/share/nginx/html

# Copy the built application from the builder stage
# The 'AS builder' at the top creates a build context we reference here
# This copies only the 'dist' folder containing compiled static files,
# leaving behind node_modules and build tools
COPY --from=builder /app/dist ./

# (OPTIONAL) Copy nginx configuration for better serving
# If you had a custom nginx config, you'd copy it like this:
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 (the standard HTTP port)
# Note: EXPOSE is documentation only - it doesn't actually publish the port
# You must use 'docker run -p' or docker-compose port mapping to access it
EXPOSE 80

# Health check: tells Docker how to determine if the container is healthy
# This periodically makes a request to verify the web server is responding
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost:80/ || exit 1

# Start nginx in foreground mode (required for Docker containers)
# The '-g daemon off;' prevents nginx from daemonizing, so Docker sees it
# as the main process and can properly manage the container lifecycle
CMD ["nginx", "-g", "daemon off;"]

# ============================================================================
# DOCKER BEST PRACTICES APPLIED IN THIS FILE:
# ============================================================================
# 1. Multi-stage builds: Separates build and runtime for smaller images
# 2. Layer caching: Dependencies copied before source code for efficiency
# 3. Alpine Linux: Lightweight base images (node:20-alpine, nginx:alpine)
# 4. Specific versions: Using 'node:20' instead of 'node:latest'
# 5. npm ci: More reliable than npm install in containerized environments
# 6. Health checks: Helps orchestrators (Kubernetes, Docker Swarm) manage containers
# 7. Foreground processes: nginx runs with 'daemon off' so Docker can manage it
#
# BUILDING AND RUNNING:
# ============================================================================
# Build the image:
#   docker build -t bootcamp-app:latest .
#
# Run the container:
#   docker run -p 8080:80 bootcamp-app:latest
#   Then visit: http://localhost:8080
#
# Run with custom name and background:
#   docker run -d -p 8080:80 --name my-app bootcamp-app:latest
# ============================================================================