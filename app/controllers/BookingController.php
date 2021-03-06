<?php

declare(strict_types=1);

class BookingController extends ControllerBase
{

    public function indexAction()
    {
        if (!$this->session->has('auth')) {
            $this->response->redirect();
        }

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
        $check_date = $this->request->getPost('date');
        $check_start_time = $this->request->getPost('start_time');
        $check_end_time = $this->request->getPost('end_time');
        $id_theme = $this->request->getPost('id_theme');
        $status = 0;

        $bookings = Bookings::find();

        $available = 1;

        if ($check_date == null || $check_start_time == null || $check_end_time == null) {
            $available = 0;
        } else {
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
        }

        if ($available) {
            $date = $check_date;
            $start_time = $check_start_time;
            $end_time = $check_end_time;
        } else {
            $this->flashSession->error('Sorry, our studio is not available for that time and date.');

            return $this->dispatcher->forward(
                [
                    "controller" => "booking",
                    "action"     => "create",
                ]
            );
        }

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

        if ($booking->save()) {
            $this->view->booking = $booking;
            $this->view->hours = $hours;
            $this->view->minutes = $minutes;

            return $this->view->pick(array('booking/invoice'));
        } else {
            $messages = $booking->getMessages();
            $this->view->messages = $messages;

            return $this->dispatcher->forward(
                [
                    "controller" => "booking",
                    "action"     => "create",
                ]
            );
        }
    }

    public function invoiceAction()
    { }

    public function checkAction()
    {
        $check_date = $this->request->getPost('date');
        $check_start_time = $this->request->getPost('start_time');
        $check_end_time = $this->request->getPost('end_time');

        $bookings = Bookings::find();

        $available = 1;

        if ($check_date == null || $check_start_time == null || $check_end_time == null) {
            $available = 0;
        } else {
            foreach ($bookings as $booking) {
                $date = $booking->date;
                if ($date != $check_date) {
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
        }
        if ($available) {
            $this->flashSession->notice('Yay! Our studio is available for that time and date. Book Now!');
        } else {
            $this->flashSession->notice('Sorry, our studio is not available for that time and date.');
        }
        return $this->view->pick(array('index/index'));
    }

    public function showAction()
    {
        $id = $this->request->getPost('id');

        $booking = Bookings::findFirst("id = '$id' ");

        if ($booking == null) {
            $this->flashSession->error('Sorry, we cannot find a booking with that code or your booking has been cancelled.');
        } else {
            $status = $booking->status;
            if ($status) {
                $this->flashSession->success('Your booking has been approved.');
            } else {
                $this->flashSession->warning('Your booking is still being processed.');
            }
        }

        return $this->view->pick(array('index/index'));
    }

    public function approveAction()
    {
        if (!$this->session->has('auth')) {
            $this->response->redirect();
        }

        $id = $this->request->getPost('id');
        $booking = Bookings::findFirst("id = '$id'");
        $booking->status = 1;
        $booking->id_admin = $this->session->get('auth')['id'];
        $booking->save();

        $this->response->redirect('booking/all');
    }

    public function cancelAction()
    {
        if (!$this->session->has('auth')) {
            $this->response->redirect();
        }

        $id = $this->request->getPost('id');
        $booking = Bookings::findFirst("id = '$id'");
        $booking->delete();

        $this->response->redirect('booking/all');
    }
}
