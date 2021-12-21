# hostdocker

nginx + php + mysql + adminer

```
git clone https://github.com/rainjeck/hostdocker.git .

sudo docker-compose build

sudo docker-compose up -d

sudo chown -R <username>:www-data html && sudo chmod -R 777 html

```

Host: `localhost:5000`

Adminer: `localhost:8080`

---

## WORDPRESS

Use `wordpress.sh` for downloading or:

1. Download latest version & unzip

```
wget https://wordpress.org/latest.tar.gz && tar -xf latest.tar.gz
```

3. Rename `wp-config-sample.php` & dir `wp-content`

```
mv wordpress/wp-content wordpress/assets

mv wordpress/wp-config-sample.php wordpress/wp-config.php
```

4. Setup configuration in `wp-config.php`.

```
define( 'FS_METHOD', 'direct' );

define( 'WP_CONTENT_DIR', dirname(__FILE__) . '/assets' );
define( 'WP_CONTENT_URL', 'http://' . $_SERVER['HTTP_HOST'] . '/assets' );
define( 'WP_PLUGIN_DIR', dirname(__FILE__) . '/assets/plugins' );
define( 'WP_PLUGIN_URL', 'http://' . $_SERVER['HTTP_HOST'] . '/assets/plugins' );
define( 'UPLOADS', 'assets/uploads' );
```

5. Rename dir `wordpress` to `html`.


**Set permissions**

```
sudo chown -R <username>:www-data html && sudo chmod -R 777 html
```


**Create link to theme folder**

```
ln -r -s public/assets/themes/<theme> <link_name>
```