# php-hello-world
A simple hello-world for composer


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

# 3) Create your Docker Project

### Created a Dockerfile
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

<img width="1437" alt="Screenshot 2024-05-21 at 13 32 09" src="https://github.com/UdeshyaGhimire/intuji-devops-internship-challenge/assets/76220126/c0d1111d-b511-4d8f-825b-ffe10d0f4a95">


### Nginx Configuration File

nginx.conf file is needed for Reverse Proxying (Nginx can act as a reverse proxy, distributing incoming traffic to multiple backend servers. This helps with load balancing and improves scalability and reliability.)
Created an nginx.conf file with the following content:
```sh
server {
    listen 80;
    server_name localhost;

    root /var/www/html;
    index index.php;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
       
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_pass app:9000;
    }

    location ~ /\.ht {
        deny all;
    }
}
```
### Created an index.php file

<img width="472" alt="Screenshot 2024-05-21 at 13 40 12" src="https://github.com/UdeshyaGhimire/intuji-devops-internship-challenge/assets/76220126/d422d044-7230-4fc6-b660-c41b69c3e036">

## Build and Run the Docker Container

1. To Build the image as :
```sh
docker compose build
```

<img width="1132" alt="Screenshot 2024-05-21 at 13 44 37" src="https://github.com/UdeshyaGhimire/intuji-devops-internship-challenge/assets/76220126/d9640c33-bdf8-4081-9a8f-fdab1c9e9a2a">

2. To start and run Docker containers.

```sh 
docker compose up -d
```

<img width="1125" alt="Screenshot 2024-05-21 at 13 53 04" src="https://github.com/UdeshyaGhimire/intuji-devops-internship-challenge/assets/76220126/d4ce12d9-5953-4be8-814e-98999a1081ba">

 3. To Verify the running containers:

```sh 
docker ps
```
<img width="1099" alt="Screenshot 2024-05-21 at 13 56 24" src="https://github.com/UdeshyaGhimire/intuji-devops-internship-challenge/assets/76220126/932d9614-013c-41ef-9273-ac94e465ccd8">

 4. To Get Response from local server
```sh
curl localhost
```
<img width="687" alt="Screenshot 2024-05-21 at 14 01 19" src="https://github.com/UdeshyaGhimire/intuji-devops-internship-challenge/assets/76220126/06b16690-53e0-4b5d-9fb0-050e6c305590">

# 4) Push your docker image to the docker hub.

1) Tag Your Docker Image: Tag your local Docker image with your Docker Hub username and the desired repository name using the following command:

```sh
docker tag local-image-name yourusername/repository-name:tag
```

2) Log In to Docker Hub: Use the docker login command to log in to Docker Hub:

```sh

docker login
Enter your Docker Hub username and password when prompted.
```

<img width="1440" alt="Screenshot 2024-05-19 at 10 20 10" src="https://github.com/UdeshyaGhimire/intuji-devops-internship-challenge/assets/76220126/f2bf9608-6424-48c1-9437-101435e4cc9f">


3) Push Your Docker Image to Docker Hub: Use the docker push command to push your tagged image to Docker Hub:

```sh
docker push yourusername/repository-name:tag
```
