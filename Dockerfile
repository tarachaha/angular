FROM node as build

WORKDIR /app

COPY . /app

RUN npm install

RUN npm run build

# Server setup
FROM nginx:latest

#COPY ./nginx.conf /etc/nginx/nginx.conf

# Copy the build output to replace the default nginx contents.
COPY --from=build /app/angular/dist/angular/ /usr/share/nginx/html

# Expose port 80
EXPOSE 80
