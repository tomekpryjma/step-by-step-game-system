echo "Running the initial setup."
echo ""

cd src && \
    rm .gitkeep && \
    docker-compose up -d && \
    docker-compose run --rm composer composer create-project laravel/laravel . && \
    docker-compose run --rm composer composer require laravel/ui && \
    docker-compose run --rm artisan php artisan ui vue --auth && \
    docker-compose run --rm npm npm install && \
    docker-compose run --rm npm npm install vue-loader@^15.9.5 --save-dev --legacy-peer-deps && \
    docker-compose run --rm npm npm run dev && \
    docker-compose run --rm artisan php artisan migrate