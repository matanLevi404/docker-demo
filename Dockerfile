FROM node
WORKDIR /app
ADD . /app
RUN npm install
RUN npm audit fix --force
RUN npm test
EXPOSE 3000
CMD npm start
