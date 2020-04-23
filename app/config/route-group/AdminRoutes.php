<?php

use \Phalcon\Mvc\Router\Group as RouterGroup;

class SessionRoutes extends RouterGroup
{
    public function initialize()
    {
        $this->setPaths([
            'controller' => 'session',
        ]);

        $this->setPrefix('/admin');
    }
}
