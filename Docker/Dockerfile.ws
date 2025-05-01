FROM oven/bun:1

WORKDIR /usr/src/app

COPY ./Packages ./Packages
COPY  ./bun.lock ./bun.lock

COPY ./Packages.json ./Packages.json
COPY ./turbo.json ./turbo.json
COPY ./apps/ws .apps/ws


RUN bun install
# RUN cd packages/db && npx prisma generate && cd ../.. we can add this as a script in root as a db:migrate package.json
RUN bun run db:generate

EXPOSE 8081

CMD [ "bun","run","start:ws" ]