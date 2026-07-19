FROM nginx:alpine

# Remove default nginx static content
RUN rm -rf /usr/share/nginx/html/*

# Copy the static site (index.html + its asset folders) into nginx's web root
COPY index.html /usr/share/nginx/html/index.html
COPY index_files/ /usr/share/nginx/html/index_files/
COPY media/ /usr/share/nginx/html/media/
COPY screenshots/ /usr/share/nginx/html/screenshots/
COPY brand/ /usr/share/nginx/html/brand/
COPY assets/ /usr/share/nginx/html/assets/

# Custom nginx config (basic static-site serving + cache headers)
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
