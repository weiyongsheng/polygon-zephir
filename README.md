polygon-zephir
======

point in polygon, in zephir

zephir
------
[Zephir](https://github.com/phalcon/zephir) is a compiled high level language aimed to the creation of C-extensions for PHP.


Usage
------

```bash
zephir build
```

Created `polygon.so` file.
Add `extension=polygon.so` to your php.ini.
Don't forget to restart your web server.

PHP Usage
------

[polygon in php](https://github.com/weiyongsheng/polygon)

```php
$polygon = new Polygon\Polygon([
    [0, 0],
    [0, 1],
    [1, 1],
    [1, 0],
]);
var_dump($polygon->contain(0.5, 0.5)); // return bool(true)
```
