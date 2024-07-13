<?php
use Swoole\Http\Request;
use Swoole\Http\Response;
use Swoole\Http\Server;

$server = new Server("0.0.0.0", 9501);

$server->on("start", function ($server) {
  echo "Http Server ready at http://127.0.0.1:9501".PHP_EOL;
});

$server->on("request", function (Request $request, Response $response){
  $params = [];
  $name = 'Mundo';

  if(isset($request->server['query_string'])){
    parse_str($request->server['query_string'], $params);
  }
  
  if(isset($params['name'])){
    $name = $params['name'];
  }

  $response->header("Content-type", "text/html");
  $response->end('<h1>Olá '.$name.' !!</h1>');
});

$server->start();
