<?php

class IndexController extends ControllerBase
{

    public function indexAction()
    {
        $this->assets->addCss("css/app.css");
        $this->assets->addJs("js/app.js");
        
        $this->view->msg = "Nuevo mensaje";

        $this->view->setVars([
            "user" => "jhuancapaza",
            "cursos" => [
                    "Curso angular", "Curso php"
            ]
        ]);

        $this->view->users = Users::find();
    }

}

