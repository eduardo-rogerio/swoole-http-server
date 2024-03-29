<?php
use Swoole\Http\Request;
use Swoole\Http\Response;
use Swoole\Http\Server;

$server = new Server("0.0.0.0", 9501);

$server->on("start", function ($server) {
  echo "Http Server ready at http://127.0.0.1:9501".PHP_EOL;
});

$server->on("request", function (Request $request, Response $response){
  $response->header("Content-type", "text/html");
  $response->end('<h1>Olá Mundo!!</h1>');
});

$server->start();
