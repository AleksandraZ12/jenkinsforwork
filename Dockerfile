# Используйте официальный образ Node.js в качестве базового
FROM node:18

# Установите рабочую директорию
WORKDIR ./app

# Копируйте package.json и package-lock.json
COPY package*.json ./

# Установите зависимости
RUN npm install

# Копируйте исходный код приложения
COPY . .

# Экспортируйте порт, который будет использовать приложение
EXPOSE 3000

# Запустите приложение
CMD ["npm", "app.js"]