<?php

// namespace ;

use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;

class Bookings extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $id;

    /**
     *
     * @var string
     */
    public $name;

    /**
     *
     * @var string
     */
    public $email;

    /**
     *
     * @var string
     */
    public $phone;

    /**
     *
     * @var string
     */
    public $address;

    /**
     *
     * @var string
     */
    public $date;

    /**
     *
     * @var string
     */
    public $start_time;

    /**
     *
     * @var string
     */
    public $end_time;

    /**
     *
     * @var integer
     */
    public $status;

    /**
     *
     * @var string
     */
    public $price;

    /**
     *
     * @var integer
     */
    public $id_admin;

    /**
     *
     * @var integer
     */
    public $id_theme;

    /**
     * Validations and business logic
     *
     * @return boolean
     */
    public function validation()
    {
        $validator = new Validation();

        $validator->add(
            'email',
            new EmailValidator(
                [
                    'model'   => $this,
                    'message' => 'Please enter a correct email address',
                ]
            )
        );

        return $this->validate($validator);
    }

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("dbo");
        $this->setSource("bookings");
        $this->belongsTo('id_admin', '\Admins', 'id', ['alias' => 'Admins']);
        $this->belongsTo('id_theme', '\Themes', 'id', ['alias' => 'Themes']);
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Bookings[]|Bookings|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null): \Phalcon\Mvc\Model\ResultsetInterface
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Bookings|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
