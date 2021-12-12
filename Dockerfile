FROM nikolaik/python-nodejs:latest

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install nodejs -y

COPY package.json .
RUN npm install
#RUN npm install -g npm-check-updates
#RUN ncu --upgrade

RUN mkdir ./inites
WORKDIR /inites
COPY . /inites
ENV TZ=Asia/Jakarta
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN npm install
EXPOSE 8080
CMD ["npm", "start"]
