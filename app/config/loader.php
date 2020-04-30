<?php

$loader = new \Phalcon\Loader();

$loader->registerDirs(array(

    /**
     * We're a registering a set of directories taken from the configuration file
     */
    $config->application->controllersDir,
    $config->application->modelsDir,
    $config->application->routesDir
));

$loader->registerNamespaces(array(

    /**
     * Load SQL server db adapter namespace
     */
    'Phalcon\Db\Adapter\Pdo' => APP_PATH . '/library/Phalcon/Db/Adapter/Pdo',
    'Phalcon\Db\Dialect' => APP_PATH . '/library/Phalcon/Db/Dialect',
    'Phalcon\Db\Result' => APP_PATH . '/library/Phalcon/Db/Result',

));

$loader->register();