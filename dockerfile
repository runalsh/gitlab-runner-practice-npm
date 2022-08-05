FROM node:14-alpine AS node

ARG branch
ENV GIT_BRANCH ${branch}

WORKDIR /var/www
ADD . /var/www

RUN yarn install

EXPOSE 3000
ENTRYPOINT yarn dev