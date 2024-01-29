#!/bin/bash

# Aktualizacja systemu
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y

# Aktualizacja do najnowszej wersji Ubuntu
sudo do-release-upgrade -d

# Instalacja niezbędnych narzędzi
sudo apt install -y nginx php8.3 php8.3-fpm mysql-server php8.3-mysql phpmyadmin

# Konfiguracja PHP
sudo sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/php/8.3/fpm/php.ini

# Restart serwisów
sudo systemctl restart nginx
sudo systemctl restart php8.3-fpm
sudo systemctl restart mysql

# Dodanie konfiguracji dla PHPMyAdmin
echo "Include /etc/phpmyadmin/nginx.conf" | sudo tee -a /etc/nginx/sites-available/default

# Restart Nginx
sudo systemctl restart nginx

# Wyświetlanie informacji o zainstalowanych pakietach
echo "Instalacja zakończona. Zainstalowane pakiety: Nginx, PHP 8.3, MySQL, PHPMyAdmin."
