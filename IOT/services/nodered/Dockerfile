FROM nodered/node-red:latest
RUN for addonnodes in \
node-red-dashboard \
node-red-node-arduino \
node-red-node-openweathermap \
node-red-node-google \
node-red-node-email  \
node-red-node-emoncms \
node-red-node-geofence \
node-red-node-pidcontrol \
node-red-node-pi-gpiod \
node-red-node-ping \
node-red-node-random \
node-red-node-serialport \
node-red-node-sqlite \
node-red-contrib-config \
node-red-contrib-esplogin \
node-red-contrib-file-function \
node-red-contrib-graphs \
node-red-contrib-grove \
node-red-contrib-ibm-watson-iot \
node-red-contrib-influxdb \
node-red-contrib-modbus \
node-red-contrib-npm \
node-red-contrib-telegrambot \
; do \
npm install ${addonnodes} ;\
done;
#RUN npm install --unsafe-perm node-red-node-sqlite

