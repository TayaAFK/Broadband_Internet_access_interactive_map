FROM nginx:1.27-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY index.html styles.css regions.json russia_regions.geojson new_regions.geojson /usr/share/nginx/html/
COPY js/ /usr/share/nginx/html/js/
COPY fonts/ /usr/share/nginx/html/fonts/

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget -qO- http://127.0.0.1/health || exit 1
