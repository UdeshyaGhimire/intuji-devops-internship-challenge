# php-hello-world
A simple hello-world for composer

 [![Latest Stable Version](https://github.com/silarhi/php-hello-world/workflows/Tests/badge.svg)](https://github.com/silarhi/php-hello-world/workflows/Tests/badge.svg)
 [![Latest Stable Version](https://poser.pugx.org/silarhi/hello-world/v/stable)](https://packagist.org/packages/silarhi/hello-world)
[![Total Downloads](https://poser.pugx.org/silarhi/hello-world/downloads)](https://packagist.org/packages/silarhi/hello-world)
[![License](https://poser.pugx.org/silarhi/hello-world/license)](https://packagist.org/packages/silarhi/hello-world)


[![SymfonyInsight](https://insight.symfony.com/projects/5d582202-1186-4ce7-82c7-c4d3a2c11807/big.svg)](https://insight.symfony.com/projects/5d582202-1186-4ce7-82c7-c4d3a2c11807)

Installation
------------

Install with composer
``` bash
composer require silarhi/hello-world
```

Run composer update
``` bash
composer update silarhi/hello-world
```

Usage
-----

``` php
require_once __DIR__ . '/vendor/autoload.php';

use Silarhi\Hello;

$hello = new Hello();
echo $hello->display() . "\n";
```

# PHP Hello World Docker Project

This repository describes the following:

1. **Install Docker in Linux Machine with Bash Scripting**
    - Clone the GitHub repository: [PHP Hello World](https://github.com/silarhi/php-hello-world.git).
2. **Dockerize the given Project.**
3. **Build the image for the project and push it to Docker Hub.**
4. **Make a docker-compose file for the given project.**
5. **Install Jenkins.**
6. **Create a freestyle project for building a CI/CD pipeline for the above application which will build artifacts using a Dockerfile directly from your GitHub repo.**

## Built With
- **PHP**
- **Shell**
- **Dockerfile**
- **Jenkins**

---



# Install Docker on macOS using Homebrew

This guide provides step-by-step instructions to install Docker on a macOS system using Homebrew.

## Prerequisites

- A macOS system
- Homebrew installed (if not, see the installation step below)

## Installation Steps

### 1. Install Homebrew
If Homebrew is not already installed, open a terminal and run the following command:
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Install Docker
I installed docker through the command below

```sh
brew install --cask docker
```

### 3. After installing Docker, started the Docker service using:

```sh
brew services start docker
```
### 4. Installed Docker Compose:

```sh
brew install docker-compose
```

# 2) Clone the GitHub repository
(https://github.com/silarhi/php-hello-world.git).
To clone use:
```sh
git clone "Repo Url"
```

<img width="898" alt="Screenshot 2024-05-18 at 19 52 31" src="https://github.com/UdeshyaGhimire/intuji-devops-internship-challenge/assets/76220126/0ff18cec-aa93-46c8-869f-f2fcfd6eddb9">

# 2) Create your Docker Project
I created a Dockerfile in the project that was cloned. The dockerfile contains the following:

```sh

# Use php image
FROM php:7.4.0-fpm
# setting working directory of image
WORKDIR /var/www/html
# installing system depemdecies

RUN apt-get update && apt-get install -y \
    unzip \
    && docker-php-ext-install filter

    # Installs composer.json application to run composer.json file
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer Installs composer.json application to run composer.json file

# copying image in this location 
COPY . /var/www/html

#installing dependencies of the composer.json file given inside our project
RUN composer install --ignore-platform-req=ext-filter

# Changing ownership and changing permission to read write execute
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html
```
