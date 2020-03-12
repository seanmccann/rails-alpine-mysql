Base image for my Rails projects. Pre-installs rails 6, nokogiri, and a few other gems.

```
  docker build -t seanmccann/rails-alpine-mysql:latest .
  docker push seanmccann/rails-alpine-mysql:latest
```
