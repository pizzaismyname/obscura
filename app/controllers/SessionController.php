<?php

declare(strict_types=1);

class SessionController extends ControllerBase
{

    public function createAction()
    { }

    public function storeAction()
    {
        $email = $this->request->getPost('email');
        $password = $this->request->getPost('password');
        $user = Admins::findFirst("email='$email'");
        if ($user) {
            if (password_verify($password, $user->password)) {
                $this->session->set(
                    'auth',
                    [
                        'id' => $user->id,
                        'name' => $user->name,
                    ]
                );
                $this->response->redirect();
            } else {
                $this->response->redirect('/admin/login');
            }
        } else {
            $this->response->redirect('/admin/login');
        }
    }

    public function destroyAction()
    {
        $this->session->destroy();
        $this->response->redirect();
    }
}
