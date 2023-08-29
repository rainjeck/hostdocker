# hostdocker

nginx + php + mysql + adminer

1. `git clone https://github.com/rainjeck/hostdocker.git .`

2. `sudo docker-compose build`

3. `docker-compose up -d`

4. `sudo chown -R <user>:www-data html && sudo chmod -R 777 html`

5. Copy `php.ini` from fpm-container:

    `docker cp <container_id>:/usr/local/etc/php/php.ini-production ./docker/php.ini`

6. php settings:
    ```
    date.timezone = Europe/Moscow
    session.gc_probability = 1
    session.gc_divisor = 100 or 1000
    session.gc_maxlifetime = 1440

    max_input_time = 300
    max_execution_time = 300

    memory_limit = 1024M
    post_max_size = 100M
    upload_max_filesize = 90M
    ```

7. Uncomment option in `docker-compose.yml`

8. Restart docker-compose

9. bash in container: `docker exec -it <container> sh`
---

Host: `mydev.dv`, `localhost:5000`

Adminer: `localhost:8080`

---

## WORDPRESS

Use `wordpress.sh` for downloading or:

1. Download latest version & unzip:

    `wget https://wordpress.org/latest.tar.gz && tar -xf latest.tar.gz`

2. Rename `wp-config-sample.php` to `wp-config.php`

    `mv wordpress/wp-config-sample.php wordpress/wp-config.php`

3. Rename dir `wp-content` to `assets`

    `mv wordpress/wp-content wordpress/assets`

4. Setup configuration in `wp-config.php`:

    ```
    define( 'WP_DEBUG_LOG', dirname(__FILE__) . '/_errors.log' );
    define( 'WP_DEBUG_DISPLAY', false );

    define( 'FS_METHOD', 'direct' );

    define( 'WP_SITEURL', "{$_SERVER['REQUEST_SCHEME']}://{$_SERVER['HTTP_HOST']}" );
    define( 'WP_HOME', "{$_SERVER['REQUEST_SCHEME']}://{$_SERVER['HTTP_HOST']}" );

    define( 'WP_CONTENT_DIR', dirname(__FILE__) . '/assets' );
    define( 'WP_CONTENT_URL', "{$_SERVER['REQUEST_SCHEME']}://{$_SERVER['HTTP_HOST']}/assets" );

    define( 'WP_PLUGIN_DIR', dirname(__FILE__) . '/assets/plugins' );
    define( 'WP_PLUGIN_URL', "{$_SERVER['REQUEST_SCHEME']}://{$_SERVER['HTTP_HOST']}/assets/plugins" );

    define( 'UPLOADS', 'assets/uploads' );

    define( 'WP_POST_REVISIONS', false );

    define( 'DISABLE_WP_CRON', true );
    define( 'WP_CRON_LOCK_TIMEOUT', 60 );
    ```

5. Rename dir `wordpress` to `html`.

6. Set permissions: `sudo chown -R <user>:www-data html && sudo chmod -R 777 html`

**Create link to theme folder:**

`ln -r -s html/assets/themes/<theme> <link_name>`

---
[Wordpress Theme Template](https://github.com/rainjeck/wordpress)
