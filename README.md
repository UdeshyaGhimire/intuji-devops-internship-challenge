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
