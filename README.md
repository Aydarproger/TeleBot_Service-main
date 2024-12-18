## Service Time

Use Python 3.9 or higher for development

#### Local deploy instruction

1. create and activate virtulalenv
   - `python -m venv venv`
   - `source venv/bin/activate`


2. install necessary packages
   - `pip install -r requirements.txt`


3. Create .env file in /service_time directory and add your local configuration
  

4. Migrate to the database 
   - `python manage.py migrate`


5. start celery worker
   - `celery -A proj worker -l INFO`

  
5. start server 
   - `python manage.py runserver`
   

! Don't forget to specify bot commands in @BotFather
```
start - меню/обновить клавиатуру
help - справка
cancel - отмена текущего диалога
```

Для получения SSL сертификатов с использованием Certbot, вы можете запустить Certbot вручную на хосте. Например:

sudo certbot certonly --standalone --agree-tos --email your_email@example.com -d your_domain_or_ip

Автоматическое обновление сертификатов

Сертификаты Let’s Encrypt действительны 90 дней. Certbot можно настроить на автоматическое обновление сертификатов, добавив cron-задание или systemd unit.

Пример cron-задания для обновления сертификатов:


0 0 * * * /usr/bin/certbot renew --quiet


В нашем случае при запущенном докере: 

docker-compose run --rm web-app sh -c "certbot certonly --standalone --agree-tos --email dom696208@gmail.com -d 90.156.229.230" 

!!! требуется доменное имя, с ip не выдает серт.