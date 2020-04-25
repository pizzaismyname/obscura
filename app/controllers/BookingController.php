<?php

declare(strict_types=1);

class BookingController extends ControllerBase
{

    public function indexAction()
    { }

    public function createAction()
    {
        $themes = Themes::find();
        $this->view->themes = $themes;
    }

    public function storeAction()
    {
        $name = $this->request->getPost('name');
        $email = $this->request->getPost('email');
        $phone = $this->request->getPost('phone');
        $address = $this->request->getPost('address');
        $date = $this->request->getPost('date');
        $start_time = $this->request->getPost('start_time');
        $end_time = $this->request->getPost('end_time');
        $id_theme = $this->request->getPost('id_theme');
        $status = 0;

        $booking = new Bookings();

        $booking->name = $name;
        $booking->email = $email;
        $booking->phone = $phone;
        $booking->address = $address;
        $booking->date = $date;
        $booking->start_time = $start_time;
        $booking->end_time = $end_time;
        $booking->id_theme = $id_theme;
        $booking->status = $status;

        $booking->save();

        $this->response->redirect();
    }

    public function checkAction()
    {
        $date = $this->request->getPost('date');
        $start_time = $this->request->getPost('start_time');
        $end_time = $this->request->getPost('end_time');

        $bookings = Bookings::find();

        $available = 1;
        foreach ($bookings as $booking) {
            if ($booking->date != $date) {
                continue;
            } else {
                if ($start_time >= $booking->start_time && $start_time <= $booking->end + 30) {
                    $available = 0;
                    break;
                } elseif ($end_time >= $booking->start_time && $end_time <= $booking->end + 30) {
                    $available = 0;
                    break;
                }
            }
        }
        if ($available) {
            $this->view->availability = "Yay! Our studio is available for that time and date. Book Now!";
        } else {
            $this->view->availability = "Sorry, our studio is not available for that time and date.";
        }
        return $this->view->pick(array('index/index'));
        // $this->response->redirect();
    }

    public function showAction()
    {
        $id = $this->request->getPost('id');

        $booking = Bookings::findFirst("id = '$id' ");

        if ($booking == null) {
            $this->view->status = "Sorry, we cannot find a booking with that code or your booking has been cancelled.";
        } else {
            $status = $booking->status;
            if ($status) {
                $this->view->status = "Your booking has been approved.";
            } else {
                $this->view->status = "Your booking is still being processed.";
            }
        }

        return $this->view->pick(array('index/index'));
    }

    public function approveAction()
    { }

    public function cancelAction()
    { }
}
