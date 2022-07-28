<?php
use Phalcon\Mvc\Router;
$router = new Router();

$router->add(
    "/login",
    [
        "controller"=>"index",
        "action"=>"login"
    ]
    )->setName("login");

$router->add(
    "/app/:action",
    [
        "controller"=>"index",
        "action"=>1
    ]
    );
return $router;