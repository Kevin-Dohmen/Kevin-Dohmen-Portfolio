<?php
# this is the config file that will be used to store the database credentials and other configurations
# directory: site/includes/config.php
class Config {
    public static function get($key) {
        $config = [
            "db" => [
                "host" => "",
                "username" => "",
                "password" => "",
                "database" => ""
            ]
        ];
        return $config[$key];
    }
}