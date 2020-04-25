<?php

declare(strict_types=1);

class BookingController extends ControllerBase
{

    public function indexAction()
    {
        $bookings = Bookings::find();
        $this->view->bookings = $bookings;
    }

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

        $theme = Themes::findFirst("id = '$id_theme' ");

        $start = new DateTime($start_time);
        $end = new DateTime($end_time);
        $duration = $start->diff($end);
        $hours = $duration->format("%H");
        $minutes = $duration->format("%i");
        if ($hours <= 1) {
            $price = 100000 + $theme->extra_price;
        } else {
            $price = $hours * 100000 + $theme->extra_price;
        }
        $extra_minutes = $minutes % 60;
        if ($extra_minutes > 0) {
            $price = $price + 100000;
        }

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
        $booking->price = $price;

        $booking->save();

        $this->view->code = $booking->id;
        $this->view->booking = $booking;
        $this->view->hours = $hours;
        $this->view->minutes = $minutes;

        return $this->view->pick(array('booking/invoice'));
    }

    public function invoice()
    { }

    public function checkAction()
    {
        $check_date = $this->request->getPost('date');
        $check_start_time = $this->request->getPost('start_time');
        $check_end_time = $this->request->getPost('end_time');

        $bookings = Bookings::find();

        $available = 1;

        foreach ($bookings as $booking) {
            if ($booking->date != $check_date) {
                continue;
            } else {

                $start = strtotime($booking->start_time);
                $start_time = date("H:i", strtotime('-0 minutes', $start));
                $end = strtotime($booking->end_time);
                $end_time = date("H:i", strtotime('+30 minutes', $end));

                if ($check_start_time >= $start_time && $check_start_time <= $end_time) {
                    $available = 0;
                    break;
                } elseif ($check_end_time >= $start_time && $check_end_time <= $end_time) {
                    $available = 0;
                    break;
                } elseif ($check_start_time <= $start_time && $check_end_time >= $end_time) {
                    $available = 0;
                    break;
                }
            }
        }
        $this->view->availability = "";
        if ($available) {
            $this->view->availability = "Yay! Our studio is available for that time and date. Book Now!";
        } else {
            $this->view->availability = "Sorry, our studio is not available for that time and date.";
        }
        return $this->view->pick(array('index/index'));
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
    {
        $id = $this->request->getPost('id');
        $booking = Bookings::findFirst("id = '$id'");
        $booking->status = 1;
        $booking->id_admin = $this->session->get('auth')['id'];
        $booking->save();

        $this->response->redirect('booking/all');
    }

    public function cancelAction()
    {
        $id = $this->request->getPost('id');
        $booking = Bookings::findFirst("id = '$id'");
        $booking->delete();

        $this->response->redirect('booking/all');
    }
}
