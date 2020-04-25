<?php

use \Phalcon\Mvc\Router\Group as RouterGroup;

class BookingRoutes extends RouterGroup
{
    public function initialize()
    {
        $this->setPaths([
            'controller' => 'booking',
        ]);

        $this->setPrefix('/booking');

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

        $this->addPost(
            '/check',
            [
                'action'    => 'check',
            ]
        );

        $this->addPost(
            '/show',
            [
                'action'    => 'show',
            ]
        );

        $this->addPost(
            '/approve',
            [
                'action'    => 'approve',
            ]
        );

        $this->addPost(
            '/cancel',
            [
                'action'    => 'cancel',
            ]
        );
    }
}
