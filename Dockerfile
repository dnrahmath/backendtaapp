FROM node:latest

#create new directory and copas all file
RUN mkdir -p /usr/src/app
COPY . /usr/src/app

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

#RUN npm install
RUN npm install --only=production && npm install -g pm2

# If you are building your code for production
# RUN npm ci --only=production

# Install pm2 *globally* so we can run our application
#RUN npm i -g pm2

# Bundle app source
#COPY . .

EXPOSE 3000
#CMD [ "node", "server.js" ]
CMD [ "pm2-runtime", "start", "server.js" ]




