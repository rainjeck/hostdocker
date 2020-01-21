# hostdocker

nginx + php + mysql + adminer

```
git clone https://github.com/rainjeck/hostdocker.git .
sudo docker-compose build
sudo docker-compose up -d
sudo chown -R :www-data public && sudo chmod -R 777 public
```

Host: `localhost:5000`

Adminer: `localhost:8080`
