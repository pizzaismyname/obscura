<?php

declare(strict_types=1);

class ThemeController extends ControllerBase
{

    public function indexAction()
    { }

    public function createAction()
    { }

    public function storeAction()
    {
        $theme = new Themes();

        $name = $this->request->getPost('name');
        $description = $this->request->getPost('description');
        $extra_price = $this->request->getPost('extra_price');

        $picture_path = 'img/theme/' . $name . '-' . $extra_price . '.jpg';
        if ($this->request->hasFiles()) {
            $picture = $this->request->getUploadedFiles()[0];
            $picture->moveTo($picture_path);
        }

        $theme->name = $name;
        $theme->description = $description;
        $theme->extra_price = $extra_price;
        $theme->picture = $picture_path;

        if ($theme->save() === false) {
            foreach ($theme->getMessages() as $message) {
                echo $message, "\n";
            }
        } else {
            $this->response->redirect('/theme/all');
        }
    }

    public function editAction()
    { }

    public function updateAction()
    { }

    public function destroyAction()
    { }
}
