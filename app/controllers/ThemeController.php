<?php

declare(strict_types=1);

class ThemeController extends ControllerBase
{

    public function indexAction()
    {
        $themes = Themes::find();
        $this->view->themes = $themes;
    }

    public function createAction()
    { }

    public function storeAction()
    {
        $name = $this->request->getPost('name');
        $description = $this->request->getPost('description');
        $extra_price = $this->request->getPost('extra_price');

        $theme = new Themes();

        $theme->name = $name;
        $theme->description = $description;
        $theme->extra_price = $extra_price;

        $theme->save();

        $picture_path = 'img/theme/' . $theme->id . "_" . $name . '.jpg';
        if ($this->request->hasFiles()) {
            $picture = $this->request->getUploadedFiles()[0];
            $picture->moveTo($picture_path);
        }

        $theme->picture = $picture_path;

        $theme->save();

        $this->response->redirect('/theme/all');
    }

    public function editAction()
    {
        $id = $this->dispatcher->getParam("id");
        $theme = Themes::findFirst("id = '$id' ");
        $this->view->theme = $theme;
    }

    public function updateAction()
    {
        $id = $this->request->getPost('id');
        $name = $this->request->getPost('name');
        $description = $this->request->getPost('description');
        $extra_price = $this->request->getPost('extra_price');

        $theme = Themes::findFirst("id = '$id'");

        $theme->name = $name;
        $theme->description = $description;
        $theme->extra_price = $extra_price;

        $theme->save();

        $picture_path = 'img/theme/' . $theme->id . "_" . $name . '.jpg';
        if ($this->request->hasFiles()) {
            $picture = $this->request->getUploadedFiles()[0];
            $picture->moveTo($picture_path);
        }

        $theme->picture = $picture_path;

        $theme->save();

        $this->response->redirect('/theme/all');
    }

    public function destroyAction()
    {
        $id = $this->request->getPost('id');
        $theme = Themes::findFirst("id = '$id'");
        $theme->delete();

        $this->response->redirect('/theme/all');
    }
}
