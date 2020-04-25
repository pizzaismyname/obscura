<?php

declare(strict_types=1);

class AdminController extends ControllerBase
{

    public function homeAction()
    {
        if (!$this->session->has('auth')) {
            $this->response->redirect();
        }
    }

    public function indexAction()
    {
        if (!$this->session->has('auth')) {
            $this->response->redirect();
        }
        $admins = Admins::find();
        $this->view->admins = $admins;
    }

    public function createAction()
    {
        if (!$this->session->has('auth')) {
            $this->response->redirect();
        }
    }

    public function storeAction()
    {
        if (!$this->session->has('auth')) {
            $this->response->redirect();
        }

        $name = $this->request->getPost('name');
        $email = $this->request->getPost('email');
        $phone = $this->request->getPost('phone');
        $password = $this->request->getPost('password');
        $cpassword = $this->request->getPost('cpassword');

        $admin = new Admins();

        $admin->name = $name;
        $admin->email = $email;
        $admin->phone = $phone;
        $this->view->message = "";
        if ($password == $cpassword) {
            $password = password_hash($password, PASSWORD_DEFAULT);
            $admin->password = $password;
            $admin->save();
            $this->response->redirect('/admin/all');
        } else {
            $this->view->message = "The password confirmation does not match.";
            return $this->view->pick(array('admin/create'));
        }
    }

    public function editAction()
    {
        if (!$this->session->has('auth')) {
            $this->response->redirect();
        }

        $id = $this->dispatcher->getParam("id");
        $admin = Admins::findFirst("id = '$id' ");
        $this->view->admin = $admin;
    }

    public function updateAction()
    {
        if (!$this->session->has('auth')) {
            $this->response->redirect();
        }

        $id = $this->request->getPost('id');
        $name = $this->request->getPost('name');
        $email = $this->request->getPost('email');
        $phone = $this->request->getPost('phone');
        $password = $this->request->getPost('password');
        $cpassword = $this->request->getPost('cpassword');

        $admin = Admins::findFirst("id = '$id'");

        $admin->name = $name;
        $admin->email = $email;
        $admin->phone = $phone;
        $this->view->message = "";
        if ($password != null || $cpassword != null) {
            if ($password == $cpassword) {
                $password = password_hash($password, PASSWORD_DEFAULT);
                $admin->password = $password;
                $admin->save();
                $this->response->redirect('/admin/all');
            } else {
                $this->view->message = "The password confirmation does not match.";
                return $this->view->pick(array('admin/create'));
            }
        } else {
            $admin->save();
            $this->response->redirect('/admin/all');
        }
    }

    public function destroyAction()
    {
        if (!$this->session->has('auth')) {
            $this->response->redirect();
        }

        $id = $this->dispatcher->getParam("id");
        $admin = Admins::findFirst("id = '$id' ");
        $admin->delete();
        $this->response->redirect('/admin/all');
    }
}
