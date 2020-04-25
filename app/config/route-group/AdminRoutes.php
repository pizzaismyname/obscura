<?php

use \Phalcon\Mvc\Router\Group as RouterGroup;

class AdminRoutes extends RouterGroup
{
    public function initialize()
    {
        $this->setPaths([
            'controller' => 'admin',
        ]);

        $this->setPrefix('/admin');

        $this->addGet(
            '/dashboard',
            [
                'action'    => 'home'
            ]
        );

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
