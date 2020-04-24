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
            '/new',
            [
                'action'    => 'create',
            ]
        );

        $this->addPost(
            '/new',
            [
                'action'    => 'store',
            ]
        );

        $this->addGet(
            '/change/{id}',
            [
                'action'    => 'edit',
            ]
        );

        $this->addPost(
            '/change',
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
