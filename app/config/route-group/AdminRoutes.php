<?php

use \Phalcon\Mvc\Router\Group as RouterGroup;

class AdminRoutes extends RouterGroup
{
    public function initialize()
    {
        $this->setPaths([
            'controller' => 'admin',
        ]);
        $this->addGet(
            '/login',
            [
                'action'    => 'create',
            ]
        );

        $this->addPost(
            '/login',
            [
                'action'    => 'store',
            ]
        );

        $this->addGet(
            '/logout',
            [
                'action'    => 'destroy',
            ]
        );
    }
}
