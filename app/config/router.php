<?php

// $router = $di->getRouter();

// Define your routes here

$di->set(
    'router',
    function () {
        $router = new \Phalcon\Mvc\Router(false);
        $router->clear();

        $router->mount(
            new SessionRoutes()
        );

        /**
         * Default Routing
         */
        $router->add(
            '/',
            [
                'controller' => 'index',
                'action' => 'index'
            ]
        );


        /**
         * Not Found Routing
         */
        $router->notFound(
            [
                'controller' => 'index',
                'action'     => 'show404',
            ]
        );

        return $router;
    }


);

// $router->handle($_SERVER["REQUEST_URI"]);
