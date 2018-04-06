# rails-headless-chrome


## Setup

    $ docker build -t headless-chrome:latest .

## Run the tests

    $ bin/rails test:system
    $ docker run --cap-add=SYS_ADMIN --rm headless-chrome bin/rails test:system
