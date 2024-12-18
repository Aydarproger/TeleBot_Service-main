FROM python:3.9-slim

# Устанавливаем переменную среды TZ для управления временными зонами
ENV TZ=Europe/Moscow

# Устанавливаем обязательные пакеты для установки зависимостей и работы с PostgreSQL
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    libpq-dev \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем requirements.txt в рабочую директорию
COPY requirements.txt .

# Обновляем pip и устанавливаем wheel для ускорения установки пакетов
RUN pip install --upgrade pip wheel

# Устанавливаем зависимости из requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Копируем все остальные файлы в /app внутри контейнера
COPY . .

# Открываем порт 8000 для обращений к приложению
EXPOSE 8000

# Запускаем Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
