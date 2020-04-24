<?php

use \Phalcon\Mvc\Router\Group as RouterGroup;

class themeRoutes extends RouterGroup
{
    public function initialize()
    {
        $this->setPaths([
            'controller' => 'theme',
        ]);

        $this->setPrefix('/theme');

        $this->addGet(
            '/all',
            [
                'action'    => 'index'
            ]
        );

        $this->addGet(
            '/add',
            [
                'action'    => 'create',
            ]
        );

        $this->addPost(
            '/add',
            [
                'action'    => 'store',
            ]
        );

        $this->addGet(
            '/edit/{id}',
            [
                'action'    => 'edit',
            ]
        );

        $this->addPost(
            '/edit',
            [
                'action'    => 'update',
            ]
        );

        $this->addPost(
            '/delete',
            [
                'action'    => 'destroy',
            ]
        );
    }
}
