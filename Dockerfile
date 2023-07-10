FROM instrumentisto/flutter as build
RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter build web

FROM nginx:1.21.1-alpine
COPY --from=build /app/build/web /usr/share/nginx/html
