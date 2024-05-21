
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

# 4) Creating Docker Compose File


  Created a compose file as "docker-composer.yml on the root directory
  The content of the file is following:


<img width="734" alt="Screenshot 2024-05-21 at 14 20 43" src="https://github.com/UdeshyaGhimire/intuji-devops-internship-challenge/assets/76220126/0d5c1733-da78-4e34-abe6-aaa3b05ebdc1">


# 5) Push your docker image to the docker hub.


1) Tag Your Docker Image:


   Tag your local Docker image with your Docker Hub username and the desired repository name using the following command:

```sh
docker tag local-image-name yourusername/repository-name:tag
```

2) Log In to Docker Hub:


 Use the docker login command to log in to Docker Hub:

```sh

docker login
Enter your Docker Hub username and password when prompted.
```

<img width="812" alt="Screenshot 2024-05-21 at 14 14 14" src="https://github.com/UdeshyaGhimire/intuji-devops-internship-challenge/assets/76220126/568b1398-f695-4982-bbda-088a5f45334f">

Created a Repo in Dockerhub

<img width="1440" alt="Screenshot 2024-05-19 at 10 20 10" src="https://github.com/UdeshyaGhimire/intuji-devops-internship-challenge/assets/76220126/f2bf9608-6424-48c1-9437-101435e4cc9f">


3) Push Your Docker Image to Docker Hub:


   Use the docker push command to push your tagged image to Docker Hub:

```sh
docker push yourusername/repository-name:tag
```
<img width="1440" alt="Screenshot 2024-05-19 at 10 35 58" src="https://github.com/UdeshyaGhimire/intuji-devops-internship-challenge/assets/76220126/cb16d16c-3f88-422b-99df-8d031c28fdf0">

Successfully Pushed the docker image to the docker hub.


<img width="1440" alt="Screenshot 2024-05-19 at 10 40 11" src="https://github.com/UdeshyaGhimire/intuji-devops-internship-challenge/assets/76220126/c465f3aa-85f0-47a4-bdd5-ee12e8109f38">


# 6) Install Jenkins

1: Install Jenkins


You can install Jenkins using Homebrew by running:

```sh

brew install jenkins
```
![Screenshot 2024-05-20 at 20 49 57](https://github.com/UdeshyaGhimire/intuji-devops-internship-challenge/assets/76220126/8d477ddf-9581-4176-aed8-ac1852263e08)

2: Start Jenkins


Once the installation is complete, you can start Jenkins using the following command:

```sh

brew services start jenkins
```
3: Access Jenkins


By default, Jenkins should be accessible at http://localhost:8080. You can open this URL in your web browser to access the Jenkins web interface.

Step 6: Unlock Jenkins

During the first access, Jenkins will ask for an initial admin password. You can find this password by running:

```sh

cat /usr/local/var/jenkins/home/secrets/initialAdminPassword
```
Copy the password and paste it into the Jenkins web interface to proceed with the setup.
![Screenshot 2024-05-20 at 20 57 17](https://github.com/UdeshyaGhimire/intuji-devops-internship-challenge/assets/76220126/98698f60-b020-4c8c-83fc-369f8e982e2d)

4: Complete Setup
Setup will be completed after you copy the password here.


![Screenshot 2024-05-20 at 20 56 27](https://github.com/UdeshyaGhimire/intuji-devops-internship-challenge/assets/76220126/f0eb473a-918b-41d4-aae3-b62f6219ce90)

# 7) Buildind CI/CD with Jenkins


-Click into New item and select Freestyle Project

![Screenshot 2024-05-20 at 21 45 08 (2)](https://github.com/UdeshyaGhimire/intuji-devops-internship-challenge/assets/76220126/dd1b000d-25d1-4fb3-89bf-87511cf07b13)


Due to some error in the github plugins I could not finish the jenkins task rather i created a pipeline through shell directly and here are the results:

![Screenshot 2024-05-20 at 21 35 47](https://github.com/UdeshyaGhimire/intuji-devops-internship-challenge/assets/76220126/55935b72-c168-4d66-9059-2d378fc4a47e)



![Screenshot 2024-05-20 at 23 02 09](https://github.com/UdeshyaGhimire/intuji-devops-internship-challenge/assets/76220126/a85f3051-a78a-4035-9134-09c9c74f00da)



![Screenshot 2024-05-21 at 14 59 02](https://github.com/UdeshyaGhimire/intuji-devops-internship-challenge/assets/76220126/804bf0c4-ea92-42f3-824d-ef13d9505eee)

![Screenshot 2024-05-21 at 14 52 23](https://github.com/UdeshyaGhimire/intuji-devops-internship-challenge/assets/76220126/53e1c713-f94d-4621-83e9-948c35635b49)

