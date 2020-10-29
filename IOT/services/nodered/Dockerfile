FROM nodered/node-red:latest
RUN for addonnodes in \
node-red-node-pi-gpiod \
node-red-dashboard \
node-red-node-openweathermap \
node-red-node-google \
node-red-node-emoncms \
node-red-node-geofence \
node-red-node-ping \
node-red-node-random \
node-red-contrib-influxdb \
node-red-contrib-config \
node-red-contrib-esplogin \
node-red-contrib-npm \
node-red-contrib-file-function \
; do \
npm install ${addonnodes} ;\
done;
RUN npm install --unsafe-perm node-red-node-sqlite

