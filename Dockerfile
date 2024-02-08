###############
# Build Stage #
###############
FROM hugomods/hugo:exts as builder
# Base URL
ARG HUGO_BASEURL
ENV HUGO_BASEURL=${HUGO_BASEURL}
ARG HUGO_ENV
ENV HUGO_ENV $HUGO_ENV
# Build site
COPY . /src
RUN hugo --gc --minify

###############
# Final Stage #
###############
FROM hugomods/hugo:nginx
COPY --from=builder /src/public /site
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
