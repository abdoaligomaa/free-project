FROM node:16-alpine as build

WORKDIR /usr/src/app

COPY --chown=node:node . .

RUN yarn
RUN yarn build

USER node


FROM node:16-alpine as run

COPY --chown=node:node --from=build /usr/src/app/node_modules ./node_modules
COPY --chown=node:node --from=build /usr/src/app/dist ./dist
COPY --chown=node:node .env ./

CMD [ "node", "dist/server.js" ]