FROM node:20.11.0-alpine AS build
WORKDIR /usr/src/app
COPY src/package.json ./package.json
RUN npm install
COPY src/ /usr/src/app/
RUN npm run build

FROM ubi8/nodejs-20-minimal
WORKDIR /usr/src/app
COPY --from=build /usr/src/app/ ./
RUN useradd nonroot && chown nonroot:nonroot /usr/src/app
USER nonroot
EXPOSE 3000
CMD ["node", "src/index.js"]
