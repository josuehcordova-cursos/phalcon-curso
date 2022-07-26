<?php

class IndexController extends ControllerBase
{

    public function indexAction()
    {
        $this->view->msg = "Nuevo mensaje";

        $this->view->setVars([
            "user" => "jhuancapaza",
            "cursos" => [
                    "Curso angular", "Curso php"
            ]
        ]);
    }

}

