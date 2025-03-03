FROM nikolaik/python-nodejs:latest

RUN apt-get update && \
  apt-get install -y \
  neofetch \
  chromium \
  ffmpeg \
  wget \
  mc \
  imagemagick && \
  rm -rf /var/lib/apt/lists/*

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

CMD ["node", "index.js"]
