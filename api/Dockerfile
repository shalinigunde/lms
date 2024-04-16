FROM node:16
WORKDIR /app
COPY . .
RUN npm install
RUN npx prisma generate
RUN npm run build
EXPOSE 8080 
CMD ["npm", "start"]
