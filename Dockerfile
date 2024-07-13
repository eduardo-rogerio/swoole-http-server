FROM phpswoole/swoole:php8.1

# RUN apt-get update && apt-get install -y \
#     libssl-dev \
#     && pecl install swoole \
#     && docker-php-ext-enable swoole

# RUN apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY . /var/www/html

WORKDIR /var/www/html

EXPOSE 9501

ENTRYPOINT ["/bin/bash"]

