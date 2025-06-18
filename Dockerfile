# menggunakan base image Node.js versi 14 (Alpine Linux)
FROM node:14-alpine

# use workdi /app
WORKDIR /app

# menyalin source code ke working directory di container
COPY . .

# menentukan aplikasi berjalan dalam production mode dan db nya item-db
ENV NODE_ENV=production DB_HOST=item-db

# install dependensi dan build
RUN npm install --production --unsafe-perm && npm run build

# mengekspos port 8080 untuk websever
EXPOSE 8080

# menjalankan server saat container diluncurkan
CMD ["npm", "start"]
