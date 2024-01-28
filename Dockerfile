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
RUN hugo --gc --enableGitInfo --minify

###############
# Final Stage #
###############
FROM hugomods/hugo:nginx
COPY --from=builder /src/public /site
