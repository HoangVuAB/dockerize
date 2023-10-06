# Dockerize Laravel

Setup nhanh môi trường phát triển Laravel, thay thế cho các phầm mềm như XAMPP, MAMP, etc

## Cấu hình chi tiết

- Webserver: Nginx latest

- Database: MySQL latest

- PHP: php version 8.1

- Redis: alpine

- Mailhog: latest

- Storage volumes: mysql, redis

## Usage
- Thiết lập đường dẫn tại docker/services/nginx/server.conf
```
root /var/www/laravel-app/public;
```

- Folder src/ sẽ là nơi chứa source laravel.

- Allow to bind localhost with vite
```
src/(project)/vite.config.js
server: {
        host: '0.0.0.0',
        hmr: {
            host: 'localhost'
        },
    },
```

- Database sẽ lấy thông tin trực tiếp từ .env của project laravel

```
DB_CONNECTION=mysql
DB_HOST=database
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=root
DB_PASSWORD=root

```

- Shell script:
  Trước khi chaỵ file shell cần update lại ENV_PATH

```
# Define your laravel project .env path
ENV_PATH=./src/laravel-app/.env
```

```

- Khởi chạy các containers
-> ./app.sh start

- Dừng các containers
-> ./app.sh stop

- Rebuild container
-> ./app.sh rebuild

- ssh vào laravel project
-> ./app.sh ssh

```

Note: Vì database container sẽ được tạo cùng lúc với laravel app, trong trường hợp thay đổi DB_DATABASE tại file .env -> cần thiết phải build lại database :

```
./app.sh refresh

```

Thông tin database sẽ được lưu trong: docker/volumes/mysql/<tên DB>

## PORT

- App : http://localhost

- Nginx : http://localhost:80

- MySQL : http://localhost:3306

- Phpmyadmin : http://localhost:8081

- redis : http://localhost:6379

- Mailhog : http://localhost:8025 (or :1025)

<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>
