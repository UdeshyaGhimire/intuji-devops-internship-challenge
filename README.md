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

This repository describes the following:

1.Install Docker in Linux Machine with Bash Scrpiting
  Clone the GitHub repository (https://github.com/silarhi/php-hello-world.git).
2.Dockerize the given Project.
3.Build the image for the project and push it to docker hub.
4.Make docker-compose file for the given project.
5.Install Jenkins
6.Create a freestyle project for building a CI/CD pipeline for the above application which will build artifacts using a docker file directly from your GitHub repo.

Built with: 
-PHP
-Shell
-Dockerfile
-Jenkins


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

2. Update Homebrew
Ensure Homebrew is up-to-date:

